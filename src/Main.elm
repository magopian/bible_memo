module Main exposing (..)

import Dict
import Dom
import Html
import Html.Attributes
import Html.Events
import Json.Decode
import Random
import Random.List
import Task
import Verses


---- MODEL ----


type alias WordChoices =
    Dict.Dict Int String


type ChosenDataset
    = Unknown
    | VerseData Verses.Verse (List Verses.Verse)


type alias Model =
    { verseData : ChosenDataset
    , wordChoices : WordChoices
    , seed : Random.Seed
    }


type alias Flags =
    { initialSeed : Int }


init : Flags -> ( Model, Cmd Msg )
init { initialSeed } =
    ( { verseData =
            Unknown
      , wordChoices = Dict.empty
      , seed = Random.initialSeed initialSeed
      }
    , Cmd.none
    )


shuffleList : List a -> Random.Seed -> ( List a, Random.Seed )
shuffleList list seed =
    seed
        |> Random.step (Random.List.shuffle list)


pickVerse : List Verses.Verse -> ( Verses.Verse, List Verses.Verse )
pickVerse verseList =
    case verseList of
        head :: tail ->
            ( head, tail )

        [] ->
            Debug.crash "no verses!"


shuffleVerseWords : Verses.Verse -> Random.Seed -> ( Verses.Verse, Random.Seed )
shuffleVerseWords verse seed =
    let
        -- Shuffle the list of words to choose.
        ( wordsShuffled, newSeed ) =
            shuffleList verse.withHoles.words seed

        -- Use that shuffled list in place of the one we had in the verse.
        withHolesShuffledWords =
            { text = verse.withHoles.text, words = wordsShuffled }
    in
        ( { verse | withHoles = withHolesShuffledWords }, newSeed )



---- UPDATE ----


type Msg
    = WordChosen Int String
    | NextVerse
    | Focused (Result Dom.Error ())
    | DatasetChosen Verses.Dataset


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DatasetChosen ( title, verseList ) ->
            let
                ( shuffledVerseList, seed ) =
                    shuffleList verseList model.seed

                ( newVerse, remainingVerseList, newSeed ) =
                    pickAndShuffle shuffledVerseList seed
            in
                ( { model
                    | verseData = VerseData newVerse remainingVerseList
                    , wordChoices = Dict.empty
                    , seed = newSeed
                  }
                , Task.attempt Focused (Dom.focus "select-0")
                )

        WordChosen selectNumber wordChosen ->
            ( { model
                | wordChoices =
                    Dict.insert selectNumber wordChosen model.wordChoices
              }
            , Cmd.none
            )

        NextVerse ->
            case model.verseData of
                Unknown ->
                    ( model, Cmd.none )

                VerseData verse verseList ->
                    let
                        fullList =
                            verseList ++ [ verse ]

                        ( newVerse, remainingVerseList, newSeed ) =
                            pickAndShuffle fullList model.seed
                    in
                        ( { model
                            | verseData = VerseData newVerse remainingVerseList
                            , wordChoices = Dict.empty
                            , seed = newSeed
                          }
                        , Task.attempt Focused (Dom.focus "select-0")
                        )

        Focused _ ->
            ( model, Cmd.none )


pickAndShuffle : List Verses.Verse -> Random.Seed -> ( Verses.Verse, List Verses.Verse, Random.Seed )
pickAndShuffle verseList seed =
    let
        ( newVerse, remainingVerseList ) =
            pickVerse verseList

        ( shuffledVerse, newSeed ) =
            shuffleVerseWords newVerse seed
    in
        ( shuffledVerse, remainingVerseList, newSeed )



---- VIEW ----


view : Model -> Html.Html Msg
view model =
    let
        content =
            case model.verseData of
                Unknown ->
                    Html.div []
                        [ Html.text "No data set chosen yet, pick one below"
                        ]

                VerseData verse verseList ->
                    Html.div []
                        [ viewVerse verse model.wordChoices
                        , viewResult verse model.wordChoices
                        ]
    in
        Html.div []
            [ content
            , viewDataSets Verses.datasets
            ]


viewDataSets : Verses.Datasets -> Html.Html Msg
viewDataSets datasets =
    Html.ul []
        (datasets
            |> List.map
                (\( title, verselist ) ->
                    Html.li []
                        [ Html.a
                            [ Html.Attributes.href "#"
                            , Html.Events.onClick <| DatasetChosen ( title, verselist )
                            ]
                            [ Html.text title ]
                        ]
                )
        )


viewVerse : Verses.Verse -> WordChoices -> Html.Html Msg
viewVerse { reference, withHoles } wordChoices =
    let
        htmlTextWithHoles =
            -- Make all the "text with holes" parts into Html.text nodes
            List.map Html.text withHoles.text

        selects =
            -- Make a select with the list of words to choose from... for all the words to choose from
            List.indexedMap (\index _ -> wordChoiceSelect index withHoles.words (Dict.get index wordChoices)) withHoles.words
    in
        Html.div []
            [ Html.h1 []
                [ Html.text reference
                ]
            , Html.p [] <| zipLists htmlTextWithHoles selects
            ]


viewResult : Verses.Verse -> WordChoices -> Html.Html Msg
viewResult { text, withHoles } wordChoices =
    let
        reconstituded =
            reconstituteVerse withHoles.text
                wordChoices
    in
        Html.div []
            [ if reconstituded == text then
                Html.text "CONGRATULATIONS! Would you like to "
              else
                Html.text "Select the correct words from the lists to complete the verse, or "
            , Html.button
                [ Html.Events.onClick NextVerse
                , Html.Attributes.id "another-verse"
                ]
                [ Html.text "display another verse" ]
            ]


reconstituteVerse : List String -> WordChoices -> String
reconstituteVerse withHoles wordChoices =
    let
        words =
            Dict.toList wordChoices
                |> List.sort
                |> List.map (\( _, word ) -> word)

        textParts =
            zipLists withHoles words
    in
        String.join "" textParts


zipLists : List a -> List a -> List a
zipLists htmlTextWithHoles selects =
    case ( htmlTextWithHoles, selects ) of
        ( [], [] ) ->
            []

        ( firstSplit :: restOfSplits, [] ) ->
            firstSplit :: zipLists restOfSplits []

        ( [], firstSelect :: restOfSelects ) ->
            firstSelect :: zipLists [] restOfSelects

        ( firstSplit :: restOfSplits, firstSelect :: restOfSelects ) ->
            firstSplit :: firstSelect :: zipLists restOfSplits restOfSelects


wordChoiceSelect : Int -> List String -> Maybe String -> Html.Html Msg
wordChoiceSelect index words maybeSelectedWord =
    Html.select
        [ Html.Events.on
            "change"
            (Json.Decode.map (WordChosen index) Html.Events.targetValue)
        , Html.Attributes.value <| Maybe.withDefault "-choose a word-" maybeSelectedWord
        , Html.Attributes.id <| "select-" ++ (toString index)
        , Html.Attributes.size <| (List.length words) + 1
        ]
        (Html.option
            [ Html.Attributes.value "-choose a word-"
            ]
            []
            :: (List.map
                    (\word -> Html.option [ Html.Attributes.value word ] [ Html.text word ])
                    words
               )
        )



---- PROGRAM ----


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
