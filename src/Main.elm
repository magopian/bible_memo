module Main exposing (..)

import Dict
import Html
import Html.Attributes
import Html.Events
import Json.Decode


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


type alias Model =
    { verse : Verse
    , wordChoices : Dict.Dict Int String
    }


init : ( Model, Cmd Msg )
init =
    ( { verse =
            Verse
                "John 3:16"
                "For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life."
                (TextWithHoles
                    [ "For ", " so loved the ", " that he gave his one and only ", ", that whoever believes in him shall not perish but have eternal ", "." ]
                    [ "God", "world", "Son", "life" ]
                )
      , wordChoices = Dict.empty
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


zipLists : List (Html.Html Msg) -> List (Html.Html Msg) -> List (Html.Html Msg)
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
