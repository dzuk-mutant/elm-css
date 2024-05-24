module Specific.Property.Transition exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 transition
            { functionName = "transition", propertyName = "transition" }
            [ ( none, "none" ) ]

        , CssTest.property1 transitionProperty
            { functionName = "transitionProperty", propertyName = "transition-property" }
            [ ( none, "none" )
            , ( all_, "all" )
            , ( background_, "background" )
            , ( backgroundColor_, "background-color" )
            , ( backgroundPosition_, "background-position" )
            , ( backgroundSize_, "background-size" )
            , ( border_, "border" )
            , ( borderBottom_, "border-bottom" )
            , ( borderBottomColor_, "border-bottom-color" )
            , ( borderBottomLeftRadius_, "border-bottom-left-radius" )
            , ( borderBottomRightRadius_, "border-bottom-right-radius" )
            , ( borderBottomWidth_, "border-bottom-width" )
            , ( borderColor_, "border-color" )
            , ( borderLeft_, "border-left" )
            , ( borderLeftColor_, "border-left-color" )
            , ( borderLeftWidth_, "border-left-width" )
            , ( borderRadius_, "border-radius" )
            , ( borderRight_, "border-right" )
            , ( borderRightColor_, "border-right-color" )
            , ( borderRightWidth_, "border-right-width" )
            , ( borderTop_, "border-top" )
            , ( borderTopColor_, "border-top-color" )
            , ( borderTopLeftRadius_, "border-top-left-radius" )
            , ( borderTopRightRadius_, "border-top-right-radius" )
            , ( borderTopWidth_, "border-top-width" )
            , ( borderWidth_, "border-width" )
            , ( bottom_, "bottom" )
            , ( boxShadow_, "box-shadow" )
            , ( caretColor_, "caret-color" )
            , ( clip_, "clip" )
            , ( clipPath_, "clip-path" )
            , ( color_, "color" )
            , ( columnCount_, "column-count" )
            , ( columnGap_, "column-gap" )
            , ( columnRule_, "column-rule" )
            , ( columnRuleColor_, "column-rule-color" )
            , ( columnRuleWidth_, "column-rule-width" )
            , ( columnWidth_, "column-width" )
            , ( columns_, "columns" )
            , ( filter_, "filter" )
            , ( flex_, "flex" )
            , ( flexBasis_, "flex-basis" )
            , ( flexGrow_, "flex-grow" )
            , ( flexShrink_, "flex-shrink" )
            , ( font_, "font" )
            , ( fontSize_, "font-size" )
            , ( fontSizeAdjust_, "font-size-adjust" )
            , ( fontStretch_, "font-stretch" )
            , ( fontVariationSettings_, "font-variation-settings" )
            , ( fontWeight_, "font-weight" )
            , ( gridColumnGap_, "grid-column-gap" )
            , ( gridGap_, "grid-gap" )
            , ( gridRowGap_, "grid-row-gap" )
            , ( height_, "height" )
            , ( left_, "left" )
            , ( letterSpacing_, "letter-spacing" )
            , ( lineHeight_, "line-height" )
            , ( margin_, "margin" )
            , ( marginBottom_, "margin-bottom" )
            , ( marginLeft_, "margin-left" )
            , ( marginRight_, "margin-right" )
            , ( marginTop_, "margin-top" )
            , ( mask_, "mask" )
            , ( maskPosition_, "mask-position" )
            , ( maskSize_, "mask-size" )
            , ( maxHeight_, "max-height" )
            , ( maxWidth_, "max-width" )
            , ( minHeight_, "min-height" )
            , ( minWidth_, "min-width" )
            , ( objectPosition_, "object-position" )
            , ( offset_, "offset" )
            , ( offsetAnchor_, "offset-anchor" )
            , ( offsetDistance_, "offset-distance" )
            , ( offsetPath_, "offset-path" )
            , ( offsetRotate_, "offset-rotate" )
            , ( opacity__, "opacity" )
            , ( order_, "order" )
            , ( outline_, "outline" )
            , ( outlineColor_, "outline-color" )
            , ( outlineOffset_, "outline-offset" )
            , ( outlineWidth_, "outline-width" )
            , ( padding_, "padding" )
            , ( paddingBottom_, "padding-bottom" )
            , ( paddingLeft_, "padding-left" )
            , ( paddingRight_, "padding-right" )
            , ( paddingTop_, "padding-top" )
            , ( right_, "right" )
            , ( tabSize_, "tab-size" )
            , ( textIndent_, "text-indent" )
            , ( textShadow_, "text-shadow" )
            , ( top_, "top" )
            , ( transform_, "transform" )
            , ( transformOrigin_, "transform-origin" )
            , ( verticalAlign_, "vertical-align" )
            , ( visibility_, "visibility" )
            , ( width_, "width" )
            , ( wordSpacing_, "word-spacing" )
            , ( zIndex_, "z-index" )
            ]

        , CssTest.property1 transitionDuration
            { functionName = "transitionDuration", propertyName = "transition-duration" }
            CssTest.time

        , CssTest.property1 transitionDelay
            { functionName = "transitionDelay", propertyName = "transition-delay" }
            CssTest.time

        , CssTest.property1 transitionBehavior
            { functionName = "transitionBehavior", propertyName = "transition-behavior" }
            [ ( allowDiscrete, "allow-discrete" )
            , ( normal, "normal" )
            ]

        , CssTest.property1 transitionTimingFunction
            { functionName = "transitionTimingFunction", propertyName = "transition-timing-function" }
            CssTest.easingFunction

        , CssTest.property
            { functionName = "transitionMany", propertyName = "transition" }
            [ ( transitionMany [], "none" )
            , ( transitionMany [ defaultTransition ]
              , "all ease 0s 0s normal"
              )
            , ( transitionMany
                    [ { defaultTransition
                        | property = marginRight_
                        , easingFunction = easeOut
                        , duration = s 4
                        , delay = s 2
                        , behavior = allowDiscrete
                      }
                    ]
              , "margin-right ease-out 4s 2s allow-discrete"
              )
            ]
        ]
