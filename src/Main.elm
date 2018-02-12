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
        if reconstituded == text then
            Html.div [] [ Html.text "CONGRATULATIONS!" ]
        else
            Html.div []
                [ Html.em []
                    [ Html.text "Select the correct words from the lists to complete the verse"
                    ]
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
