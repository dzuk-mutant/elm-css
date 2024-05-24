module Specific.Property.Animation exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [  CssTest.property1 animationName
            { functionName = "animationName", propertyName = "animation-name" }
            [ ( none, "none" )
            , ( string "hi\\\"", "\"hi\\\\\\\"\"" )
            , ( customIdent "hello-world", "hello-world" )

            -- for animationName tests with keyframes, see the Keyframes module
            ]


        , CssTest.property { functionName = "animationNames", propertyName = "animation-name" }
            [ ( animationNameMany [ customIdent "hello-world", none, string "pulse" ], "hello-world,none,\"pulse\"" )
            , ( animationNameMany [ none , customIdent "pulse" ], "none,pulse" )
            , ( animationNameMany [ string "pulse" ], "\"pulse\"" )
            ]

        , CssTest.property1 animationDuration
            { functionName = "animationDuration", propertyName = "animation-duration" }
            CssTest.time

        , CssTest.property { functionName = "animationDurations", propertyName = "animation-duration" }
            [ ( animationDurationMany [ (s 1), s 2.5, ms 10.3 ], "1s,2.5s,10.3ms" )
            , ( animationDurationMany [ (ms 310), s 3 ], "310ms,3s" )
            , ( animationDurationMany [ (ms 50) ], "50ms" )
            ]

        , CssTest.property1 animationTimingFunction
            { functionName = "animationTimingFunction", propertyName = "animation-timing-function" }
            CssTest.easingFunction

        , CssTest.property { functionName = "animationTimingFunctions", propertyName = "animation-timing-function" }
            [ ( animationTimingFunctionMany [ linear, ease, stepEnd ], "linear,ease,step-end" )
            , ( animationTimingFunctionMany [ ease, steps2 4 end ], "ease,steps(4,end)" )
            , ( animationTimingFunctionMany [ easeIn, cubicBezier 0.3 0 1 1 ], "ease-in,cubic-bezier(0.3,0,1,1)" )
            , ( animationTimingFunctionMany [ easeOut, stepStart, stepEnd, steps 4 ], "ease-out,step-start,step-end,steps(4)" )
            , ( animationTimingFunctionMany [ easeInOut, linear, easeIn, easeOut ], "ease-in-out,linear,ease-in,ease-out" )
            , ( animationTimingFunctionMany [ cubicBezier 0.3 2 0.8 5], "cubic-bezier(0.3,2,0.8,5)" )
            , ( animationTimingFunctionMany [ stepStart, steps2 4 start, steps2 3 jumpBoth ], "step-start,steps(4,start),steps(3,jump-both)" )
            , ( animationTimingFunctionMany [ stepEnd, steps 5 ], "step-end,steps(5)" )
            , ( animationTimingFunctionMany [ steps 4, linear, steps2 5 jumpStart, steps2 2 jumpEnd, steps2 10 jumpNone ], "steps(4),linear,steps(5,jump-start),steps(2,jump-end),steps(10,jump-none)" )
            , ( animationTimingFunctionMany [ steps2 4 jumpStart ], "steps(4,jump-start)" )
            ]
        , CssTest.property1 animationIterationCount
            { functionName = "animationIterationCount", propertyName = "animation-iteration-count" }
            [ ( infinite, "infinite" )
            , ( num 3, "3" )
            , ( num 4.5, "4.5" )
            , ( zero, "0" )
            , ( calc (num 1) (dividedBy (num 3)), "calc(1 / 3)" )
            ]

        , CssTest.property { functionName = "animationIterationCounts", propertyName = "animation-iteration-count" }
            [ ( animationIterationCountMany [ infinite, num 3, zero ], "infinite,3,0" )
            , ( animationIterationCountMany [ zero, infinite ], "0,infinite" )
            , ( animationIterationCountMany [ (num 2), calc (num 4) (times (num 3)) ], "2,calc(4 * 3)" )
            , ( animationIterationCountMany [ calc (num 3) (plus <| num 4) ], "calc(3 + 4)" )
            ]

        , CssTest.property1 animationDirection
            { functionName = "animationDirection", propertyName = "animation-direction" }
            [ ( normal, "normal" )
            , ( reverse, "reverse" )
            , ( alternate, "alternate" )
            , ( alternateReverse, "alternate-reverse" )
            ]

        , CssTest.property { functionName = "animationDirections", propertyName = "animation-direction" }
            [ ( animationDirectionMany [ normal, alternate, reverse ], "normal,alternate,reverse" )
            , ( animationDirectionMany [ reverse, normal, normal ], "reverse,normal,normal" )
            , ( animationDirectionMany [ alternate, alternateReverse ], "alternate,alternate-reverse" )
            , ( animationDirectionMany [ alternateReverse ], "alternate-reverse" )
            ]

        , CssTest.property1 animationPlayState
            { functionName = "animationPlayState", propertyName = "animation-play-state" }
            [ ( running, "running" )
            , ( paused, "paused" )
            ]

        , CssTest.property
            { functionName = "animationPlayStates", propertyName = "animation-play-state" }
            [ ( animationPlayStateMany [ running, running, running, paused, running ], "running,running,running,paused,running" )
            , ( animationPlayStateMany [ paused, running ], "paused,running" )
            , ( animationPlayStateMany [ paused ], "paused" )
            ]

        , CssTest.property1 animationDelay
            { functionName = "animationDelay", propertyName = "animation-delay" }
            CssTest.time

        , CssTest.property { functionName = "animationDelays", propertyName = "animation-delay" }
            [ ( animationDelayMany [ s 1, s 2.5, ms 10.3 ], "1s,2.5s,10.3ms" )
            , ( animationDelayMany [ ms 310, s 3 ], "310ms,3s" )
            , ( animationDelayMany [ ms 50 ], "50ms" )
            ]

        , CssTest.property1 animationFillMode
            { functionName = "animationFillMode", propertyName = "animation-fill-mode" }
            [ ( none, "none" )
            , ( forwards, "forwards" )
            , ( backwards, "backwards" )
            , ( both, "both" )
            ]
            
        , CssTest.property { functionName = "animationFillModes", propertyName = "animation-fill-mode" }
            [ ( animationFillModeMany [ none, forwards ], "none,forwards" )
            , ( animationFillModeMany [ forwards, backwards, both ], "forwards,backwards,both" )
            , ( animationFillModeMany [ backwards, none ], "backwards,none" )
            , ( animationFillModeMany [ both ], "both" )
            ]
        ]
