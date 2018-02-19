module Tests exposing (..)

import Dict
import Expect
import Test exposing (..)
import Main exposing (reconstituteVerse)
import Verses exposing (datasets)


-- Check out http://package.elm-lang.org/packages/elm-community/elm-test/latest to learn more about testing in Elm!


all : Test
all =
    describe "Verses"
        [ test "are correctly split into 'with holes' and words to be chosen" <|
            \_ ->
                let
                    -- List of all the (verse text, reconstituded verse text)
                    data : List ( String, String )
                    data =
                        datasets
                            |> List.concatMap
                                (\( _, verses ) ->
                                    verses
                                        |> List.map
                                            (\{ text, withHoles } ->
                                                let
                                                    wordChoices =
                                                        withHoles.words
                                                            |> List.indexedMap (,)
                                                            |> Dict.fromList

                                                    reconstituded =
                                                        reconstituteVerse withHoles.text wordChoices
                                                in
                                                    ( text, reconstituded )
                                            )
                                )
                in
                    data
                        |> List.map (\( verseText, reconstituded ) -> verseText == reconstituded)
                        |> List.all identity
                        |> Expect.true "All verses reconstitute properly"
        ]
