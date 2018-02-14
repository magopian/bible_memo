module Verses exposing (Dataset, Datasets, TextWithHoles, Verse, datasets, verseList)


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


type alias Dataset =
    ( String, List Verse )


type alias Datasets =
    List Dataset


datasets : Datasets
datasets =
    [ ( "french", frenchVerseList )
    , ( "english", verseList )
    ]


frenchVerseList : List Verse
frenchVerseList =
    [ Verse
        "Jean 3:16"
        "En effet, Dieu a tant aimé le monde qu'il a donné son Fils unique afin que quiconque croit en lui ne périsse pas mais ait la vie éternelle."
        (TextWithHoles
            [ "En effet, ", " a tant aimé le ", " qu'il a donné son ", " unique afin que quiconque croit en lui ne périsse pas mais ait la ", " éternelle." ]
            [ "Dieu", "monde", "Fils", "vie" ]
        )
    ]


verseList : List Verse
verseList =
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
            [ "In the ", " God ", " the ", " and the ", "." ]
            [ "beginning", "created", "heavens", "earth" ]
        )
    , Verse
        "Prov 3:5"
        "Trust in the LORD with all your heart and lean not on your own understanding."
        (TextWithHoles
            [ "Trust in the ", " with all your ", " and ", " not on your own ", "." ]
            [ "LORD", "heart", "lean", "understanding" ]
        )
    , Verse
        "Prov 3:6"
        "in all your ways acknowledge him, and he will make your paths straight."
        (TextWithHoles
            [ "in all your ", " acknowledge ", ", and he will make your ", " straight." ]
            [ "ways", "him", "paths" ]
        )
    , Verse
        "Rom 12:2"
        "Do not conform any longer to the pattern of this world, but be transformed by the renewing of your mind. Then you will be able to test and approve what God’s will is—his good, pleasing and perfect will."
        (TextWithHoles
            [ "Do not ", " any longer to the pattern of this ", ", but be transformed by the ", " of your ", ". Then you will be able to test and ", " what God’s will is—his good, ", " and perfect ", "." ]
            [ "conform", "world", "renewing", "mind", "approve", "pleasing", "will" ]
        )
    , Verse
        "Phil 4:6"
        "Do not be anxious about anything, but in everything, by prayer and petition, with thanksgiving, present your requests to God."
        (TextWithHoles
            [ "Do not be ", " about anything, but in ", ", by prayer and petition, with ", ", present your ", " to God." ]
            [ "anxious", "everything", "thanksgiving", "requests" ]
        )
    , Verse
        "Matt 28:19"
        "Therefore go and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit."
        (TextWithHoles
            [ "Therefore go and make ", " of all ", ", ", " them in the name of the ", " and of the ", " and of the ", "." ]
            [ "disciples", "nations", "baptizing", "Father", "Son", "Holy Spirit" ]
        )
    , Verse
        "Eph 2:8"
        "For it is by grace you have been saved, through faith—and this not from yourselves, it is the gift of God—"
        (TextWithHoles
            [ "For it is by ", " you have been ", ", through faith—and this not from ", ", it is the ", " of God—" ]
            [ "grace", "saved", "yourselves", "gift" ]
        )
    , Verse
        "Gal 5:22"
        "But the fruit of the Spirit is love, joy, peace, patience, kindness, goodness, faithfulness,"
        (TextWithHoles
            [ "But the ", " of the ", " is love, joy, peace, patience, kindness, goodness, ", "," ]
            [ "fruit", "Spirit", "faithfulness" ]
        )
    , Verse
        "Rom 12:1"
        "Therefore, I urge you, brothers, in view of God’s mercy, to offer your bodies as living sacrifices, holy and pleasing to God—this is your spiritual act of worship."
        (TextWithHoles
            [ "Therefore, I urge you, ", ", in view of God’s ", ", to offer your bodies as living ", ", holy and pleasing to God—this is your ", " act of ", "." ]
            [ "brothers", "mercy", "sacrifices", "spiritual", "worship" ]
        )
    , Verse
        "John 10:10"
        "The thief comes only to steal and kill and destroy; I have come that they may have life, and have it to the full."
        (TextWithHoles
            [ "The ", " comes only to steal and kill and destroy; I have come that they may have ", ", and have it to the ", "." ]
            [ "thief", "life", "full" ]
        )
    , Verse
        "Acts 18:10"
        "For I am with you, and no one is going to attack and harm you, because I have many people in this city.”"
        (TextWithHoles
            [ "For I am with ", ", and no one is going to ", " and harm you, because I have many ", " in this ", ".”" ]
            [ "you", "attack", "people", "city" ]
        )
    , Verse
        "Acts 18:9"
        "One night the Lord spoke to Paul in a vision: “Do not be afraid; keep on speaking, do not be silent."
        (TextWithHoles
            [ "One night the Lord spoke to ", " in a ", ": “Do not be ", "; keep on ", ", do not be ", "." ]
            [ "Paul", "vision", "afraid", "speaking", "silent" ]
        )
    , Verse
        "Acts 18:11"
        "So Paul stayed for a year and a half, teaching them the word of God."
        (TextWithHoles
            [ "So ", " stayed for a ", " and a half, ", " them the ", " of God." ]
            [ "Paul", "year", "teaching", "word" ]
        )
    , Verse
        "Gal 2:20"
        "I have been crucified with Christ and I no longer live, but Christ lives in me. The life I live in the body, I live by faith in the Son of God, who loved me and gave himself for me."
        (TextWithHoles
            [ "I have been ", " with Christ and I no longer ", ", but Christ lives in me. The life I live in the ", ", I live by ", " in the Son of God, who loved me and gave ", " for me." ]
            [ "crucified", "live", "body", "faith", "himself" ]
        )
    , Verse
        "1 John 1:"
        "If we confess our sins, he is faithful and just and will forgive us our sins and purify us from all unrighteousness."
        (TextWithHoles
            [ "If we ", " our sins, he is ", " and just and will ", " us our sins and purify us from all ", "." ]
            [ "confess", "faithful", "forgive", "unrighteousness" ]
        )
    , Verse
        "Rom 3:23"
        "for all have sinned and fall short of the glory of God,"
        (TextWithHoles
            [ "for all have ", " and fall ", " of the ", " of God," ]
            [ "sinned", "short", "glory" ]
        )
    , Verse
        "John 14:6"
        "Jesus answered, “I am the way and the truth and the life. No one comes to the Father except through me."
        (TextWithHoles
            [ "Jesus answered, “I am the ", " and the ", " and the ", ". No one comes to the ", " except through me." ]
            [ "way", "truth", "life", "Father" ]
        )
    , Verse
        "Matt 28:20"
        "and teaching them to obey everything I have commanded you. And surely I am with you always, to the very end of the age.”"
        (TextWithHoles
            [ "and teaching them to ", " everything I have ", " you. And surely I am with you ", ", to the very ", " of the age.”" ]
            [ "obey", "commanded", "always", "end" ]
        )
    , Verse
        "Rom 5:8"
        "But God demonstrates his own love for us in this: While we were still sinners, Christ died for us."
        (TextWithHoles
            [ "But God ", " his own love for us in this: While we were still ", ", Christ ", " for us." ]
            [ "demonstrates", "sinners", "died" ]
        )
    , Verse
        "Phil 4:8"
        "Finally, brothers, whatever is true, whatever is noble, whatever is right, whatever is pure, whatever is lovely, whatever is admirable—if anything is excellent or praiseworthy—think about such things."
        (TextWithHoles
            [ "Finally, ", ", whatever is true, whatever is noble, whatever is right, whatever is ", ", whatever is lovely, whatever is admirable—if anything is ", " or praiseworthy—think about such things." ]
            [ "brothers", "pure", "excellent" ]
        )
    , Verse
        "Phil 4:7"
        "And the peace of God, which transcends all understanding, will guard your hearts and your minds in Christ Jesus."
        (TextWithHoles
            [ "And the ", " of God, which transcends all ", ", will guard your hearts and your ", " in Christ Jesus." ]
            [ "peace", "understanding", "minds" ]
        )
    , Verse
        "Josh 1:9"
        "Have I not commanded you? Be strong and courageous. Do not be terrified; do not be discouraged, for the LORD your God will be with you wherever you go.”"
        (TextWithHoles
            [ "Have I not ", " you? Be strong and ", ". Do not be terrified; do not be discouraged, for the LORD your God will be with you ", " you go.”" ]
            [ "commanded", "courageous", "wherever" ]
        )
    , Verse
        "Isa 40:31"
        "but those who hope in the LORD will renew their strength. They will soar on wings like eagles; they will run and not grow weary, they will walk and not be faint."
        (TextWithHoles
            [ "but those who hope in the LORD will renew their ", ". They will soar on wings like eagles; they will run and not grow ", ", they will ", " and not be faint." ]
            [ "strength", "weary", "walk" ]
        )
    , Verse
        "Eph 2:9"
        "not by works, so that no one can boast."
        (TextWithHoles
            [ "not by ", ", so that no ", " can ", "." ]
            [ "works", "one", "boast" ]
        )
    , Verse
        "Rom 6:23"
        "For the wages of sin is death, but the gift of God is eternal life in Christ Jesus our Lord."
        (TextWithHoles
            [ "For the ", " of sin is ", ", but the gift of God is eternal ", " in Christ Jesus our Lord." ]
            [ "wages", "death", "life" ]
        )
    , Verse
        "Gal 5:23"
        "gentleness and self-control. Against such things there is no law."
        (TextWithHoles
            [ "", " and self-control. ", " such things there is no ", "." ]
            [ "gentleness", "Against", "law" ]
        )
    , Verse
        "Isa 53:5"
        "But he was pierced for our transgressions, he was crushed for our iniquities; the punishment that brought us peace was upon him, and by his wounds we are healed."
        (TextWithHoles
            [ "But he was pierced for our ", ", he was crushed for our iniquities; the ", " that brought us peace was upon him, and by his wounds we are ", "." ]
            [ "transgressions", "punishment", "healed" ]
        )
    , Verse
        "1 Pet 3:1"
        "But in your hearts set apart Christ as Lord. Always be prepared to give an answer to everyone who asks you to give the reason for the hope that you have. But do this with gentleness and respect,"
        (TextWithHoles
            [ "But in your hearts set apart ", " as Lord. Always be prepared to give an answer to everyone who asks you to give the reason for the ", " that you have. But do this with ", " and respect," ]
            [ "Christ", "hope", "gentleness" ]
        )
    , Verse
        "2 Tim 3:1"
        "All Scripture is God-breathed and is useful for teaching, rebuking, correcting and training in righteousness,"
        (TextWithHoles
            [ "All ", " is God-breathed and is useful for ", ", rebuking, correcting and training in ", "," ]
            [ "Scripture", "teaching", "righteousness" ]
        )
    , Verse
        "Matt 6:33"
        "But seek first his kingdom and his righteousness, and all these things will be given to you as well."
        (TextWithHoles
            [ "But seek first his ", " and his ", ", and all these things will be ", " to you as well." ]
            [ "kingdom", "righteousness", "given" ]
        )
    , Verse
        "Heb 12:2"
        "Let us fix our eyes on Jesus, the author and perfecter of our faith, who for the joy set before him endured the cross, scorning its shame, and sat down at the right hand of the throne of God."
        (TextWithHoles
            [ "Let us fix our eyes on ", ", the author and perfecter of our faith, who for the joy set before him endured the ", ", scorning its shame, and sat down at the right hand of the ", " of God." ]
            [ "Jesus", "cross", "throne" ]
        )
    , Verse
        "1 Pet 5:"
        "Cast all your anxiety on him because he cares for you."
        (TextWithHoles
            [ "Cast all your ", " on him because he ", " for ", "." ]
            [ "anxiety", "cares", "you" ]
        )
    , Verse
        "Eph 2:10"
        "For we are God’s workmanship, created in Christ Jesus to do good works, which God prepared in advance for us to do."
        (TextWithHoles
            [ "For we are God’s ", ", created in Christ Jesus to do good ", ", which God ", " in advance for us to do." ]
            [ "workmanship", "works", "prepared" ]
        )
    , Verse
        "1 Cor 10:1"
        "No temptation has seized you except what is common to man. And God is faithful; he will not let you be tempted beyond what you can bear. But when you are tempted, he will also provide a way out so that you can stand up under it."
        (TextWithHoles
            [ "No ", " has seized you except what is common to man. And God is faithful; he will not let you be ", " beyond what you can bear. But when you are tempted, he will also ", " a way out so that you can stand up under it." ]
            [ "temptation", "tempted", "provide" ]
        )
    , Verse
        "Matt 11:28"
        "“Come to me, all you who are weary and burdened, and I will give you rest."
        (TextWithHoles
            [ "“Come to me, all you who are ", " and burdened, and I ", " give you ", "." ]
            [ "weary", "will", "rest" ]
        )
    , Verse
        "Heb 11:1"
        "Now faith is being sure of what we hope for and certain of what we do not see."
        (TextWithHoles
            [ "Now ", " is being sure of what we ", " for and ", " of what we do not see." ]
            [ "faith", "hope", "certain" ]
        )
    , Verse
        "2 Cor 5:1"
        "Therefore, if anyone is in Christ, he is a new creation; the old has gone, the new has come!"
        (TextWithHoles
            [ "Therefore, if anyone is in Christ, he is a new creation; the old has gone, the new has come!" ]
            []
        )
    , Verse
        "Heb 13:5"
        "Keep your lives free from the love of money and be content with what you have, because God has said, “Never will I leave you; never will I forsake you.”"
        (TextWithHoles
            [ "Keep your ", " free from the love of money and be ", " with what you have, because God has said, “Never will I leave you; never will I ", " you.”" ]
            [ "lives", "content", "forsake" ]
        )
    , Verse
        "2 Cor 12:"
        "But he said to me, “My grace is sufficient for you, for my power is made perfect in weakness.” Therefore I will boast all the more gladly about my weaknesses, so that Christ’s power may rest on me."
        (TextWithHoles
            [ "But he said to me, “My ", " is sufficient for you, for my power is made perfect in ", ".” Therefore I will boast all the more gladly about my weaknesses, so that Christ’s ", " may rest on me." ]
            [ "grace", "weakness", "power" ]
        )
    , Verse
        "Rom 10:9"
        "That if you confess with your mouth, “Jesus is Lord,” and believe in your heart that God raised him from the dead, you will be saved."
        (TextWithHoles
            [ "That if you ", " with your mouth, “Jesus is Lord,” and believe in your ", " that God raised him from the dead, you will be ", "." ]
            [ "confess", "heart", "saved" ]
        )
    , Verse
        "Isa 41:10"
        "So do not fear, for I am with you; do not be dismayed, for I am your God. I will strengthen you and help you; I will uphold you with my righteous right hand."
        (TextWithHoles
            [ "So do not ", ", for I am with you; do not be dismayed, for I am your ", ". I will ", " you and help you; I will uphold you with my ", " right hand." ]
            [ "fear", "God", "strengthen", "righteous" ]
        )
    , Verse
        "Gen 1:26"
        "Then God said, “Let us make man in our image, in our likeness, and let them rule over the fish of the sea and the birds of the air, over the livestock, over all the earth, and over all the creatures that move along the ground.”"
        (TextWithHoles
            [ "Then God said, “Let us make man in our image, in our likeness, and let them ", " over the fish of the sea and the birds of the air, over the livestock, over all the earth, and over all the ", " that move along the ", ".”" ]
            [ "rule", "creatures", "ground" ]
        )
    , Verse
        "Matt 11:29"
        "Take my yoke upon you and learn from me, for I am gentle and humble in heart, and you will find rest for your souls."
        (TextWithHoles
            [ "Take my ", " upon you and learn from me, for I am ", " and humble in heart, and you will find rest for your ", "." ]
            [ "yoke", "gentle", "souls" ]
        )
    , Verse
        "John 16:33"
        "“I have told you these things, so that in me you may have peace. In this world you will have trouble. But take heart! I have overcome the world.”"
        (TextWithHoles
            [ "“I have told you these things, so that in me you may have ", ". In this world you will have ", ". But take heart! I have ", " the world.”" ]
            [ "peace", "trouble", "overcome" ]
        )
    , Verse
        "Acts 1:8"
        "But you will receive power when the Holy Spirit comes on you; and you will be my witnesses in Jerusalem, and in all Judea and Samaria, and to the ends of the earth.”"
        (TextWithHoles
            [ "But you will receive ", " when the Holy Spirit comes on you; and you will be my ", " in Jerusalem, and in all Judea and Samaria, and to the ends of the ", ".”" ]
            [ "power", "witnesses", "earth" ]
        )
    , Verse
        "2 Tim 1:"
        "For God did not give us a spirit of timidity, but a spirit of power, of love and of self-discipline."
        (TextWithHoles
            [ "For God did not give us a spirit of ", ", but a spirit of ", ", of love and of self-", "." ]
            [ "timidity", "power", "discipline" ]
        )
    , Verse
        "Isa 53:4"
        "Surely he took up our infirmities and carried our sorrows, yet we considered him stricken by God, smitten by him, and afflicted."
        (TextWithHoles
            [ "Surely he took up our ", " and carried our sorrows, yet we considered him ", " by God, smitten by him, and ", "." ]
            [ "infirmities", "stricken", "afflicted" ]
        )
    , Verse
        "2 Cor 5:2"
        "God made him who had no sin to be sin for us, so that in him we might become the righteousness of God."
        (TextWithHoles
            [ "God made him who had no ", " to be sin for us, so that in him we might ", " the ", " of God." ]
            [ "sin", "become", "righteousness" ]
        )
    , Verse
        "Rom 15:13"
        "May the God of hope fill you with all joy and peace as you trust in him, so that you may overflow with hope by the power of the Holy Spirit."
        (TextWithHoles
            [ "May the God of ", " fill you with all joy and peace as you ", " in him, so that you may ", " with hope by the power of the Holy Spirit." ]
            [ "hope", "trust", "overflow" ]
        )
    , Verse
        "John 11:25"
        "Jesus said to her, “I am the resurrection and the life. He who believes in me will live, even though he dies;"
        (TextWithHoles
            [ "Jesus said to her, “I am the ", " and the ", ". He who ", " in me will live, even though he dies;" ]
            [ "resurrection", "life", "believes" ]
        )
    , Verse
        "Heb 11:6"
        "And without faith it is impossible to please God, because anyone who comes to him must believe that he exists and that he rewards those who earnestly seek him."
        (TextWithHoles
            [ "And without ", " it is impossible to please God, because anyone who comes to him must ", " that he exists and that he rewards those who ", " seek him." ]
            [ "faith", "believe", "earnestly" ]
        )
    , Verse
        "John 5:24"
        "“I tell you the truth, whoever hears my word and believes him who sent me has eternal life and will not be condemned; he has crossed over from death to life."
        (TextWithHoles
            [ "“I tell you the truth, whoever hears my ", " and believes him who sent me has ", " life and will not be condemned; he has crossed over from death to ", "." ]
            [ "word", "eternal", "life" ]
        )
    , Verse
        "Jas 1:2"
        "Consider it pure joy, my brothers, whenever you face trials of many kinds,"
        (TextWithHoles
            [ "Consider it pure ", ", my brothers, whenever you face ", " of many ", "," ]
            [ "joy", "trials", "kinds" ]
        )
    , Verse
        "Isa 53:6"
        "We all, like sheep, have gone astray, each of us has turned to his own way; and the LORD has laid on him the iniquity of us all."
        (TextWithHoles
            [ "We all, like ", ", have gone astray, each of us has ", " to his own way; and the LORD has laid on him the ", " of us all." ]
            [ "sheep", "turned", "iniquity" ]
        )
    , Verse
        "Acts 2:38"
        "Peter replied, “Repent and be baptized, every one of you, in the name of Jesus Christ for the forgiveness of your sins. And you will receive the gift of the Holy Spirit."
        (TextWithHoles
            [ "Peter replied, “Repent and be ", ", every one of you, in the name of Jesus Christ for the ", " of your sins. And you will receive the ", " of the Holy Spirit." ]
            [ "baptized", "forgiveness", "gift" ]
        )
    , Verse
        "Eph 3:20"
        "Now to him who is able to do immeasurably more than all we ask or imagine, according to his power that is at work within us,"
        (TextWithHoles
            [ "Now to him who is ", " to do immeasurably more than all we ask or imagine, according to his ", " that is at work ", " us," ]
            [ "able", "power", "within" ]
        )
    , Verse
        "Matt 11:30"
        "For my yoke is easy and my burden is light.”"
        (TextWithHoles
            [ "For my ", " is easy and my ", " is ", ".”" ]
            [ "yoke", "burden", "light" ]
        )
    , Verse
        "Gen 1:27"
        "So God created man in his own image, in the image of God he created him; male and female he created them."
        (TextWithHoles
            [ "So God created man in his own ", ", in the image of God he ", " him; male and ", " he created them." ]
            [ "image", "created", "female" ]
        )
    , Verse
        "Col 3:12"
        "Therefore, as God’s chosen people, holy and dearly loved, clothe yourselves with compassion, kindness, humility, gentleness and patience."
        (TextWithHoles
            [ "Therefore, as God’s chosen ", ", holy and dearly loved, clothe ", " with compassion, kindness, humility, gentleness and ", "." ]
            [ "people", "yourselves", "patience" ]
        )
    , Verse
        "Heb 12:1"
        "Therefore, since we are surrounded by such a great cloud of witnesses, let us throw off everything that hinders and the sin that so easily entangles, and let us run with perseverance the race marked out for us."
        (TextWithHoles
            [ "Therefore, since we are surrounded by such a great cloud of ", ", let us throw off everything that hinders and the sin that so easily ", ", and let us run with ", " the race marked out for us." ]
            [ "witnesses", "entangles", "perseverance" ]
        )
    , Verse
        "Jas 5:16"
        "Therefore confess your sins to each other and pray for each other so that you may be healed. The prayer of a righteous man is powerful and effective."
        (TextWithHoles
            [ "Therefore ", " your sins to each other and pray for each other so that you may be ", ". The prayer of a righteous man is ", " and effective." ]
            [ "confess", "healed", "powerful" ]
        )
    , Verse
        "Acts 17:11"
        "Now the Bereans were of more noble character than the Thessalonians, for they received the message with great eagerness and examined the Scriptures every day to see if what Paul said was true."
        (TextWithHoles
            [ "Now the Bereans were of more noble character than the Thessalonians, for they received the ", " with great eagerness and examined the ", " every day to see if what ", " said was true." ]
            [ "message", "Scriptures", "Paul" ]
        )
    , Verse
        "Phil 4:19"
        "And my God will meet all your needs according to his glorious riches in Christ Jesus."
        (TextWithHoles
            [ "And my ", " will meet all your ", " according to his glorious ", " in Christ Jesus." ]
            [ "God", "needs", "riches" ]
        )
    , Verse
        "John 1:1"
        "In the beginning was the Word, and the Word was with God, and the Word was God."
        (TextWithHoles
            [ "In the ", " was the Word, and the ", " was with God, and the Word was ", "." ]
            [ "beginning", "Word", "God" ]
        )
    , Verse
        "1 Cor 6:1"
        "Do you not know that your body is a temple of the Holy Spirit, who is in you, whom you have received from God? You are not your own;"
        (TextWithHoles
            [ "Do you not know that your body is a ", " of the Holy Spirit, who is in you, whom you have ", " from God? You are not your ", ";" ]
            [ "temple", "received", "own" ]
        )
    , Verse
        "1 John 3:1"
        "This is how we know what love is: Jesus Christ laid down his life for us. And we ought to lay down our lives for our brothers."
        (TextWithHoles
            [ "This is how we know what ", " is: Jesus Christ laid down his ", " for us. And we ought to lay down our lives for our ", "." ]
            [ "love", "life", "brothers" ]
        )
    , Verse
        "Ps 133:1"
        "How good and pleasant it is when brothers live together in unity!"
        (TextWithHoles
            [ "How good and ", " it is when ", " live together in ", "!" ]
            [ "pleasant", "brothers", "unity" ]
        )
    , Verse
        "John 14:27"
        "Peace I leave with you; my peace I give you. I do not give to you as the world gives. Do not let your hearts be troubled and do not be afraid."
        (TextWithHoles
            [ "Peace I leave with you; my ", " I give you. I do not give to you as the world ", ". Do not let your hearts be ", " and do not be afraid." ]
            [ "peace", "gives", "troubled" ]
        )
    , Verse
        "Heb 4:12"
        "For the word of God is living and active. Sharper than any double-edged sword, it penetrates even to dividing soul and spirit, joints and marrow; it judges the thoughts and attitudes of the heart."
        (TextWithHoles
            [ "For the word of God is ", " and active. Sharper than any double-edged ", ", it penetrates even to dividing soul and spirit, joints and marrow; it judges the ", " and attitudes of the heart." ]
            [ "living", "sword", "thoughts" ]
        )
    , Verse
        "John 15:13"
        "Greater love has no one than this, that he lay down his life for his friends."
        (TextWithHoles
            [ "Greater ", " has no one than this, that he lay down his ", " for his ", "." ]
            [ "love", "life", "friends" ]
        )
    , Verse
        "Mic 6:8"
        "He has showed you, O man, what is good. And what does the LORD require of you? To act justly and to love mercy and to walk humbly with your God."
        (TextWithHoles
            [ "He has ", " you, O man, what is good. And what does the ", " require of you? To act justly and to love mercy and to walk ", " with your God." ]
            [ "showed", "LORD", "humbly" ]
        )
    , Verse
        "Rom 10:17"
        "Consequently, faith comes from hearing the message, and the message is heard through the word of Christ."
        (TextWithHoles
            [ "Consequently, ", " comes from hearing the ", ", and the message is heard through the word of ", "." ]
            [ "faith", "message", "Christ" ]
        )
    , Verse
        "John 1:12"
        "Yet to all who received him, to those who believed in his name, he gave the right to become children of God—"
        (TextWithHoles
            [ "Yet to all who received him, to those who ", " in his name, he gave the right to ", " children of ", "—" ]
            [ "believed", "become", "God" ]
        )
    , Verse
        "Jas 1:12"
        "Blessed is the man who perseveres under trial, because when he has stood the test, he will receive the crown of life that God has promised to those who love him."
        (TextWithHoles
            [ "Blessed is the man who ", " under trial, because when he has stood the test, he will receive the crown of ", " that God has promised to those who ", " him." ]
            [ "perseveres", "life", "love" ]
        )
    , Verse
        "Jas 1:3"
        "because you know that the testing of your faith develops perseverance."
        (TextWithHoles
            [ "because you know that the ", " of your ", " develops ", "." ]
            [ "testing", "faith", "perseverance" ]
        )
    , Verse
        "Rom 8:39"
        "neither height nor depth, nor anything else in all creation, will be able to separate us from the love of God that is in Christ Jesus our Lord."
        (TextWithHoles
            [ "neither ", " nor depth, nor anything else in all ", ", will be able to separate us from the ", " of God that is in Christ Jesus our Lord." ]
            [ "height", "creation", "love" ]
        )
    , Verse
        "Heb 10:25"
        "Let us not give up meeting together, as some are in the habit of doing, but let us encourage one another—and all the more as you see the Day approaching."
        (TextWithHoles
            [ "Let us not give up meeting ", ", as some are in the habit of doing, but let us ", " one another—and all the more as you see the Day ", "." ]
            [ "together", "encourage", "approaching" ]
        )
    , Verse
        "2 Pet 1:"
        "Through these he has given us his very great and precious promises, so that through them you may participate in the divine nature and escape the corruption in the world caused by evil desires."
        (TextWithHoles
            [ "Through these he has given us his very great and precious ", ", so that through them you may participate in the ", " nature and escape the corruption in the world caused by evil ", "." ]
            [ "promises", "divine", "desires" ]
        )
    , Verse
        "Phil 1:6"
        "being confident of this, that he who began a good work in you will carry it on to completion until the day of Christ Jesus."
        (TextWithHoles
            [ "being confident of this, that he who began a good ", " in you will carry it on to ", " until the day of Christ ", "." ]
            [ "work", "completion", "Jesus" ]
        )
    , Verse
        "Ps 133:3"
        "It is as if the dew of Hermon were falling on Mount Zion. For there the LORD bestows his blessing, even life forevermore."
        (TextWithHoles
            [ "It is as if the dew of ", " were falling on Mount Zion. For there the LORD bestows his ", ", even life ", "." ]
            [ "Hermon", "blessing", "forevermore" ]
        )
    , Verse
        "Heb 4:16"
        "Let us then approach the throne of grace with confidence, so that we may receive mercy and find grace to help us in our time of need."
        (TextWithHoles
            [ "Let us then approach the ", " of grace with ", ", so that we may receive mercy and find ", " to help us in our time of need." ]
            [ "throne", "confidence", "grace" ]
        )
    , Verse
        "Ps 37:4"
        "Delight yourself in the LORD and he will give you the desires of your heart."
        (TextWithHoles
            [ "Delight yourself in the ", " and he will give you the ", " of your ", "." ]
            [ "LORD", "desires", "heart" ]
        )
    , Verse
        "John 3:17"
        "For God did not send his Son into the world to condemn the world, but to save the world through him."
        (TextWithHoles
            [ "For God did not send his ", " into the world to condemn the ", ", but to ", " the world through him." ]
            [ "Son", "world", "save" ]
        )
    , Verse
        "Acts 4:12"
        "Salvation is found in no one else, for there is no other name under heaven given to men by which we must be saved.”"
        (TextWithHoles
            [ "Salvation is ", " in no one else, for there is no other name under ", " given to men by which we must be ", ".”" ]
            [ "found", "heaven", "saved" ]
        )
    , Verse
        "Isa 26:3"
        "You will keep in perfect peace him whose mind is steadfast, because he trusts in you."
        (TextWithHoles
            [ "You will keep in perfect ", " him whose mind is ", ", because he ", " in you." ]
            [ "peace", "steadfast", "trusts" ]
        )
    , Verse
        "1 Pet 2:2"
        "He himself bore our sins in his body on the tree, so that we might die to sins and live for righteousness; by his wounds you have been healed."
        (TextWithHoles
            [ "He himself bore our sins in his ", " on the tree, so that we might die to sins and live for ", "; by his wounds you have been ", "." ]
            [ "body", "righteousness", "healed" ]
        )
    , Verse
        "Josh 1:8"
        "Do not let this Book of the Law depart from your mouth; meditate on it day and night, so that you may be careful to do everything written in it. Then you will be prosperous and successful."
        (TextWithHoles
            [ "Do not let this Book of the Law depart from your ", "; meditate on it day and night, so that you may be ", " to do everything written in it. Then you will be prosperous and ", "." ]
            [ "mouth", "careful", "successful" ]
        )
    , Verse
        "Matt 28:18"
        "Then Jesus came to them and said, “All authority in heaven and on earth has been given to me."
        (TextWithHoles
            [ "Then ", " came to them and said, “All authority in ", " and on earth has been ", " to me." ]
            [ "Jesus", "heaven", "given" ]
        )
    , Verse
        "Col 3:23"
        "Whatever you do, work at it with all your heart, as working for the Lord, not for men,"
        (TextWithHoles
            [ "Whatever you do, ", " at it with all your ", ", as working for the ", ", not for men," ]
            [ "work", "heart", "Lord" ]
        )
    , Verse
        "Matt 22:37"
        "Jesus replied: ” ‘Love the Lord your God with all your heart and with all your soul and with all your mind.’"
        (TextWithHoles
            [ "Jesus replied: ” ‘Love the Lord your ", " with all your ", " and with all your soul and with all your ", ".’" ]
            [ "God", "heart", "mind" ]
        )
    , Verse
        "Ps 133:2"
        "It is like precious oil poured on the head, running down on the beard, running down on Aaron’s beard, down upon the collar of his robes."
        (TextWithHoles
            [ "It is like ", " oil poured on the head, running down on the ", ", running down on Aaron’s beard, down upon the collar of his ", "." ]
            [ "precious", "beard", "robes" ]
        )
    , Verse
        "Matt 5:16"
        "In the same way, let your light shine before men, that they may see your good deeds and praise your Father in heaven."
        (TextWithHoles
            [ "In the same way, let your ", " shine before men, that they may see your ", " deeds and praise your Father in ", "." ]
            [ "light", "good", "heaven" ]
        )
    , Verse
        "Isa 55:8"
        "“For my thoughts are not your thoughts, neither are your ways my ways,” declares the LORD."
        (TextWithHoles
            [ "“For my ", " are not your thoughts, neither are your ways my ", ",” declares the ", "." ]
            [ "thoughts", "ways", "LORD" ]
        )
    , Verse
        "Heb 4:15"
        "For we do not have a high priest who is unable to sympathize with our weaknesses, but we have one who has been tempted in every way, just as we are—yet was without sin."
        (TextWithHoles
            [ "For we do not have a high ", " who is unable to sympathize with our ", ", but we have one who has been tempted in every way, just as we are—yet was without ", "." ]
            [ "priest", "weaknesses", "sin" ]
        )
    , Verse
        "John 13:35"
        "By this all men will know that you are my disciples, if you love one another.”"
        (TextWithHoles
            [ "By this all ", " will know that you are my ", ", if you love one ", ".”" ]
            [ "men", "disciples", "another" ]
        )
    ]
