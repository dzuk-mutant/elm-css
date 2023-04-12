module Specific.Property.List exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 listStyleType
            { functionName = "listStyleType", propertyName = "list-style-type" }
            CssTest.listStyleType

        , CssTest.property1 listStyleImage
            { functionName = "listStyleImage", propertyName = "list-style-image" }
            CssTest.image

        , CssTest.property1 listStylePosition
            { functionName = "listStylePosition", propertyName = "list-style-position" }
            [ ( inside, "inside" )
            , ( outside, "outside" )
            ]
        , CssTest.property1 listStyle
            { functionName = "listStyle", propertyName = "list-style" }
            ([ ( inside, "inside" )
             , ( outside, "outside" )
             ]
                ++ CssTest.listStyleType
                ++ CssTest.image
            )
        , CssTest.property { functionName = "listStyle2", propertyName = "list-style" }
            [ ( listStyle2 none inside, "none inside" )
            , ( listStyle2 (string "arbitrary\n\"\\") outside, "\"arbitrary\\A \\\"\\\\\" outside" )
            , ( listStyle2 (customIdent "hello-world") inside, "hello-world inside" )
            , ( listStyle2 arabicIndic outside, "arabic-indic outside" )
            , ( listStyle2 armenian inside, "armenian inside" )
            , ( listStyle2 bengali outside, "bengali outside" )
            , ( listStyle2 cambodian inside, "cambodian inside" )
            , ( listStyle2 circle_ outside, "circle outside" )
            , ( listStyle2 cjkDecimal inside, "cjk-decimal inside" )
            , ( listStyle2 cjkEarthlyBranch outside, "cjk-earthly-branch outside" )
            , ( listStyle2 cjkHeavenlyStem inside, "cjk-heavenly-stem inside" )
            , ( listStyle2 cjkIdeographic outside, "cjk-ideographic outside" )
            , ( listStyle2 decimal inside, "decimal inside" )
            , ( listStyle2 decimalLeadingZero outside, "decimal-leading-zero outside" )
            , ( listStyle2 devanagari inside, "devanagari inside" )
            , ( listStyle2 disc outside, "disc outside" )
            , ( listStyle2 disclosureClosed inside, "disclosure-closed inside" )
            , ( listStyle2 disclosureOpen outside, "disclosure-open outside" )
            , ( listStyle2 ethiopicNumeric inside, "ethiopic-numeric inside" )
            , ( listStyle2 georgian outside, "georgian outside" )
            , ( listStyle2 gujarati inside, "gujarati inside" )
            , ( listStyle2 gurmukhi outside, "gurmukhi outside" )
            , ( listStyle2 hebrew inside, "hebrew inside" )
            , ( listStyle2 hiragana outside, "hiragana outside" )
            , ( listStyle2 hiraganaIroha inside, "hiragana-iroha inside" )
            , ( listStyle2 japaneseFormal outside, "japanese-formal outside" )
            , ( listStyle2 japaneseInformal inside, "japanese-informal inside" )
            , ( listStyle2 kannada outside, "kannada outside" )
            , ( listStyle2 katakana inside, "katakana inside" )
            , ( listStyle2 katakanaIroha outside, "katakana-iroha outside" )
            , ( listStyle2 khmer inside, "khmer inside" )
            , ( listStyle2 koreanHangulFormal outside, "korean-hangul-formal outside" )
            , ( listStyle2 koreanHanjaFormal inside, "korean-hanja-formal inside" )
            , ( listStyle2 koreanHanjaInformal outside, "korean-hanja-informal outside" )
            , ( listStyle2 lao inside, "lao inside" )
            , ( listStyle2 lowerAlpha outside, "lower-alpha outside" )
            , ( listStyle2 lowerArmenian inside, "lower-armenian inside" )
            , ( listStyle2 lowerGreek outside, "lower-greek outside" )
            , ( listStyle2 lowerLatin inside, "lower-latin inside" )
            , ( listStyle2 lowerRoman outside, "lower-roman outside" )
            , ( listStyle2 malayalam inside, "malayalam inside" )
            , ( listStyle2 myanmar outside, "myanmar outside" )
            , ( listStyle2 oriya inside, "oriya inside" )
            , ( listStyle2 persian outside, "persian outside" )
            , ( listStyle2 simpChineseFormal inside, "simp-chinese-formal inside" )
            , ( listStyle2 simpChineseInformal outside, "simp-chinese-informal outside" )
            , ( listStyle2 square inside, "square inside" )
            , ( listStyle2 tamil outside, "tamil outside" )
            , ( listStyle2 telugu inside, "telugu inside" )
            , ( listStyle2 thai outside, "thai outside" )
            , ( listStyle2 tibetan inside, "tibetan inside" )
            , ( listStyle2 tradChineseFormal outside, "trad-chinese-formal outside" )
            , ( listStyle2 tradChineseInformal inside, "trad-chinese-informal inside" )
            , ( listStyle2 upperAlpha outside, "upper-alpha outside" )
            , ( listStyle2 upperArmenian inside, "upper-armenian inside" )
            , ( listStyle2 upperLatin outside, "upper-latin outside" )
            , ( listStyle2 upperRoman inside, "upper-roman inside" )
            ]
        , CssTest.property { functionName = "listStyle3", propertyName = "list-style" }
            [ ( listStyle3 none inside (url "https://example.com"), "none inside url(https://example.com)" )
            , ( listStyle3 (string "arbitrary\n\"\\") outside (linearGradient (stop <| hex "111") (stop <| hex "aaa") []), "\"arbitrary\\A \\\"\\\\\" outside linear-gradient(#111,#aaa)" )
            , ( listStyle3 (customIdent "hello-world") inside none, "hello-world inside none" )
            , ( listStyle3 arabicIndic outside none, "arabic-indic outside none" )
            , ( listStyle3 armenian inside none, "armenian inside none" )
            , ( listStyle3 bengali outside none, "bengali outside none" )
            , ( listStyle3 cambodian inside none, "cambodian inside none" )
            , ( listStyle3 circle_ outside none, "circle outside none" )
            , ( listStyle3 cjkDecimal inside none, "cjk-decimal inside none" )
            , ( listStyle3 cjkEarthlyBranch outside none, "cjk-earthly-branch outside none" )
            , ( listStyle3 cjkHeavenlyStem inside none, "cjk-heavenly-stem inside none" )
            , ( listStyle3 cjkIdeographic outside none, "cjk-ideographic outside none" )
            , ( listStyle3 decimal inside none, "decimal inside none" )
            , ( listStyle3 decimalLeadingZero outside none, "decimal-leading-zero outside none" )
            , ( listStyle3 devanagari inside none, "devanagari inside none" )
            , ( listStyle3 disc outside none, "disc outside none" )
            , ( listStyle3 disclosureClosed inside none, "disclosure-closed inside none" )
            , ( listStyle3 disclosureOpen outside none, "disclosure-open outside none" )
            , ( listStyle3 ethiopicNumeric inside none, "ethiopic-numeric inside none" )
            , ( listStyle3 georgian outside none, "georgian outside none" )
            , ( listStyle3 gujarati inside none, "gujarati inside none" )
            , ( listStyle3 gurmukhi outside none, "gurmukhi outside none" )
            , ( listStyle3 hebrew inside none, "hebrew inside none" )
            , ( listStyle3 hiragana outside none, "hiragana outside none" )
            , ( listStyle3 hiraganaIroha inside none, "hiragana-iroha inside none" )
            , ( listStyle3 japaneseFormal outside none, "japanese-formal outside none" )
            , ( listStyle3 japaneseInformal inside none, "japanese-informal inside none" )
            , ( listStyle3 kannada outside none, "kannada outside none" )
            , ( listStyle3 katakana inside none, "katakana inside none" )
            , ( listStyle3 katakanaIroha outside none, "katakana-iroha outside none" )
            , ( listStyle3 khmer inside none, "khmer inside none" )
            , ( listStyle3 koreanHangulFormal outside none, "korean-hangul-formal outside none" )
            , ( listStyle3 koreanHanjaFormal inside none, "korean-hanja-formal inside none" )
            , ( listStyle3 koreanHanjaInformal outside none, "korean-hanja-informal outside none" )
            , ( listStyle3 lao inside none, "lao inside none" )
            , ( listStyle3 lowerAlpha outside none, "lower-alpha outside none" )
            , ( listStyle3 lowerArmenian inside none, "lower-armenian inside none" )
            , ( listStyle3 lowerGreek outside none, "lower-greek outside none" )
            , ( listStyle3 lowerLatin inside none, "lower-latin inside none" )
            , ( listStyle3 lowerRoman outside none, "lower-roman outside none" )
            , ( listStyle3 malayalam inside none, "malayalam inside none" )
            , ( listStyle3 myanmar outside none, "myanmar outside none" )
            , ( listStyle3 oriya inside none, "oriya inside none" )
            , ( listStyle3 persian outside none, "persian outside none" )
            , ( listStyle3 simpChineseFormal inside none, "simp-chinese-formal inside none" )
            , ( listStyle3 simpChineseInformal outside none, "simp-chinese-informal outside none" )
            , ( listStyle3 square inside none, "square inside none" )
            , ( listStyle3 tamil outside none, "tamil outside none" )
            , ( listStyle3 telugu inside none, "telugu inside none" )
            , ( listStyle3 thai outside none, "thai outside none" )
            , ( listStyle3 tibetan inside none, "tibetan inside none" )
            , ( listStyle3 tradChineseFormal outside none, "trad-chinese-formal outside none" )
            , ( listStyle3 tradChineseInformal inside none, "trad-chinese-informal inside none" )
            , ( listStyle3 upperAlpha outside none, "upper-alpha outside none" )
            , ( listStyle3 upperArmenian inside none, "upper-armenian inside none" )
            , ( listStyle3 upperLatin outside none, "upper-latin outside none" )
            , ( listStyle3 upperRoman inside none, "upper-roman inside none" )
            ]
        ]