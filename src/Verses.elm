module Verses exposing (Dataset, Datasets, TextWithHoles, Verse, datasets)


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
    , ( "english", englishVerseList )
    ]


englishVerseList : List Verse
englishVerseList =
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


frenchVerseList : List Verse
frenchVerseList =
    [ Verse
        "Jean 3:16"
        "Car Dieu a tant aimé le monde qu'il a donné son Fils unique, afin que quiconque croit en lui ne périsse point, mais qu'il ait la vie éternelle."
        (TextWithHoles
            [ "Car ", " a tant aimé le ", " qu'il a donné son ", " unique, afin que quiconque croit en lui ne périsse point, mais qu'il ait la ", " éternelle." ]
            [ "Dieu", "monde", "Fils", "vie" ]
        )
    , Verse
        "Romains 3:23"
        "Car tous ont péché et sont privés de la gloire de Dieu;"
        (TextWithHoles
            [ "Car ", " ont péché et sont ", " de la gloire de ", ";" ]
            [ "tous", "privés", "Dieu" ]
        )
    , Verse
        "Timothée 3:16"
        "Toute Écriture est inspirée de Dieu, et utile pour enseigner, pour convaincre, pour corriger, pour instruire dans la justice,"
        (TextWithHoles
            [ "Toute ", " est inspirée de Dieu, et utile pour ", ", pour convaincre, pour corriger, pour instruire dans la ", "," ]
            [ "Écriture", "enseigner", "justice" ]
        )
    , Verse
        "Romains 12:1"
        "Je vous exhorte donc, frères, par les compassions de Dieu, à offrir vos corps comme un sacrifice vivant, saint, agréable à Dieu, ce qui sera de votre part un culte raisonnable."
        (TextWithHoles
            [ "Je vous exhorte donc, ", ", par les compassions de Dieu, à offrir vos corps comme un ", " vivant, saint, agréable à Dieu, ce qui sera de votre part un ", " raisonnable." ]
            [ "frères", "sacrifice", "culte" ]
        )
    , Verse
        "Galates 5:22"
        "Mais le fruit de l'Esprit, c'est l'amour, la joie, la paix, la patience, la bonté, la bénignité, la fidélité, la douceur, la tempérance;"
        (TextWithHoles
            [ "Mais le ", " de l'", ", c'est l'amour, la joie, la paix, la patience, la bonté, la bénignité, la fidélité, la ", ", la tempérance;" ]
            [ "fruit", "Esprit", "douceur" ]
        )
    , Verse
        "Éphésiens 2:8"
        "Car c'est par la grâce que vous êtes sauvés, par le moyen de la foi. Et cela ne vient pas de vous, c'est le don de Dieu."
        (TextWithHoles
            [ "Car c'est par la ", " que vous êtes ", ", par le moyen de la foi. Et cela ne vient pas de vous, c'est le don de ", "." ]
            [ "grâce", "sauvés", "Dieu" ]
        )
    , Verse
        "Romains 8:28"
        "Nous savons, du reste, que toutes choses concourent au bien de ceux qui aiment Dieu, de ceux qui sont appelés selon son dessein."
        (TextWithHoles
            [ "Nous savons, du reste, que toutes choses ", " au bien de ceux qui aiment ", ", de ceux qui sont appelés selon son ", "." ]
            [ "concourent", "Dieu", "dessein" ]
        )
    , Verse
        "Matthieu 28:19"
        "Allez, faites de toutes les nations des disciples, les baptisant au nom du Père, du Fils et du Saint Esprit,"
        (TextWithHoles
            [ "Allez, faites de toutes les nations des ", ", les baptisant au nom du ", ", du ", " et du Saint ", "," ]
            [ "disciples", "Père", "Fils", "Esprit" ]
        )
    , Verse
        "Romains 12:2"
        "Ne vous conformez pas au siècle présent, mais soyez transformés par le renouvellement de l'intelligence, afin que vous discerniez quelle est la volonté de Dieu, ce qui est bon, agréable et parfait."
        (TextWithHoles
            [ "Ne vous conformez pas au siècle présent, mais soyez transformés par le renouvellement de l'", ", afin que vous discerniez quelle est la volonté de ", ", ce qui est bon, agréable et ", "." ]
            [ "intelligence", "Dieu", "parfait" ]
        )
    , Verse
        "Jean 14:6"
        "Jésus lui dit: Je suis le chemin, la vérité, et la vie. Nul ne vient au Père que par moi."
        (TextWithHoles
            [ "Jésus lui dit: Je suis le ", ", la ", ", et la ", ". Nul ne vient au Père que par moi." ]
            [ "chemin", "vérité", "vie" ]
        )
    , Verse
        "Actes 1:8"
        "Mais vous recevrez une puissance, le Saint Esprit survenant sur vous, et vous serez mes témoins à Jérusalem, dans toute la Judée, dans la Samarie, et jusqu'aux extrémités de la terre."
        (TextWithHoles
            [ "Mais vous recevrez une ", ", le Saint Esprit survenant sur vous, et vous serez mes ", " à Jérusalem, dans toute la Judée, dans la Samarie, et jusqu'aux extrémités de la ", "." ]
            [ "puissance", "témoins", "terre" ]
        )
    , Verse
        "Actes 2:38"
        "Pierre leur dit: Repentez-vous, et que chacun de vous soit baptisé au nom de Jésus Christ, pour le pardon de vos péchés; et vous recevrez le don du Saint Esprit."
        (TextWithHoles
            [ "Pierre leur dit: Repentez-vous, et que chacun de vous soit ", " au nom de Jésus Christ, pour le ", " de vos péchés; et vous recevrez le don du Saint ", "." ]
            [ "baptisé", "pardon", "Esprit" ]
        )
    , Verse
        "Romains 6:23"
        "Car le salaire du péché, c'est la mort; mais le don gratuit de Dieu, c'est la vie éternelle en Jésus Christ notre Seigneur."
        (TextWithHoles
            [ "Car le salaire du péché, c'est la ", "; mais le don ", " de Dieu, c'est la vie ", " en Jésus Christ notre Seigneur." ]
            [ "mort", "gratuit", "éternelle" ]
        )
    , Verse
        "Genèse 1:1"
        "Au commencement, Dieu créa les cieux et la terre."
        (TextWithHoles
            [ "Au ", ", Dieu créa les ", " et la ", "." ]
            [ "commencement", "cieux", "terre" ]
        )
    , Verse
        "Jean 1:12"
        "Mais à tous ceux qui l'ont reçue, à ceux qui croient en son nom, elle a donné le pouvoir de devenir enfants de Dieu, lesquels sont nés,"
        (TextWithHoles
            [ "Mais à tous ceux qui l'ont ", ", à ceux qui croient en son ", ", elle a donné le pouvoir de devenir enfants de ", ", lesquels sont nés," ]
            [ "reçue", "nom", "Dieu" ]
        )
    , Verse
        "Jean 1:1"
        "Au commencement était la Parole, et la Parole était avec Dieu, et la Parole était Dieu."
        (TextWithHoles
            [ "Au ", " était la ", ", et la Parole était avec Dieu, et la Parole était ", "." ]
            [ "commencement", "Parole", "Dieu" ]
        )
    , Verse
        "Tite 3:5"
        "il nous a sauvés, non à cause des oeuvres de justice que nous aurions faites, mais selon sa miséricorde, par le baptême de la régénération et le renouvellement du Saint Esprit,"
        (TextWithHoles
            [ "il nous a ", ", non à cause des oeuvres de ", " que nous aurions faites, mais selon sa ", ", par le baptême de la régénération et le renouvellement du Saint Esprit," ]
            [ "sauvés", "justice", "miséricorde" ]
        )
    , Verse
        "Romains 10:9"
        "Si tu confesses de ta bouche le Seigneur Jésus, et si tu crois dans ton coeur que Dieu l'a ressuscité des morts, tu seras sauvé."
        (TextWithHoles
            [ "Si tu ", " de ta bouche le Seigneur Jésus, et si tu crois dans ton ", " que Dieu l'a ressuscité des morts, tu seras ", "." ]
            [ "confesses", "coeur", "sauvé" ]
        )
    , Verse
        "Jean 1:14"
        "Et la parole a été faite chair, et elle a habité parmi nous, pleine de grâce et de vérité; et nous avons contemplé sa gloire, une gloire comme la gloire du Fils unique venu du Père."
        (TextWithHoles
            [ "Et la ", " a été faite chair, et elle a habité parmi nous, pleine de grâce et de ", "; et nous avons contemplé sa gloire, une gloire comme la gloire du Fils unique venu du ", "." ]
            [ "parole", "vérité", "Père" ]
        )
    , Verse
        "Genèse 1:26"
        "Puis Dieu dit: Faisons l'homme à notre image, selon notre ressemblance, et qu'il domine sur les poissons de la mer, sur les oiseaux du ciel, sur le bétail, sur toute la terre, et sur tous les reptiles qui rampent sur la terre."
        (TextWithHoles
            [ "Puis Dieu dit: Faisons l'homme à notre ", ", selon notre ressemblance, et qu'il domine sur les ", " de la mer, sur les oiseaux du ciel, sur le bétail, sur toute la terre, et sur tous les reptiles qui rampent sur la ", "." ]
            [ "image", "poissons", "terre" ]
        )
    , Verse
        "Proverbes 3:5"
        "Confie-toi en l'Éternel de tout ton coeur, Et ne t'appuie pas sur ta sagesse;"
        (TextWithHoles
            [ "Confie-toi en l'", " de tout ton ", ", Et ne t'appuie pas sur ta ", ";" ]
            [ "Éternel", "coeur", "sagesse" ]
        )
    , Verse
        "Romains 5:8"
        "Mais Dieu prouve son amour envers nous, en ce que, lorsque nous étions encore des pécheurs, Christ est mort pour nous."
        (TextWithHoles
            [ "Mais Dieu prouve son ", " envers nous, en ce que, lorsque nous étions encore des ", ", Christ est mort pour ", "." ]
            [ "amour", "pécheurs", "nous" ]
        )
    , Verse
        "Jérémie 29:11"
        "Car je connais les projets que j'ai formés sur vous, dit l'Éternel, projets de paix et non de malheur, afin de vous donner un avenir et de l'espérance."
        (TextWithHoles
            [ "Car je connais les ", " que j'ai formés sur vous, dit l'Éternel, projets de ", " et non de malheur, afin de vous donner un avenir et de l'", "." ]
            [ "projets", "paix", "espérance" ]
        )
    , Verse
        "Éphésiens 4:11"
        "Et il a donné les uns comme apôtres, les autres comme prophètes, les autres comme évangélistes, les autres comme pasteurs et docteurs,"
        (TextWithHoles
            [ "Et il a donné les uns comme ", ", les autres comme ", ", les autres comme évangélistes, les autres comme pasteurs et ", "," ]
            [ "apôtres", "prophètes", "docteurs" ]
        )
    , Verse
        "Genèse 1:27"
        "Dieu créa l'homme à son image, il le créa à l'image de Dieu, il créa l'homme et la femme."
        (TextWithHoles
            [ "Dieu créa l'homme à son ", ", il le créa à l'image de ", ", il créa l'homme et la ", "." ]
            [ "image", "Dieu", "femme" ]
        )
    , Verse
        "Actes 2:42"
        "Ils persévéraient dans l'enseignement des apôtres, dans la communion fraternelle, dans la fraction du pain, et dans les prières."
        (TextWithHoles
            [ "Ils persévéraient dans l'enseignement des ", ", dans la ", " fraternelle, dans la fraction du pain, et dans les ", "." ]
            [ "apôtres", "communion", "prières" ]
        )
    , Verse
        "Matthieu 11:28"
        "Venez à moi, vous tous qui êtes fatigués et chargés, et je vous donnerai du repos."
        (TextWithHoles
            [ "Venez à moi, vous tous qui êtes ", " et ", ", et je vous donnerai du ", "." ]
            [ "fatigués", "chargés", "repos" ]
        )
    , Verse
        "Jean 1:9"
        "Si nous confessons nos péchés, il est fidèle et juste pour nous les pardonner, et pour nous purifier de toute iniquité."
        (TextWithHoles
            [ "Si nous ", " nos péchés, il est fidèle et juste pour nous les ", ", et pour nous ", " de toute iniquité." ]
            [ "confessons", "pardonner", "purifier" ]
        )
    , Verse
        "Jean 3:3"
        "Jésus lui répondit: En vérité, en vérité, je te le dis, si un homme ne naît de nouveau, il ne peut voir le royaume de Dieu."
        (TextWithHoles
            [ "Jésus lui répondit: En vérité, en vérité, je te le dis, si un ", " ne naît de ", ", il ne peut voir le ", " de Dieu." ]
            [ "homme", "nouveau", "royaume" ]
        )
    , Verse
        "Jean 10:10"
        "Le voleur ne vient que pour dérober, égorger et détruire; moi, je suis venu afin que les brebis aient la vie, et qu'elles soient dans l'abondance."
        (TextWithHoles
            [ "Le ", " ne vient que pour dérober, égorger et détruire; moi, je suis venu afin que les brebis aient la ", ", et qu'elles soient dans l'", "." ]
            [ "voleur", "vie", "abondance" ]
        )
    , Verse
        "Romains 5:12"
        "C'est pourquoi, comme par un seul homme le péché est entré dans le monde, et par le péché la mort, et qu'ainsi la mort s'est étendue sur tous les hommes, parce que tous ont péché,..."
        (TextWithHoles
            [ "C'est pourquoi, comme par un seul homme le ", " est entré dans le monde, et par le péché la ", ", et qu'ainsi la mort s'est étendue sur tous les ", ", parce que tous ont péché,..." ]
            [ "péché", "mort", "hommes" ]
        )
    , Verse
        "Marc 16:15"
        "Puis il leur dit: Allez par tout le monde, et prêchez la bonne nouvelle à toute la création."
        (TextWithHoles
            [ "Puis il leur dit: Allez par tout le ", ", et prêchez la bonne ", " à toute la ", "." ]
            [ "monde", "nouvelle", "création" ]
        )
    , Verse
        "Actes 4:12"
        "Il n'y a de salut en aucun autre; car il n'y a sous le ciel aucun autre nom qui ait été donné parmi les hommes, par lequel nous devions être sauvés."
        (TextWithHoles
            [ "Il n'y a de ", " en aucun autre; car il n'y a sous le ciel aucun autre nom qui ait été donné parmi les ", ", par lequel nous devions être ", "." ]
            [ "salut", "hommes", "sauvés" ]
        )
    , Verse
        "Corinthiens 5:17"
        "Si quelqu'un est en Christ, il est une nouvelle créature. Les choses anciennes sont passées; voici, toutes choses sont devenues nouvelles."
        (TextWithHoles
            [ "Si quelqu'un est en ", ", il est une nouvelle ", ". Les choses anciennes sont passées; voici, toutes choses sont devenues ", "." ]
            [ "Christ", "créature", "nouvelles" ]
        )
    , Verse
        "Jean 14:1"
        "Que votre coeur ne se trouble point. Croyez en Dieu, et croyez en moi."
        (TextWithHoles
            [ "Que votre ", " ne se trouble point. ", " en Dieu, et croyez en ", "." ]
            [ "coeur", "Croyez", "moi" ]
        )
    , Verse
        "Jean 1:9"
        "Cette lumière était la véritable lumière, qui, en venant dans le monde, éclaire tout homme."
        (TextWithHoles
            [ "Cette ", " était la véritable lumière, qui, en venant dans le ", ", éclaire tout ", "." ]
            [ "lumière", "monde", "homme" ]
        )
    , Verse
        "Matthieu 28:18"
        "Jésus, s'étant approché, leur parla ainsi: Tout pouvoir m'a été donné dans le ciel et sur la terre."
        (TextWithHoles
            [ "Jésus, s'étant approché, leur parla ainsi: Tout ", " m'a été donné dans le ", " et sur la ", "." ]
            [ "pouvoir", "ciel", "terre" ]
        )
    , Verse
        "Romains 5:1"
        "Étant donc justifiés par la foi, nous avons la paix avec Dieu par notre Seigneur Jésus Christ,"
        (TextWithHoles
            [ "Étant donc ", " par la foi, nous avons la ", " avec Dieu par notre Seigneur ", " Christ," ]
            [ "justifiés", "paix", "Jésus" ]
        )
    , Verse
        "Philippiens 4:13"
        "Je puis tout par celui qui me fortifie."
        (TextWithHoles
            [ "Je puis ", " par ", " qui me ", "." ]
            [ "tout", "celui", "fortifie" ]
        )
    , Verse
        "Ésaïe 9:6"
        "Car un enfant nous est né, un fils nous est donné, Et la domination reposera sur son épaule; On l'appellera Admirable, Conseiller, Dieu puissant, Père éternel, Prince de la paix."
        (TextWithHoles
            [ "Car un ", " nous est né, un fils nous est donné, Et la domination reposera sur son épaule; On l'appellera ", ", Conseiller, Dieu puissant, Père éternel, ", " de la paix." ]
            [ "enfant", "Admirable", "Prince" ]
        )
    , Verse
        "Philippiens 4:6"
        "Ne vous inquiétez de rien; mais en toute chose faites connaître vos besoins à Dieu par des prières et des supplications, avec des actions de grâces."
        (TextWithHoles
            [ "Ne vous ", " de rien; mais en toute chose faites connaître vos besoins à Dieu par des ", " et des supplications, avec des actions de ", "." ]
            [ "inquiétez", "prières", "grâces" ]
        )
    , Verse
        "Romains 8:1"
        "Il n'y a donc maintenant aucune condamnation pour ceux qui sont en Jésus Christ."
        (TextWithHoles
            [ "Il n'y a donc ", " aucune ", " pour ceux qui sont en ", " Christ." ]
            [ "maintenant", "condamnation", "Jésus" ]
        )
    , Verse
        "Jean 2:1"
        "Trois jours après, il y eut des noces à Cana en Galilée. La mère de Jésus était là,"
        (TextWithHoles
            [ "Trois jours après, il y eut des ", " à Cana en ", ". La mère de ", " était là," ]
            [ "noces", "Galilée", "Jésus" ]
        )
    , Verse
        "Actes 2:1"
        "Le jour de la Pentecôte, ils étaient tous ensemble dans le même lieu."
        (TextWithHoles
            [ "Le jour de la ", ", ils étaient tous ", " dans le même ", "." ]
            [ "Pentecôte", "ensemble", "lieu" ]
        )
    , Verse
        "Galates 2:20"
        "J'ai été crucifié avec Christ; et si je vis, ce n'est plus moi qui vis, c'est Christ qui vit en moi; si je vis maintenant dans la chair, je vis dans la foi au Fils de Dieu, qui m'a aimé et qui s'est livré lui-même pour moi."
        (TextWithHoles
            [ "J'ai été ", " avec Christ; et si je vis, ce n'est plus moi qui vis, c'est Christ qui vit en moi; si je vis maintenant dans la ", ", je vis dans la foi au Fils de Dieu, qui m'a ", " et qui s'est livré lui-même pour moi." ]
            [ "crucifié", "chair", "aimé" ]
        )
    , Verse
        "Romains 1:16"
        "Car je n'ai point honte de l'Évangile: c'est une puissance de Dieu pour le salut de quiconque croit, du Juif premièrement, puis du Grec,"
        (TextWithHoles
            [ "Car je n'ai point honte de l'", ": c'est une puissance de Dieu pour le ", " de quiconque ", ", du Juif premièrement, puis du Grec," ]
            [ "Évangile", "salut", "croit" ]
        )
    , Verse
        "Jean 13:34"
        "Je vous donne un commandement nouveau: Aimez-vous les uns les autres; comme je vous ai aimés, vous aussi, aimez-vous les uns les autres."
        (TextWithHoles
            [ "Je vous donne un ", " nouveau: Aimez-vous les uns les autres; comme je vous ai ", ", vous aussi, aimez-vous les uns les ", "." ]
            [ "commandement", "aimés", "autres" ]
        )
    , Verse
        "Jean 3:1"
        "Mais il y eut un homme d'entre les pharisiens, nommé Nicodème, un chef des Juifs,"
        (TextWithHoles
            [ "Mais il y eut un ", " d'entre les pharisiens, nommé ", ", un chef des ", "," ]
            [ "homme", "Nicodème", "Juifs" ]
        )
    , Verse
        "Timothée 2:15"
        "Efforce-toi de te présenter devant Dieu comme un homme éprouvé, un ouvrier qui n'a point à rougir, qui dispense droitement la parole de la vérité."
        (TextWithHoles
            [ "Efforce-toi de te présenter devant ", " comme un homme éprouvé, un ouvrier qui n'a point à rougir, qui dispense ", " la parole de la ", "." ]
            [ "Dieu", "droitement", "vérité" ]
        )
    , Verse
        "Matthieu 6:33"
        "Cherchez premièrement le royaume et la justice de Dieu; et toutes ces choses vous seront données par-dessus."
        (TextWithHoles
            [ "Cherchez premièrement le ", " et la ", " de Dieu; et toutes ces choses vous seront ", " par-dessus." ]
            [ "royaume", "justice", "données" ]
        )
    , Verse
        "Jean 14:16"
        "Et moi, je prierai le Père, et il vous donnera un autre consolateur, afin qu'il demeure éternellement avec vous,"
        (TextWithHoles
            [ "Et moi, je prierai le ", ", et il vous donnera un autre ", ", afin qu'il demeure ", " avec vous," ]
            [ "Père", "consolateur", "éternellement" ]
        )
    , Verse
        "Hébreux 12:1"
        "Nous donc aussi, puisque nous sommes environnés d'une si grande nuée de témoins, rejetons tout fardeau, et le péché qui nous enveloppe si facilement, et courons avec persévérance dans la carrière qui nous est ouverte,"
        (TextWithHoles
            [ "Nous donc aussi, puisque nous sommes environnés d'une si grande nuée de ", ", rejetons tout fardeau, et le péché qui nous enveloppe si facilement, et courons avec ", " dans la carrière qui nous est ", "," ]
            [ "témoins", "persévérance", "ouverte" ]
        )
    , Verse
        "Jean 4:24"
        "Dieu est Esprit, et il faut que ceux qui l'adorent l'adorent en esprit et en vérité."
        (TextWithHoles
            [ "Dieu est ", ", et il faut que ceux qui l'", " l'adorent en esprit et en ", "." ]
            [ "Esprit", "adorent", "vérité" ]
        )
    , Verse
        "Ésaïe 7:14"
        "C'est pourquoi le Seigneur lui-même vous donnera un signe, Voici, la jeune fille deviendra enceinte, elle enfantera un fils, Et elle lui donnera le nom d'Emmanuel."
        (TextWithHoles
            [ "C'est pourquoi le ", " lui-même vous donnera un signe, Voici, la jeune fille deviendra ", ", elle enfantera un fils, Et elle lui donnera le nom d'", "." ]
            [ "Seigneur", "enceinte", "Emmanuel" ]
        )
    , Verse
        "Philippiens 2:5"
        "Ayez en vous les sentiments qui étaient en Jésus Christ,"
        (TextWithHoles
            [ "Ayez en ", " les ", " qui étaient en ", " Christ," ]
            [ "vous", "sentiments", "Jésus" ]
        )
    , Verse
        "Actes 20:28"
        "Prenez donc garde à vous-mêmes, et à tout le troupeau sur lequel le Saint Esprit vous a établis évêques, pour paître l'Église du Seigneur, qu'il s'est acquise par son propre sang."
        (TextWithHoles
            [ "Prenez donc garde à vous-mêmes, et à tout le ", " sur lequel le Saint Esprit vous a établis évêques, pour paître l'Église du ", ", qu'il s'est acquise par son propre ", "." ]
            [ "troupeau", "Seigneur", "sang" ]
        )
    , Verse
        "Romains 10:13"
        "Car quiconque invoquera le nom du Seigneur sera sauvé."
        (TextWithHoles
            [ "Car ", " invoquera le nom du ", " sera ", "." ]
            [ "quiconque", "Seigneur", "sauvé" ]
        )
    , Verse
        "Jean 14:15"
        "Si vous m'aimez, gardez mes commandements."
        (TextWithHoles
            [ "Si vous m'", ", ", " mes ", "." ]
            [ "aimez", "gardez", "commandements" ]
        )
    , Verse
        "Romains 1:18"
        "La colère de Dieu se révèle du ciel contre toute impiété et toute injustice des hommes qui retiennent injustement la vérité captive,"
        (TextWithHoles
            [ "La colère de ", " se révèle du ciel contre toute impiété et toute ", " des hommes qui retiennent injustement la ", " captive," ]
            [ "Dieu", "injustice", "vérité" ]
        )
    , Verse
        "Genèse 1:2"
        "La terre était informe et vide: il y avait des ténèbres à la surface de l'abîme, et l'esprit de Dieu se mouvait au-dessus des eaux."
        (TextWithHoles
            [ "La ", " était informe et vide: il y avait des ténèbres à la ", " de l'abîme, et l'esprit de ", " se mouvait au-dessus des eaux." ]
            [ "terre", "surface", "Dieu" ]
        )
    , Verse
        "Luc 4:18"
        "L'Esprit du Seigneur est sur moi, Parce qu'il m'a oint pour annoncer une bonne nouvelle aux pauvres; Il m'a envoyé pour guérir ceux qui ont le coeur brisé, Pour proclamer aux captifs la délivrance, Et aux aveugles le recouvrement de la vue, Pour renvoyer libres les opprimés,"
        (TextWithHoles
            [ "L'Esprit du ", " est sur moi, Parce qu'il m'a oint pour annoncer une bonne ", " aux pauvres; Il m'a envoyé pour guérir ceux qui ont le coeur brisé, Pour proclamer aux captifs la ", ", Et aux aveugles le recouvrement de la vue, Pour renvoyer libres les opprimés," ]
            [ "Seigneur", "nouvelle", "délivrance" ]
        )
    , Verse
        "Jean 3:5"
        "Jésus répondit: En vérité, en vérité, je te le dis, si un homme ne naît d'eau et d'Esprit, il ne peut entrer dans le royaume de Dieu."
        (TextWithHoles
            [ "Jésus répondit: En ", ", en vérité, je te le dis, si un homme ne naît d'eau et d'", ", il ne peut entrer dans le royaume de ", "." ]
            [ "vérité", "Esprit", "Dieu" ]
        )
    , Verse
        "Jean 4:1"
        "Le Seigneur sut que les pharisiens avaient appris qu'il faisait et baptisait plus de disciples que Jean."
        (TextWithHoles
            [ "Le Seigneur sut que les ", " avaient appris qu'il faisait et ", " plus de disciples que ", "." ]
            [ "pharisiens", "baptisait", "Jean" ]
        )
    , Verse
        "Hébreux 11:1"
        "Or la foi est une ferme assurance des choses qu'on espère, une démonstration de celles qu'on ne voit pas."
        (TextWithHoles
            [ "Or la foi est une ferme ", " des choses qu'on ", ", une ", " de celles qu'on ne voit pas." ]
            [ "assurance", "espère", "démonstration" ]
        )
    , Verse
        "Deutéronome 6:4"
        "Écoute, Israël! l'Éternel, notre Dieu, est le seul Éternel."
        (TextWithHoles
            [ "Écoute, ", "! l'Éternel, notre ", ", est le seul ", "." ]
            [ "Israël", "Dieu", "Éternel" ]
        )
    , Verse
        "Jean 8:32"
        "vous connaîtrez la vérité, et la vérité vous affranchira."
        (TextWithHoles
            [ "vous ", " la vérité, et la ", " vous ", "." ]
            [ "connaîtrez", "vérité", "affranchira" ]
        )
    , Verse
        "Hébreux 4:12"
        "Car la parole de Dieu est vivante et efficace, plus tranchante qu'une épée quelconque à deux tranchants, pénétrante jusqu'à partager âme et esprit, jointures et moelles; elle juge les sentiments et les pensées du coeur."
        (TextWithHoles
            [ "Car la parole de Dieu est ", " et efficace, plus tranchante qu'une épée quelconque à deux tranchants, pénétrante jusqu'à partager âme et ", ", jointures et moelles; elle juge les sentiments et les ", " du coeur." ]
            [ "vivante", "esprit", "pensées" ]
        )
    , Verse
        "Jacques 5:16"
        "Confessez donc vos péchés les uns aux autres, et priez les uns pour les autres, afin que vous soyez guéris. La prière fervente du juste a une grande efficacité."
        (TextWithHoles
            [ "Confessez donc vos ", " les uns aux autres, et priez les uns pour les autres, afin que vous soyez ", ". La prière ", " du juste a une grande efficacité." ]
            [ "péchés", "guéris", "fervente" ]
        )
    , Verse
        "Jean 1:29"
        "Le lendemain, il vit Jésus venant à lui, et il dit: Voici l'Agneau de Dieu, qui ôte le péché du monde."
        (TextWithHoles
            [ "Le lendemain, il vit ", " venant à lui, et il dit: Voici l'", " de Dieu, qui ôte le péché du ", "." ]
            [ "Jésus", "Agneau", "monde" ]
        )
    , Verse
        "Éphésiens 2:1"
        "Vous étiez morts par vos offenses et par vos péchés,"
        (TextWithHoles
            [ "Vous étiez ", " par vos ", " et par vos ", "," ]
            [ "morts", "offenses", "péchés" ]
        )
    , Verse
        "Jean 16:13"
        "Quand le consolateur sera venu, l'Esprit de vérité, il vous conduira dans toute la vérité; car il ne parlera pas de lui-même, mais il dira tout ce qu'il aura entendu, et il vous annoncera les choses à venir."
        (TextWithHoles
            [ "Quand le ", " sera venu, l'Esprit de vérité, il vous conduira dans toute la ", "; car il ne parlera pas de lui-même, mais il dira tout ce qu'il aura entendu, et il vous ", " les choses à venir." ]
            [ "consolateur", "vérité", "annoncera" ]
        )
    , Verse
        "Romains 13:1"
        "Que toute personne soit soumise aux autorités supérieures; car il n'y a point d'autorité qui ne vienne de Dieu, et les autorités qui existent ont été instituées de Dieu."
        (TextWithHoles
            [ "Que toute personne soit soumise aux ", " supérieures; car il n'y a point d'autorité qui ne vienne de ", ", et les autorités qui existent ont été ", " de Dieu." ]
            [ "autorités", "Dieu", "instituées" ]
        )
    , Verse
        "Matthieu 16:18"
        "Et moi, je te dis que tu es Pierre, et que sur cette pierre je bâtirai mon Église, et que les portes du séjour des morts ne prévaudront point contre elle."
        (TextWithHoles
            [ "Et moi, je te dis que tu es ", ", et que sur cette pierre je bâtirai mon ", ", et que les portes du séjour des morts ne ", " point contre elle." ]
            [ "Pierre", "Église", "prévaudront" ]
        )
    , Verse
        "Matthieu 25:31"
        "Lorsque le Fils de l'homme viendra dans sa gloire, avec tous les anges, il s'assiéra sur le trône de sa gloire."
        (TextWithHoles
            [ "Lorsque le ", " de l'homme viendra dans sa gloire, avec tous les ", ", il s'assiéra sur le trône de sa ", "." ]
            [ "Fils", "anges", "gloire" ]
        )
    , Verse
        "Genèse 3:15"
        "Je mettrai inimitié entre toi et la femme, entre ta postérité et sa postérité: celle-ci t'écrasera la tête, et tu lui blesseras le talon."
        (TextWithHoles
            [ "Je mettrai ", " entre toi et la femme, entre ta postérité et sa ", ": celle-ci t'écrasera la tête, et tu lui blesseras le ", "." ]
            [ "inimitié", "postérité", "talon" ]
        )
    , Verse
        "Jean 1:3"
        "Toutes choses ont été faites par elle, et rien de ce qui a été fait n'a été fait sans elle."
        (TextWithHoles
            [ "Toutes ", " ont été faites par elle, et rien de ce qui a été ", " n'a été fait sans ", "." ]
            [ "choses", "fait", "elle" ]
        )
    , Verse
        "Actes 17:11"
        "Ces Juifs avaient des sentiments plus nobles que ceux de Thessalonique; ils reçurent la parole avec beaucoup d'empressement, et ils examinaient chaque jour les Écritures, pour voir si ce qu'on leur disait était exact."
        (TextWithHoles
            [ "Ces Juifs avaient des ", " plus nobles que ceux de Thessalonique; ils reçurent la ", " avec beaucoup d'empressement, et ils examinaient chaque jour les Écritures, pour voir si ce qu'on leur disait était ", "." ]
            [ "sentiments", "parole", "exact" ]
        )
    , Verse
        "Jean 14:26"
        "Mais le consolateur, l'Esprit Saint, que le Père enverra en mon nom, vous enseignera toutes choses, et vous rappellera tout ce que je vous ai dit."
        (TextWithHoles
            [ "Mais le ", ", l'Esprit Saint, que le Père enverra en mon nom, vous ", " toutes choses, et vous rappellera tout ce que je vous ai ", "." ]
            [ "consolateur", "enseignera", "dit" ]
        )
    , Verse
        "Jean 8:44"
        "Vous avez pour père le diable, et vous voulez accomplir les désirs de votre père. Il a été meurtrier dès le commencement, et il ne se tient pas dans la vérité, parce qu'il n'y a pas de vérité en lui. Lorsqu'il profère le mensonge, il parle de son propre fonds; car il est menteur et le père du mensonge."
        (TextWithHoles
            [ "Vous avez pour père le ", ", et vous voulez accomplir les désirs de votre père. Il a été ", " dès le commencement, et il ne se tient pas dans la vérité, parce qu'il n'y a pas de vérité en lui. Lorsqu'il profère le mensonge, il parle de son propre fonds; car il est menteur et le père du ", "." ]
            [ "diable", "meurtrier", "mensonge" ]
        )
    , Verse
        "Jean 1:7"
        "Il vint pour servir de témoin, pour rendre témoignage à la lumière, afin que tous crussent par lui."
        (TextWithHoles
            [ "Il vint pour servir de ", ", pour rendre témoignage à la ", ", afin que tous ", " par lui." ]
            [ "témoin", "lumière", "crussent" ]
        )
    , Verse
        "Tite 2:11"
        "Car la grâce de Dieu, source de salut pour tous les hommes, a été manifestée."
        (TextWithHoles
            [ "Car la grâce de ", ", source de ", " pour tous les ", ", a été manifestée." ]
            [ "Dieu", "salut", "hommes" ]
        )
    , Verse
        "Matthieu 5:17"
        "Ne croyez pas que je sois venu pour abolir la loi ou les prophètes; je suis venu non pour abolir, mais pour accomplir."
        (TextWithHoles
            [ "Ne croyez pas que je sois venu pour abolir la ", " ou les prophètes; je suis venu non pour ", ", mais pour ", "." ]
            [ "loi", "abolir", "accomplir" ]
        )
    , Verse
        "Éphésiens 6:10"
        "Au reste, fortifiez-vous dans le Seigneur, et par sa force toute-puissante."
        (TextWithHoles
            [ "Au reste, ", "-vous dans le ", ", et par sa ", " toute-puissante." ]
            [ "fortifiez", "Seigneur", "force" ]
        )
    , Verse
        "Matthieu 22:37"
        "Jésus lui répondit: Tu aimeras le Seigneur, ton Dieu, de tout ton coeur, de toute ton âme, et de toute ta pensée."
        (TextWithHoles
            [ "Jésus lui répondit: Tu aimeras le ", ", ton ", ", de tout ton coeur, de toute ton âme, et de toute ta ", "." ]
            [ "Seigneur", "Dieu", "pensée" ]
        )
    , Verse
        "Colossiens 1:15"
        "Il est l'image du Dieu invisible, le premier-né de toute la création."
        (TextWithHoles
            [ "Il est l'image du ", " invisible, le ", "-né de toute la ", "." ]
            [ "Dieu", "premier", "création" ]
        )
    , Verse
        "Jean 15:5"
        "Je suis le cep, vous êtes les sarments. Celui qui demeure en moi et en qui je demeure porte beaucoup de fruit, car sans moi vous ne pouvez rien faire."
        (TextWithHoles
            [ "Je suis le cep, vous êtes les ", ". Celui qui demeure en moi et en qui je demeure porte beaucoup de ", ", car sans moi vous ne pouvez rien ", "." ]
            [ "sarments", "fruit", "faire" ]
        )
    , Verse
        "Jean 5:24"
        "En vérité, en vérité, je vous le dis, celui qui écoute ma parole, et qui croit à celui qui m'a envoyé, a la vie éternelle et ne vient point en jugement, mais il est passé de la mort à la vie."
        (TextWithHoles
            [ "En ", ", en vérité, je vous le dis, celui qui écoute ma ", ", et qui croit à celui qui m'a envoyé, a la vie éternelle et ne vient point en jugement, mais il est passé de la mort à la ", "." ]
            [ "vérité", "parole", "vie" ]
        )
    , Verse
        "Joël 2:28"
        "Après cela, je répandrai mon esprit sur toute chair; Vos fils et vos filles prophétiseront, Vos vieillards auront des songes, Et vos jeunes gens des visions."
        (TextWithHoles
            [ "Après cela, je répandrai mon ", " sur toute chair; Vos fils et vos filles ", ", Vos vieillards auront des songes, Et vos jeunes gens des ", "." ]
            [ "esprit", "prophétiseront", "visions" ]
        )
    , Verse
        "Philippiens 4:8"
        "Au reste, frères, que tout ce qui est vrai, tout ce qui est honorable, tout ce qui est juste, tout ce qui est pur, tout ce qui est aimable, tout ce qui mérite l'approbation, ce qui est vertueux et digne de louange, soit l'objet de vos pensées."
        (TextWithHoles
            [ "Au reste, frères, que tout ce qui est ", ", tout ce qui est honorable, tout ce qui est juste, tout ce qui est pur, tout ce qui est aimable, tout ce qui mérite l'", ", ce qui est vertueux et digne de louange, soit l'objet de vos ", "." ]
            [ "vrai", "approbation", "pensées" ]
        )
    , Verse
        "Hébreux 11:6"
        "Or sans la foi il est impossible de lui être agréable; car il faut que celui qui s'approche de Dieu croie que Dieu existe, et qu'il est le rémunérateur de ceux qui le cherchent."
        (TextWithHoles
            [ "Or sans la ", " il est ", " de lui être agréable; car il faut que celui qui s'approche de Dieu croie que ", " existe, et qu'il est le rémunérateur de ceux qui le cherchent." ]
            [ "foi", "impossible", "Dieu" ]
        )
    , Verse
        "Tite 2:13"
        "en attendant la bienheureuse espérance, et la manifestation de la gloire du grand Dieu et de notre Sauveur Jésus Christ,"
        (TextWithHoles
            [ "en attendant la ", " espérance, et la manifestation de la ", " du grand Dieu et de notre ", " Jésus Christ," ]
            [ "bienheureuse", "gloire", "Sauveur" ]
        )
    , Verse
        "Romains 10:17"
        "Ainsi la foi vient de ce qu'on entend, et ce qu'on entend vient de la parole de Christ."
        (TextWithHoles
            [ "Ainsi la ", " vient de ce qu'on entend, et ce qu'on ", " vient de la parole de ", "." ]
            [ "foi", "entend", "Christ" ]
        )
    , Verse
        "Michée 6:8"
        "On t'a fait connaître, ô homme, ce qui est bien; Et ce que l'Éternel demande de toi, C'est que tu pratiques la justice, Que tu aimes la miséricorde, Et que tu marches humblement avec ton Dieu."
        (TextWithHoles
            [ "On t'a fait connaître, ô ", ", ce qui est bien; Et ce que l'Éternel demande de toi, C'est que tu pratiques la ", ", Que tu aimes la miséricorde, Et que tu marches ", " avec ton Dieu." ]
            [ "homme", "justice", "humblement" ]
        )
    , Verse
        "Jean 2:15"
        "Ayant fait un fouet avec des cordes, il les chassa tous du temple, ainsi que les brebis et les boeufs; il dispersa la monnaie des changeurs, et renversa les tables;"
        (TextWithHoles
            [ "Ayant fait un fouet avec des ", ", il les chassa tous du ", ", ainsi que les brebis et les boeufs; il dispersa la ", " des changeurs, et renversa les tables;" ]
            [ "cordes", "temple", "monnaie" ]
        )
    , Verse
        "Genèse 3:1"
        "Le serpent était le plus rusé de tous les animaux des champs, que l'Éternel Dieu avait faits. Il dit à la femme: Dieu a-t-il réellement dit: Vous ne mangerez pas de tous les arbres du jardin?"
        (TextWithHoles
            [ "Le ", " était le plus rusé de tous les animaux des champs, que l'Éternel Dieu avait faits. Il dit à la ", ": Dieu a-t-il réellement dit: Vous ne mangerez pas de tous les arbres du ", "?" ]
            [ "serpent", "femme", "jardin" ]
        )
    , Verse
        "Proverbes 22:6"
        "Instruis l'enfant selon la voie qu'il doit suivre; Et quand il sera vieux, il ne s'en détournera pas."
        (TextWithHoles
            [ "Instruis l'", " selon la voie qu'il doit suivre; Et quand il sera ", ", il ne s'en ", " pas." ]
            [ "enfant", "vieux", "détournera" ]
        )
    , Verse
        "Jacques 1:2"
        "Mes frères, regardez comme un sujet de joie complète les diverses épreuves auxquelles vous pouvez être exposés,"
        (TextWithHoles
            [ "Mes ", ", regardez comme un sujet de ", " complète les diverses ", " auxquelles vous pouvez être exposés," ]
            [ "frères", "joie", "épreuves" ]
        )
    , Verse
        "Actes 2:4"
        "Et ils furent tous remplis du Saint Esprit, et se mirent à parler en d'autres langues, selon que l'Esprit leur donnait de s'exprimer."
        (TextWithHoles
            [ "Et ils furent tous ", " du Saint Esprit, et se mirent à parler en d'autres ", ", selon que l'", " leur donnait de s'exprimer." ]
            [ "remplis", "langues", "Esprit" ]
        )
    , Verse
        "Marc 16:16"
        "Celui qui croira et qui sera baptisé sera sauvé, mais celui qui ne croira pas sera condamné."
        (TextWithHoles
            [ "Celui qui ", " et qui sera ", " sera sauvé, mais celui qui ne croira pas sera ", "." ]
            [ "croira", "baptisé", "condamné" ]
        )
    , Verse
        "Romains 3:10"
        "selon qu'il est écrit: Il n'y a point de juste, Pas même un seul;"
        (TextWithHoles
            [ "selon qu'il est ", ": Il n'y a point de ", ", Pas même un ", ";" ]
            [ "écrit", "juste", "seul" ]
        )
    ]
