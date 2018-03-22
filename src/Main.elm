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
    = WordChosen String
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
                , Task.attempt Focused (Dom.focus "choice-0")
                )

        WordChosen word ->
            case model.verseData of
                Unknown ->
                    ( model, Cmd.none )

                VerseData { withHoles } _ ->
                    let
                        words =
                            withHoles.words

                        wordsLength =
                            List.length words

                        findFirstHole : WordChoices -> Int -> Int
                        findFirstHole wordChoices tryIndex =
                            if tryIndex >= (wordsLength - 1) then
                                tryIndex
                            else
                                case (Dict.get tryIndex wordChoices) of
                                    Nothing ->
                                        tryIndex

                                    _ ->
                                        findFirstHole wordChoices (tryIndex + 1)

                        firstHole =
                            findFirstHole model.wordChoices 0
                    in
                        ( { model
                            | wordChoices =
                                Dict.insert firstHole word model.wordChoices
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
                        , Task.attempt Focused (Dom.focus "choice-0")
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
                        , viewWordList verse model.wordChoices
                        , viewResult verse model.wordChoices
                        ]
    in
        Html.div []
            [ content
            , Html.hr [] []
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

        placeholderOrWord : Maybe String -> Html.Html Msg
        placeholderOrWord maybeWord =
            case maybeWord of
                Nothing ->
                    Html.span [ Html.Attributes.style [ ( "display", "inline-block" ), ( "min-width", "2em" ), ( "border-bottom", "1px solid" ) ] ] []

                Just word ->
                    Html.span [ Html.Attributes.style [ ( "border-bottom", "1px solid" ) ] ] [ Html.text word ]

        choices =
            -- Display either the chosen word or an empty placeholder for each word
            List.indexedMap (\index _ -> placeholderOrWord (Dict.get index wordChoices)) withHoles.words
    in
        Html.div []
            [ Html.h1 []
                [ Html.text reference
                ]
            , Html.p [] <| zipLists htmlTextWithHoles choices
            ]


viewWordList : Verses.Verse -> WordChoices -> Html.Html Msg
viewWordList { withHoles } wordChoices =
    Html.div [] <|
        List.indexedMap
            (\index word ->
                Html.button
                    [ Html.Events.onClick <| WordChosen word
                    , Html.Attributes.id <| "choice-" ++ (toString index)
                    ]
                    [ Html.text word ]
            )
            withHoles.words


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
                Html.text "Click the words from the list above to complete the verse in order, or "
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
zipLists list1 list2 =
    case ( list1, list2 ) of
        ( [], [] ) ->
            []

        ( list1Head :: list1Tail, [] ) ->
            list1Head :: zipLists list1Tail []

        ( [], list2Head :: list2Tail ) ->
            list2Head :: zipLists [] list2Tail

        ( list1Head :: list1Tail, list2Head :: list2Tail ) ->
            list1Head :: list2Head :: zipLists list1Tail list2Tail



---- PROGRAM ----


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
