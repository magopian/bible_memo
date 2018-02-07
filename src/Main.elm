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
    , withHoles : TextWithHoles
    }


type alias TextWithHoles =
    { text : List TextContent
    , words : List TextContent
    }


type alias Model =
    { verse : Verse
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
    Html.div []
        [ Html.h1 []
            [ Html.text bibleText.reference
            ]
        , Html.p [] <| viewWithHoles bibleText.withHoles.text bibleText.withHoles.words
        ]


viewWithHoles : List TextContent -> List TextContent -> List (Html.Html Msg)
viewWithHoles splits words =
    case splits of
        [] ->
            []

        [ lastSplit ] ->
            [ Html.text lastSplit ]

        head :: tail ->
            Html.text head :: (viewWordsChoice words) :: viewWithHoles tail words


viewWordsChoice : List TextContent -> Html.Html Msg
viewWordsChoice words =
    Html.select []
        (Html.option [] []
            :: (List.map
                    (\word -> Html.option [] [ Html.text word ])
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
