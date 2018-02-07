module Main exposing (..)

import Html


---- MODEL ----


type alias Reference =
    String


type alias TextContent =
    String


type alias Verse =
    { reference : Reference
    , text : TextContent
    }


type alias Model =
    { verse : Verse }


init : ( Model, Cmd Msg )
init =
    ( { verse =
            Verse
                "John 3:16"
                "For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life."
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ viewText model.verse
        ]


viewText : Verse -> Html.Html Msg
viewText bibleText =
    Html.p []
        [ Html.em []
            [ Html.text bibleText.reference
            ]
        , Html.br [] []
        , Html.text bibleText.text
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
