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
        (datasets
            |> List.map
                (\( title, dataset ) ->
                    -- One "describe" test set for each dataset (french, english...)
                    describe (title ++ " verses") <|
                        let
                            -- List of all the (verse text, reconstituded verse text)
                            data : List ( String, String, String )
                            data =
                                dataset
                                    |> List.map
                                        (\{ reference, text, withHoles } ->
                                            let
                                                wordChoices =
                                                    withHoles.words
                                                        |> List.indexedMap (,)
                                                        |> Dict.fromList

                                                reconstituted =
                                                    reconstituteVerse withHoles.text wordChoices
                                            in
                                                ( reference, text, reconstituted )
                                        )
                        in
                            data
                                |> List.map
                                    (\( reference, verseText, reconstituted ) ->
                                        -- One test for each verse
                                        test ("The verse " ++ reference ++ " reconstitutes properly") <|
                                            \_ ->
                                                Expect.equal verseText reconstituted
                                    )
                )
        )
