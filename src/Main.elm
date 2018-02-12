module Main exposing (..)

import Dict
import Html
import Html.Attributes
import Html.Events
import Json.Decode
import Random
import Random.List
import Verses


---- MODEL ----


type alias WordChoices =
    Dict.Dict Int String


type alias Model =
    { verse : Verses.Verse
    , verseList : List Verses.Verse
    , wordChoices : WordChoices
    , seed : Random.Seed
    }


init : ( Model, Cmd Msg )
init =
    let
        initialSeed =
            -- TODO take the current time as the initial seed
            Random.initialSeed 12345

        ( verse, verseList, newSeed ) =
            pickRandomVerse Verses.verses initialSeed

        unpackedVerse =
            case verse of
                Just verse ->
                    verse

                Nothing ->
                    Debug.crash "no verses!"
    in
        ( { verse = unpackedVerse
          , verseList = verseList
          , wordChoices = Dict.empty
          , seed = newSeed
          }
        , Cmd.none
        )


pickRandomVerse : List Verses.Verse -> Random.Seed -> ( Maybe Verses.Verse, List Verses.Verse, Random.Seed )
pickRandomVerse verses seed =
    let
        ( ( maybeVerse, versesWithoutChosen ), newSeed ) =
            -- Random.List.choose will return one random element from the list
            -- and the remaining list.
            seed
                |> Random.step (Random.List.choose verses)

        ( maybeShuffledVerse, updatedNewSeed ) =
            shuffleVerseWords maybeVerse newSeed
    in
        ( maybeShuffledVerse, versesWithoutChosen, updatedNewSeed )


shuffleVerseWords : Maybe Verses.Verse -> Random.Seed -> ( Maybe Verses.Verse, Random.Seed )
shuffleVerseWords maybeVerse seed =
    case maybeVerse of
        Just verse ->
            let
                ( wordsShuffled, newSeed ) =
                    -- Shuffle the list of words to choose.
                    seed
                        |> Random.step (Random.List.shuffle verse.withHoles.words)

                withHolesShuffledWords =
                    -- Use that shuffled list in place of the one we had in the verse.
                    { text = verse.withHoles.text, words = wordsShuffled }
            in
                ( Just { verse | withHoles = withHolesShuffledWords }, newSeed )

        Nothing ->
            ( Nothing, seed )



---- UPDATE ----


type Msg
    = WordChosen Int String
    | NextVerse


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WordChosen optionNumber wordChosen ->
            ( { model
                | wordChoices =
                    Dict.insert optionNumber wordChosen model.wordChoices
              }
            , Cmd.none
            )

        NextVerse ->
            let
                ( newVerse, newVerseList, newSeed ) =
                    pickRandomVerse model.verseList model.seed

                ( updatedVerse, updatedVerseList ) =
                    case newVerse of
                        Just verse ->
                            -- Previous verse goes back in the list.
                            ( verse, model.verse :: newVerseList )

                        Nothing ->
                            -- Nothing changes.
                            ( model.verse, model.verseList )
            in
                ( { model
                    | verse = updatedVerse
                    , verseList = updatedVerseList
                    , wordChoices = Dict.empty
                    , seed = newSeed
                  }
                , Cmd.none
                )



---- VIEW ----


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ viewVerse model.verse model.wordChoices
        , viewResult model.verse model.wordChoices
        ]


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
        words =
            Dict.toList wordChoices
                |> List.sort
                |> List.map (\( _, word ) -> word)

        textParts =
            zipLists withHoles.text words

        reconstituded =
            String.join "" textParts
    in
        Html.div []
            [ if reconstituded == text then
                Html.text "CONGRATULATIONS! Would you like to "
              else
                Html.text "Select the correct words from the lists to complete the verse, or "
            , Html.button [ Html.Events.onClick NextVerse ]
                [ Html.text "display another verse" ]
            ]


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
        , Html.Attributes.value <| Maybe.withDefault "" maybeSelectedWord
        ]
        (Html.option [ Html.Attributes.value "" ] []
            :: (List.map
                    (\word -> Html.option [ Html.Attributes.value word ] [ Html.text word ])
                    words
               )
        )



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
