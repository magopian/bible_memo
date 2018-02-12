module Main exposing (..)

import Dict
import Html
import Html.Attributes
import Html.Events
import Json.Decode
import Random
import Random.List


---- Verses ----


verses : List Verse
verses =
    [ Verse
        "John 3:16"
        "For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life."
        (TextWithHoles
            [ "For ", " so loved the ", " that he gave his one and only ", ", that whoever believes in him shall not perish but have eternal ", "." ]
            [ "God", "world", "Son", "life" ]
        )
    , Verse
        "Jer 29:11"
        "“For I know the plans I have for you,” declares the LORD, “plans to prosper you and not to harm you, plans to give you hope and a future”."
        (TextWithHoles
            [ "“For I know the ", " I have for you,” declares the ", ", “plans to ", " you and not to harm you, plans to give you ", " and a ", "”." ]
            [ "plans", "LORD", "prosper", "hope", "future" ]
        )
    , Verse
        "Rom 8:28"
        "And we know that in all things God works for the good of those who love him, who have been called according to his purpose."
        (TextWithHoles
            [ "And we know that in all ", " God works for the ", " of those who ", " him, who have been ", " according to his ", "." ]
            [ "things", "good", "love", "called", "purpose" ]
        )
    , Verse
        "Phil 4:13"
        "I can do everything through him who gives me strength."
        (TextWithHoles
            [ "I can do ", " ", " him who gives me ", "." ]
            [ "everything", "through", "strength" ]
        )
    , Verse
        "Gen 1:1"
        "In the beginning God created the heavens and the earth."
        (TextWithHoles
            [ "In the ", " God ", "  the ", " and the ", "." ]
            [ "beginning", "created", "heavens", "earth" ]
        )
    , Verse
        "Prov 3:5"
        "Trust in the LORD with all your heart and lean not on your own understanding."
        (TextWithHoles
            [ "Trust in the ", " with all your ", " and ", " not on your own ", "." ]
            [ "LORD", "heart", "lean", "understanding" ]
        )
    ]



---- MODEL ----


type alias Reference =
    String


type alias Verse =
    { reference : Reference
    , text : String
    , withHoles : TextWithHoles
    }


type alias TextWithHoles =
    { text : List String
    , words : List String
    }


type alias WordChoices =
    Dict.Dict Int String


type alias Model =
    { verse : Verse
    , verseList : List Verse
    , wordChoices : WordChoices
    , seed : Random.Seed
    }


init : ( Model, Cmd Msg )
init =
    let
        initialSeed =
            -- TODO take the current time as the initial seed
            Random.initialSeed 12345

        ( ( maybeVerse, versesWithoutChosen ), seed ) =
            -- Random.List.choose will return one random element from the list
            -- and the remaining list.
            initialSeed
                |> Random.step (Random.List.choose verses)

        verse =
            case maybeVerse of
                Just v ->
                    v

                Nothing ->
                    Debug.crash "No verse!"

        ( wordsShuffled, newSeed ) =
            -- Shuffle the list of words to choose.
            seed
                |> Random.step (Random.List.shuffle verse.withHoles.words)

        withHolesShuffledWords =
            -- Use that shuffled list in place of the one we had in the verse.
            { text = verse.withHoles.text, words = wordsShuffled }
    in
        ( { verse = { verse | withHoles = withHolesShuffledWords }
          , verseList = versesWithoutChosen
          , wordChoices = Dict.empty
          , seed = newSeed
          }
        , Cmd.none
        )



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


pickRandomVerse : List Verse -> Random.Seed -> ( Maybe Verse, List Verse, Random.Seed )
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


shuffleVerseWords : Maybe Verse -> Random.Seed -> ( Maybe Verse, Random.Seed )
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



---- VIEW ----


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ viewVerse model.verse
        , viewResult model.verse model.wordChoices
        ]


viewVerse : Verse -> Html.Html Msg
viewVerse { reference, withHoles } =
    let
        htmlTextWithHoles =
            -- Make all the "text with holes" parts into Html.text nodes
            List.map Html.text withHoles.text

        selects =
            -- Make a select with the list of words to choose from... for all the words to choose from
            List.indexedMap (\index _ -> wordChoiceSelect index withHoles.words) withHoles.words
    in
        Html.div []
            [ Html.h1 []
                [ Html.text reference
                ]
            , Html.p [] <| zipLists htmlTextWithHoles selects
            ]


viewResult : Verse -> WordChoices -> Html.Html Msg
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


wordChoiceSelect : Int -> List String -> Html.Html Msg
wordChoiceSelect index words =
    Html.select
        [ Html.Events.on
            "change"
            (Json.Decode.map (WordChosen index) Html.Events.targetValue)
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
