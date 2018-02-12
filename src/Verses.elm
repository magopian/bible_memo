module Verses exposing (TextWithHoles, Verse, verses)


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
