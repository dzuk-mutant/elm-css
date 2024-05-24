module Css exposing
    ( Style, batch
    , property
    , important

    -- pseudo-classes
    , pseudoClass
    , active, checked, default, defined, disabled, empty, enabled
    , first, firstChild, firstOfType, focus, fullscreen, hover, inRange
    , indeterminate, invalid, lastChild, lastOfType, leftHandPage, link, onlyChild
    , onlyOfType, outOfRange, readOnly, readWrite, required, rightHandPage
    , root, scope, target, valid, visited

    -- pseudo-classes with args
    , dir, lang, not
    , nthChild, nthLastChild, nthOfType, nthLastOfType

    -- pseudo-elements
    , pseudoElement
    , after, backdrop, before, cue, firstLetter, firstLine
    , marker, placeholder, selection

    -- pseudo-elements with args
    , slotted

    -- common value groups
    , BaseValue
    , ImageSupported, Image
    , Angle, AngleSupported, Width, WidthSupported
    , BasicShape, BasicShapeSupported
    , BlendMode, BlendModeSupported
    , FilterFunction, FilterFunctionSupported
    , Length, LengthSupported
    , Color, ColorSupported
    , LineStyle, LineStyleSupported
    , LineWidth, LineWidthSupported
    , Time, TimeSupported

    -- calc
    , CalcOperation
    , calc, minus, plus, times, dividedBy

    -- common value types
    , zero, px, em, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, q, inch, pt, pc, pct
    , fr, minmax, fitContentTo
    , deg, grad, rad, turn
    , s, ms
    , num, int 
    , rgb, rgba, hsl, hsla, hex, currentcolor
    , string, customIdent, url
    , insetRect, insetRect2, insetRect3, insetRect4
    , insetRound, insetRound2, insetRound3, insetRound4
    , circle, circleAt, circleAt2
    , ellipse, ellipseAt, ellipseAt2
    , closestSide, farthestSide, polygon, path
    , blur, brightness, contrast, dropShadow, grayscale, hueRotate, invert, opacity_, saturate, sepia
    , multiply, screen, overlay, darken, lighten, colorDodge, colorBurn, hardLight, softLight, difference, exclusion, hue, saturation, color_, luminosity

    -- common/shared/grouped keyword values
    , unset, initial, inherit, revert
    , auto, none
    , left_, right_, top_, bottom_
    , block, inline, start, end, blockStart, blockEnd, inlineStart, inlineEnd
    , minContent, maxContent, fitContent
    , x, y, z
    , stretch, center
    , marginBox, borderBox, paddingBox, contentBox, fillBox, strokeBox, viewBox
    , baseline, sub, super, ruby, fullWidth, under, circle_
    , hidden, visible
    , thin, thick
    , normal, strict, all_, both, always, scroll, column
    , content, fill_, stroke, text, style
    , clip, cover, contain_
    , repeat, noRepeat, repeatX, repeatY, space, round_
    , isolate, matchParent, nowrap

    -- all
    , all

    -- display
    , display, display2, displayListItem2, displayListItem3
    , flex_, flow, flowRoot, grid_, contents, listItem
    , inlineBlock, inlineFlex, inlineTable, inlineGrid
    , rubyBase, rubyBaseContainer, rubyText, rubyTextContainer
    , runIn, table
    , tableCaption, tableCell, tableColumn, tableColumnGroup, tableFooterGroup, tableHeaderGroup, tableRow, tableRowGroup
    
    -- position
    , position
    , absolute, fixed, relative, static, sticky

    -- stacking contexts + box-sizing
    , zIndex, isolation, boxSizing

    -- contain (DOM)
    , contain, contain2, contain3, contain4
    , size, inlineSize_, layout, paint
    , containIntrinsicSize, containIntrinsicSize2, containIntrinsicSize4
    , containIntrinsicWidth, containIntrinsicWidth2, containIntrinsicHeight, containIntrinsicHeight2
    , containIntrinsicInlineSize, containIntrinsicInlineSize2, containIntrinsicBlockSize, containIntrinsicBlockSize2

    -- sizing
    , width, minWidth, maxWidth, height, minHeight, maxHeight
    , blockSize, minBlockSize, maxBlockSize
    , inlineSize, minInlineSize, maxInlineSize

    -- insets
    , inset, inset2, inset3, inset4, top, right, bottom, left
    , insetBlock, insetBlock2, insetInline, insetInline2
    , insetBlockStart, insetBlockEnd, insetInlineStart, insetInlineEnd

    -- margins
    , margin, margin2, margin3, margin4
    , marginTop, marginRight, marginBottom, marginLeft
    , marginBlock, marginBlock2, marginBlockStart, marginBlockEnd
    , marginInline, marginInline2, marginInlineStart, marginInlineEnd

    -- paddings
    , padding, padding2, padding3, padding4
    , paddingTop, paddingRight, paddingBottom, paddingLeft
    , paddingBlock, paddingBlock2, paddingBlockStart, paddingBlockEnd
    , paddingInline, paddingInline2, paddingInlineStart, paddingInlineEnd

    -- borders
    , border, border2, border3
    , borderTop, borderTop2, borderTop3
    , borderRight, borderRight2, borderRight3
    , borderBottom, borderBottom2, borderBottom3
    , borderLeft, borderLeft2, borderLeft3
    , borderBlock, borderBlock2, borderBlock3
    , borderBlockStart, borderBlockStart2, borderBlockStart3
    , borderBlockEnd, borderBlockEnd2, borderBlockEnd3
    , borderInline, borderInline2, borderInline3
    , borderInlineStart, borderInlineStart2, borderInlineStart3
    , borderInlineEnd, borderInlineEnd2, borderInlineEnd3
    , borderWidth, borderWidth2, borderWidth3, borderWidth4
    , borderTopWidth, borderRightWidth, borderBottomWidth, borderLeftWidth
    , borderBlockWidth, borderBlockStartWidth, borderBlockEndWidth
    , borderInlineWidth, borderInlineStartWidth, borderInlineEndWidth
    , borderStyle, borderStyle2, borderStyle3, borderStyle4
    , borderTopStyle, borderRightStyle, borderBottomStyle, borderLeftStyle
    , borderBlockStyle, borderBlockStartStyle, borderBlockEndStyle
    , borderInlineStyle, borderInlineStartStyle, borderInlineEndStyle
    , dotted, dashed, solid, double, groove, ridge, inset_, outset
    , borderColor, borderColor2, borderColor3, borderColor4
    , borderTopColor, borderRightColor, borderBottomColor, borderLeftColor
    , borderBlockColor, borderBlockStartColor, borderBlockEndColor
    , borderInlineColor, borderInlineStartColor, borderInlineEndColor
    , borderRadius, borderRadius2, borderRadius3, borderRadius4
    , borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2
    , borderBottomRightRadius, borderBottomRightRadius2, borderBottomLeftRadius, borderBottomLeftRadius2
    , borderStartStartRadius, borderStartStartRadius2, borderStartEndRadius, borderStartEndRadius2
    , borderEndStartRadius, borderEndStartRadius2, borderEndEndRadius, borderEndEndRadius2
    , borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4
    , borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4

    -- outlines
    , outline, outline3, outlineWidth, outlineColor
    , invert_, outlineStyle, outlineOffset

    -- overflow and resizing
    , overflow, overflow2
    , overflowX, overflowY, overflowBlock, overflowInline
    , overflowWrap, overflowAnchor
    , breakWord, anywhere
    , resize, horizontal, vertical

    -- flex
    , flex, flex2, flex3
    , flexDirection
    , flexBasis
    , flexGrow
    , flexShrink
    , flexWrap
    , flexFlow, flexFlow2
    , alignContent, alignContent2
    , alignItems, alignItems2
    , alignSelf, alignSelf2
    , justifyContent, justifyContent2
    , justifyItems, justifyItems2
    , justifySelf, justifySelf2
    , placeContent, placeContent2
    , placeItems, placeItems2
    , placeSelf, placeSelf2
    , order
    --
    , row, rowReverse, columnReverse
    , flexStart, flexEnd, selfStart, selfEnd
    , spaceBetween, spaceAround, spaceEvenly
    , firstBaseline, lastBaseline
    , safe, unsafe
    , legacy, legacyLeft, legacyRight, legacyCenter
    , wrap, wrapReverse
    
    -- grid
    -- types
    , FixedSizeSupported
    , TrackBreadthSupported
    , TrackSizeSupported, TrackSize
    -- grid auto
    , gridAutoRows, gridAutoRowsMany
    , gridAutoColumns, gridAutoColumnsMany
    , gridAutoFlow, gridAutoFlow2
    -- grid areas
    , GridLine, gridLineIdent, gridLineSpanNum, gridLineSpanIdent
    , gridArea, gridArea2, gridArea3, gridArea4
    , gridRow, gridRow2
    , gridRowStart, gridRowEnd
    , gridColumn, gridColumn2
    , gridColumnStart, gridColumnEnd
    -- grid templates
    , gridTemplate
    , gridTemplateAreas, gridTemplateAreasCells
    , gridTemplateRows
    , gridTemplateColumns
    , templateRowsColumns, templateAreasRowsColumns
    , templateAreaRow, templateColumns
    , trackList, autoTrackList
    , fixedRepeat, autoRepeat
    , autoFill, autoFit, lineNames
    , dense

    -- gaps
    , gap, gap2, rowGap, columnGap

    -- backgrounds
    , backgroundColor
    , backgroundAttachment, backgroundAttachmentMany, local
    , backgroundBlendMode, backgroundBlendModeMany
    , backgroundClip, backgroundClipMany
    , backgroundOrigin, backgroundOriginMany
    , backgroundImage, backgroundImageMany
    , backgroundPosition, backgroundPosition2, backgroundPosition3, backgroundPosition4
    , backgroundRepeat, backgroundRepeat2
    , backgroundSize, backgroundSize2

    -- Font size
    , fontSize
    , xxSmall, xSmall, small, medium, large, xLarge, xxLarge, xxxLarge, smaller, larger
    , fontSizeAdjust

    -- @font-face
    , fontDisplay, fallback, swap, optional

    -- Font family
    , fontFamily, fontFamilyMany
    , serif, sansSerif, monospace, cursive, fantasy
    , systemUi, uiSerif, uiSansSerif, uiMonospace, uiRounded
    , math, fangsong

    -- Font color, style, weight + stretch
    , color
    , fontStyle, italic, oblique
    , fontWeight, bold, lighter, bolder
    , fontStretch, ultraCondensed, extraCondensed, condensed, semiCondensed, semiExpanded, expanded, extraExpanded, ultraExpanded
    , fontSynthesis, fontSynthesis2, fontSynthesis3
    , weight
    , fontVariationSettings, fontVariationSettingsMany

    -- Typographic features
    , fontFeatureSettings, fontFeatureSettingsMany
    , featureTag, featureTag2

    , AllFontVariants, AllFontVariantsSupported
    , fontVariant, fontVariant2
    , FontVariantCapsSupported
    , fontVariantCaps
    , smallCaps, allSmallCaps, petiteCaps, allPetiteCaps, unicase, titlingCaps
    , FontVariantEastAsianSupported, FontVariantEastAsian
    , fontVariantEastAsian, fontVariantEastAsian2, fontVariantEastAsian3
    , jis78, jis83, jis90, jis04, simplified, traditional, proportionalWidth
    , FontVariantLigaturesSupported
    , fontVariantLigatures
    , commonLigatures, noCommonLigatures, discretionaryLigatures, noDiscretionaryLigatures, historicalLigatures, noHistoricalLigatures, contextual, noContextual
    , FontVariantNumericSupported, FontVariantNumeric
    , fontVariantNumeric, fontVariantNumeric4
    , ordinal, slashedZero, liningNums, oldstyleNums, proportionalNums, tabularNums, diagonalFractions, stackedFractions
    , FontVariantEmojiSupported
    , fontVariantEmoji, emoji, unicode
    , FontVariantPositionSupported
    , fontVariantPosition
    , fontKerning
    , fontLanguageOverride
    , fontOpticalSizing
    
    -- Typographic metrics
    , lineHeight
    , letterSpacing
    , textIndent, textIndent2, textIndent3
    , hanging, eachLine
    , wordSpacing
    , tabSize

    -- Text wrapping, overflow and newlines
    , wordBreak, breakAll, keepAll
    , lineBreak, loose
    , whiteSpace, pre, preWrap, preLine, breakSpaces
    , textOverflow, textOverflow2, ellipsis
    , hyphens, manual
    , hangingPunctuation, hangingPunctuation2, hangingPunctuation3
    , first_, last, forceEnd, allowEnd

    -- Text decoration + transform
    , textDecoration, textDecoration2, textDecoration3
    , textDecorationLine, textDecorationLine2, textDecorationLine3
    , textDecorationStyle
    , wavy, underline, overline, lineThrough
    , textDecorationColor, transparent
    , textDecorationThickness, fromFont
    , textDecorationSkipInk
    , textUnderlinePosition, textUnderlinePosition2
    , textUnderlineOffset
    , textEmphasis, textEmphasis2, textEmphasis3
    , textEmphasisStyle, textEmphasisStyle2
    , textEmphasisColor
    , textEmphasisPosition, textEmphasisPosition2
    , filled, open, dot, doubleCircle, triangle, sesame, over
    , textTransform
    , capitalize, uppercase, lowercase, fullSizeKana

    -- text alignment and justification
    , textAlign, justify 
    , textJustify, interWord, interCharacter
    
    -- script handling
    , direction, ltr, rtl
    , writingMode, verticalLr, verticalRl, horizontalTb
    , unicodeBidi, embed, plaintext, bidiOverride, isolateOverride
    , textOrientation
    , mixed, sideways, sidewaysRight, upright, useGlyphOrientation
    , quotes, quotes2, quotes4

    -- text rendering
    , textRendering
    , geometricPrecision, optimizeLegibility, optimizeSpeed

    -- text selection
    , userSelect

    -- accessibility
    , speak, spellOut
    
    -- list styles
    , ListStyleType, ListStyleTypeSupported
    , listStyle, listStyle2, listStyle3, listStylePosition, inside, outside
    , listStyleType
    , listStyleImage
    , arabicIndic, armenian, bengali, cambodian, cjkDecimal, cjkEarthlyBranch, cjkHeavenlyStem, cjkIdeographic, decimal, decimalLeadingZero, devanagari, disclosureClosed, disclosureOpen, disc, ethiopicNumeric, georgian, gujarati, gurmukhi, hebrew, hiragana, hiraganaIroha, japaneseFormal, japaneseInformal, kannada, katakana, katakanaIroha, khmer, koreanHangulFormal, koreanHanjaFormal, koreanHanjaInformal, lao, lowerAlpha, lowerArmenian, lowerGreek, lowerLatin, lowerRoman, malayalam, monogolian, myanmar, oriya, persian, simpChineseFormal, simpChineseInformal, tamil, telugu, thai, tibetan, tradChineseFormal, tradChineseInformal, upperAlpha, upperArmenian, upperLatin, upperRoman

    -- columns
    , columns, columns2
    , columnWidth
    , columnCount
    , columnFill
    , balance, balanceAll
    , columnSpan
    , columnRule, columnRule2, columnRule3
    , columnRuleWidth
    , columnRuleStyle
    , columnRuleColor
    
    -- tables
    , borderCollapse
    , collapse, separate
    , borderSpacing, borderSpacing2
    , captionSide
    , emptyCells
    , show, hide
    , tableLayout

    -- content fragmentation
    , breakBefore, breakAfter, breakInside
    , avoid, avoidPage, avoidColumn, page
    , pageBreakBefore, pageBreakAfter, pageBreakInside
    , orphans, widows
    , boxDecorationBreak

    -- arranging inline/block stuff
    , float
    , clear
    , verticalAlign
    , textTop, textBottom, middle

    -- replaced elements
    , objectFit
    , scaleDown
    , objectPosition, objectPosition2, objectPosition4

    -- pointer and touch
    , pointerEvents
    , visiblePainted, visibleFill, visibleStroke, painted
    , touchAction
    , panX, panY
    , pinchZoom, manipulation

    -- scrollbar customisation
    , scrollbarColor, scrollbarWidth
    , scrollbarGutter, scrollbarGutter2, stable, bothEdges

    -- scrolling behavior
    , scrollBehavior, smooth
    , overscrollBehavior, overscrollBehavior2
    , overscrollBehaviorX, overscrollBehaviorY
    , overscrollBehaviorBlock, overscrollBehaviorInline

    -- scroll snapping
    , scrollSnapAlign
    , scrollSnapStop
    , scrollSnapType, scrollSnapType2
    , mandatory, proximity
    , scrollMargin, scrollMargin2, scrollMargin3, scrollMargin4
    , scrollMarginTop, scrollMarginLeft, scrollMarginRight, scrollMarginBottom
    , scrollMarginBlock, scrollMarginBlock2, scrollMarginInline, scrollMarginInline2
    , scrollMarginBlockStart, scrollMarginBlockEnd, scrollMarginInlineStart, scrollMarginInlineEnd
    , scrollPadding, scrollPadding2, scrollPadding3, scrollPadding4
    , scrollPaddingTop, scrollPaddingLeft, scrollPaddingRight, scrollPaddingBottom
    , scrollPaddingBlock, scrollPaddingBlock2, scrollPaddingInline, scrollPaddingInline2
    , scrollPaddingBlockStart, scrollPaddingBlockEnd, scrollPaddingInlineStart, scrollPaddingInlineEnd
    
    -- cursors
    , CursorKeyword
    , cursor, cursor2, cursor4
    , pointer, default_, contextMenu, help, progress, wait, cell
    , crosshair, verticalText, alias, copy, move, noDrop
    , notAllowed, allScroll, colResize, rowResize, nResize, eResize, sResize
    , wResize, neResize, nwResize, seResize, swResize, ewResize, nsResize
    , neswResize, nwseResize, zoomIn, zoomOut, grab, grabbing
    , caretColor

    -- gradients
    , linearGradient, linearGradient2
    , stop, stop2, stop3, toBottom, toBottomLeft, toBottomRight, toLeft, toRight, toTop, toTopLeft, toTopRight

    -- shadows
    , BoxShadowConfig
    , boxShadow, boxShadowMany, defaultBoxShadow
    , TextShadowConfig
    , textShadow, textShadowMany, defaultTextShadow
    
    -- transformations and perspective
    , TransformFunction, TransformFunctionSupported
    , transform, transformMany
    , transformOrigin, transformOrigin2, transformOrigin3
    , transformBox, transformStyle
    , flat, preserve3d
    , matrix, matrix3d
    , scale, scale2, scale3, scale_, scale2_, scaleX, scaleY, scaleZ, scale3d
    , rotate, rotate2, rotate4, rotate_, rotateX, rotateY, rotateZ, rotate3d
    , skew, skew2, skewX, skewY
    , translate, translate2, translateX, translateY, translateZ, translate3d
    , perspective, perspectiveOrigin, perspectiveOrigin2
    , perspective_
    , backfaceVisibility
    
    -- animation
    , animationName, animationNameMany
    , animationDuration, animationDurationMany
    , animationTimingFunction, animationTimingFunctionMany
    , animationIterationCount, animationIterationCountMany
    , animationDirection, animationDirectionMany
    , animationPlayState, animationPlayStateMany
    , animationDelay, animationDelayMany
    , animationFillMode, animationFillModeMany
    , EasingFunction, EasingFunctionSupported
    , linear, ease, easeIn, easeOut, easeInOut, cubicBezier, stepStart, stepEnd, steps, steps2, jumpStart, jumpEnd, jumpNone, jumpBoth, infinite, reverse, alternate, alternateReverse, running, paused, forwards, backwards

    -- visual stuff
    , opacity
    , visibility
    , mixBlendMode
    , imageRendering
    , crispEdges, pixelated
    , clipPath, clipPath2

    -- masks
    , maskBorderMode
    , maskBorderRepeat, maskBorderRepeat2
    , maskBorderOutset, maskBorderOutset2, maskBorderOutset3, maskBorderOutset4
    , maskBorderSlice, maskBorderSlice2, maskBorderSlice3, maskBorderSlice4
    , maskBorderWidth, maskBorderWidth2, maskBorderWidth3, maskBorderWidth4
    , maskClip, maskClipMany
    , maskComposite
    , maskMode, maskModeMany
    , maskOrigin, maskOriginMany
    , maskPosition
    , maskRepeat, maskRepeat2
    , maskSize, maskSize2
    , maskType
    , noClip, add, subtract, intersect, exclude, alpha, luminance, matchSource

    -- filters
    , filter, filterMany
    , backdropFilter, backdropFilterMany

    -- drawing
    , paintOrder, paintOrder2, paintOrder3, markers
    
    -- using a printer
    , bleed

    -- SVG attributes that can be used as CSS presentation properties.
    , fill
    , strokeDasharray
    , strokeDashoffset
    , strokeWidth
    , strokeAlign
    , strokeColor
    , strokeImage
    , strokeMiterlimit
    , strokeOpacity
    , strokePosition, strokePosition2, strokePosition4
    , strokeRepeat, strokeRepeat2
    , strokeSize, strokeSize2
    , strokeDashCorner
    , strokeLinecap, butt, square
    , strokeBreak, boundingBox, slice, clone
    , strokeOrigin
    , strokeLinejoin, strokeLinejoin2, crop, arcs, miter, bevel
    , strokeDashJustify, compress, dashes, gaps

    -- Transitions
    , AnimatableSupported
    , Animatable
    , TransitionConfig
    , defaultTransition
    , transition
    , transitionMany
    , transitionProperty
    , transitionDuration
    , transitionDelay
    , transitionTimingFunction
    , transitionBehavior
    , allowDiscrete
    , background_
    , backgroundColor_
    , backgroundPosition_
    , backgroundSize_
    , border_
    , borderBottom_
    , borderBottomColor_
    , borderBottomLeftRadius_
    , borderBottomRightRadius_
    , borderBottomWidth_
    , borderColor_
    , borderLeft_
    , borderLeftColor_
    , borderLeftWidth_
    , borderRadius_
    , borderRight_
    , borderRightColor_
    , borderRightWidth_
    , borderTop_
    , borderTopColor_
    , borderTopLeftRadius_
    , borderTopRightRadius_
    , borderTopWidth_
    , borderWidth_
    , boxShadow_
    , caretColor_
    , clip_
    , clipPath_
    , columnCount_
    , columnGap_
    , columnRule_
    , columnRuleColor_
    , columnRuleWidth_
    , columnWidth_
    , columns_
    , filter_
    , flexBasis_
    , flexGrow_
    , flexShrink_
    , font_
    , fontSize_
    , fontSizeAdjust_
    , fontStretch_
    , fontVariationSettings_
    , fontWeight_
    , gridColumnGap_
    , gridGap_
    , gridRowGap_
    , height_
    , letterSpacing_
    , lineHeight_
    , margin_
    , marginBottom_
    , marginLeft_
    , marginRight_
    , marginTop_
    , mask_
    , maskPosition_
    , maskSize_
    , maxHeight_
    , maxWidth_
    , minHeight_
    , minWidth_
    , objectPosition_
    , offset_
    , offsetAnchor_
    , offsetDistance_
    , offsetPath_
    , offsetRotate_
    , opacity__
    , order_
    , outline_
    , outlineColor_
    , outlineOffset_
    , outlineWidth_
    , padding_
    , paddingBottom_
    , paddingLeft_
    , paddingRight_
    , paddingTop_
    , tabSize_
    , textIndent_
    , textShadow_
    , transform_
    , transformOrigin_
    , verticalAlign_
    , visibility_
    , width_
    , wordSpacing_
    , zIndex_

    -- WebKit stuff that's standardised for legacy support
    , lineClamp
    )

{-| If you need something that `elm-css` does not support right now, the
[`Css.property`](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css#property)
and [`Css.Global.selector`](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css-Global#selector)
functions let you define custom properties and selectors, respectively.


## Reusable Styles

@docs Style, batch


## Custom Properties

@docs property


## `!important`

@docs important


------------------------------------------------------


# Pseudo-Classes

@docs pseudoClass
@docs active, checked, default, defined, disabled, empty, enabled
@docs first, firstChild, firstOfType, focus, fullscreen, hover, inRange
@docs indeterminate, invalid, lastChild, lastOfType, leftHandPage, link, onlyChild
@docs onlyOfType, outOfRange, readOnly, readWrite, required, rightHandPage
@docs root, scope, target, valid, visited

# Pseudo-Classes with arguments

@docs dir, lang, not
@docs nthChild, nthLastChild, nthOfType, nthLastOfType

# Pseudo-Elements

@docs pseudoElement
@docs after, backdrop, before, cue, firstLetter, firstLine
@docs marker, placeholder, selection

# Pseudo-Elements with arguments

@docs slotted


------------------------------------------------------


# Value types

## Numerical units

### Lengths

@docs Length, LengthSupported
@docs zero, px, em, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, q, inch, pt, pc, pct, num, int

### Angles

@docs Angle, AngleSupported, Width, WidthSupported
@docs deg, grad, rad, turn

### Time

@docs Time, TimeSupported, s, ms

### Flex

@docs fr, minmax, fitContentTo

## Names & URLs

@docs customIdent, string, url

## Color

@docs Color, ColorSupported, hex, rgb, rgba, hsl, hsla, currentcolor

## Images & Shapes

@docs Image, ImageSupported
@docs BasicShape, BasicShapeSupported

@docs insetRect, insetRect2, insetRect3, insetRect4
@docs insetRound, insetRound2, insetRound3, insetRound4
@docs circle, circleAt, circleAt2
@docs ellipse, ellipseAt, ellipseAt2
@docs closestSide, farthestSide, polygon, path


## Blend Modes

@docs BlendMode, BlendModeSupported
@docs multiply, screen, overlay, darken, lighten, colorDodge, colorBurn, hardLight, softLight, difference, exclusion, hue, saturation, color_, luminosity

## Filter Functions

@docs FilterFunction, FilterFunctionSupported
@docs blur, brightness, contrast, dropShadow, grayscale, hueRotate, invert, opacity_, saturate, sepia

## Lines
@docs LineStyle, LineStyleSupported
@docs LineWidth, LineWidthSupported

## Calc

@docs calc, CalcOperation, minus, plus, times, dividedBy


------------------------------------------------------


# Shared/Grouped keyword values

Many different kinds of CSS properties use the same keyword values,
so they're put in this place for easier understanding.

Some of these keywords are used only in one property but they fit
into a group of functionality (like Logical Values), so they're also grouped here.


## General Values

All CSS properties can have the values `unset`, `initial`, `inherit` and `revert`.

@docs BaseValue
@docs unset, initial, inherit, revert


## Very common keywords

@docs auto, none


## (usually) Absolute positional values

@docs left_, right_, top_, bottom_


## (usually) Logical Values

Logical values are those that set properties by their relation to the user's reading direction.

Sometimes these keywords mean other things too.

@docs block, inline, start, end, blockStart, blockEnd, inlineStart, inlineEnd


## Content sizing values

@docs minContent, maxContent, fitContent


## Axis values

@docs x, y, z


## Alignment values

@docs stretch, center


## Geometry box values

@docs marginBox, borderBox, paddingBox, contentBox, fillBox, strokeBox, viewBox


## Typographic values

@docs baseline, sub, super, ruby, fullWidth, under, circle_


## Visibility

@docs hidden, visible


## Thickness

@docs thin, thick


## Miscellaneous shared

@docs normal, strict, all_, both, always, scroll, column
@docs content, fill_, stroke, text, style
@docs clip, cover, contain_
@docs repeat, noRepeat, repeatX, repeatY, space, round_
@docs isolate, matchParent, nowrap


------------------------------------------------------


# All

@docs all


------------------------------------------------------


# Display

@docs display, display2, displayListItem2, displayListItem3
@docs flex_, flow, flowRoot, grid_, contents, listItem
@docs inlineBlock, inlineFlex, inlineTable, inlineGrid
@docs rubyBase, rubyBaseContainer, rubyText, rubyTextContainer
@docs runIn, table
@docs tableCaption, tableCell, tableColumn, tableColumnGroup, tableFooterGroup, tableHeaderGroup, tableRow, tableRowGroup


------------------------------------------------------


# Position

@docs position
@docs absolute, fixed, relative, static, sticky


------------------------------------------------------


# Stacking contexts & box-sizing

@docs zIndex, isolation, boxSizing


------------------------------------------------------


# Contain

@docs contain, contain2, contain3, contain4
@docs size, inlineSize_, layout, paint
@docs containIntrinsicSize, containIntrinsicSize2, containIntrinsicSize4
@docs containIntrinsicWidth, containIntrinsicWidth2, containIntrinsicHeight, containIntrinsicHeight2
@docs containIntrinsicInlineSize, containIntrinsicInlineSize2, containIntrinsicBlockSize, containIntrinsicBlockSize2


------------------------------------------------------


# Sizing

@docs width, minWidth, maxWidth, height, minHeight, maxHeight
@docs blockSize, minBlockSize, maxBlockSize
@docs inlineSize, minInlineSize, maxInlineSize


------------------------------------------------------


# Inset

@docs inset, inset2, inset3, inset4

## Absolute insets

@docs top, right, bottom, left

## Logical insets

@docs insetBlock, insetBlock2, insetInline, insetInline2
@docs insetBlockStart, insetBlockEnd, insetInlineStart, insetInlineEnd


------------------------------------------------------


# Margin

@docs margin, margin2, margin3, margin4

## Absolute margin edges

@docs marginTop, marginRight, marginBottom, marginLeft

## Logical margin edges

@docs marginBlock, marginBlock2, marginBlockStart, marginBlockEnd
@docs marginInline, marginInline2, marginInlineStart, marginInlineEnd


------------------------------------------------------


# Padding

@docs padding, padding2, padding3, padding4

## Absolute padding edges

@docs paddingTop, paddingRight, paddingBottom, paddingLeft

## Logical padding edges

@docs paddingBlock, paddingBlock2, paddingBlockStart, paddingBlockEnd
@docs paddingInline, paddingInline2, paddingInlineStart, paddingInlineEnd


------------------------------------------------------


# Borders

@docs border, border2, border3

## Absolute border edges

@docs borderTop, borderTop2, borderTop3
@docs borderRight, borderRight2, borderRight3
@docs borderBottom, borderBottom2, borderBottom3
@docs borderLeft, borderLeft2, borderLeft3

## Logical border edges

@docs borderBlock, borderBlock2, borderBlock3
@docs borderBlockStart, borderBlockStart2, borderBlockStart3
@docs borderBlockEnd, borderBlockEnd2, borderBlockEnd3
@docs borderInline, borderInline2, borderInline3
@docs borderInlineStart, borderInlineStart2, borderInlineStart3
@docs borderInlineEnd, borderInlineEnd2, borderInlineEnd3

## Border width

@docs borderWidth, borderWidth2, borderWidth3, borderWidth4
@docs borderTopWidth, borderRightWidth, borderBottomWidth, borderLeftWidth
@docs borderBlockWidth, borderBlockStartWidth, borderBlockEndWidth
@docs borderInlineWidth, borderInlineStartWidth, borderInlineEndWidth

## Border style

@docs borderStyle, borderStyle2, borderStyle3, borderStyle4
@docs borderTopStyle, borderRightStyle, borderBottomStyle, borderLeftStyle
@docs borderBlockStyle, borderBlockStartStyle, borderBlockEndStyle
@docs borderInlineStyle, borderInlineStartStyle, borderInlineEndStyle
@docs dotted, dashed, solid, double, groove, ridge, inset_, outset

## Border color

@docs borderColor, borderColor2, borderColor3, borderColor4
@docs borderTopColor, borderRightColor, borderBottomColor, borderLeftColor
@docs borderBlockColor, borderBlockStartColor, borderBlockEndColor
@docs borderInlineColor, borderInlineStartColor, borderInlineEndColor

## Border radius

@docs borderRadius, borderRadius2, borderRadius3, borderRadius4
@docs borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2
@docs borderBottomRightRadius, borderBottomRightRadius2, borderBottomLeftRadius, borderBottomLeftRadius2
@docs borderStartStartRadius, borderStartStartRadius2, borderStartEndRadius, borderStartEndRadius2
@docs borderEndStartRadius, borderEndStartRadius2, borderEndEndRadius, borderEndEndRadius2

## Border image

@docs borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4
@docs borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4


------------------------------------------------------


# Outlines

@docs outline, outline3, outlineWidth, outlineColor
@docs invert_, outlineStyle, outlineOffset


------------------------------------------------------


# Overflow and resizing

@docs overflow, overflow2
@docs overflowX, overflowY, overflowBlock, overflowInline
@docs overflowWrap, overflowAnchor
@docs breakWord, anywhere
@docs resize, horizontal, vertical


------------------------------------------------------


# Flex

The CSS Flexible Box Layout Module.
See this [complete guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/).

## Basics

@docs flex, flex2, flex3
@docs flexBasis
@docs flexGrow
@docs flexShrink

## Layout dynamics

@docs flexDirection
@docs flexWrap
@docs flexFlow, flexFlow2

## Alignment

Other values you can use for flex item alignment:

  - [`left_`](#left_)
  - [`right_`](#right_)
  - [`top_`](#top_)
  - [`bottom_`](#bottom_)
  - [`start`](#start)
  - [`end`](#end)
  - [`center`](#center)
  - [`stretch`](#stretch)
  - [`baseline`](#baseline)

@docs alignContent, alignContent2
@docs alignItems, alignItems2
@docs alignSelf, alignSelf2

## Justify

@docs justifyContent, justifyContent2
@docs justifyItems, justifyItems2
@docs justifySelf, justifySelf2

## Place

@docs placeContent, placeContent2
@docs placeItems, placeItems2
@docs placeSelf, placeSelf2

## Order

@docs order

## Flex value keywords

@docs row, rowReverse, columnReverse
@docs flexStart, flexEnd, selfStart, selfEnd
@docs spaceBetween, spaceAround, spaceEvenly
@docs firstBaseline, lastBaseline
@docs safe, unsafe
@docs legacy, legacyLeft, legacyRight, legacyCenter
@docs wrap, wrapReverse, breakSpaces


------------------------------------------------------


# Grid

## Types
@docs FixedSizeSupported
@docs TrackBreadthSupported
@docs TrackSizeSupported, TrackSize
    
## Grid auto
@docs gridAutoRows, gridAutoRowsMany
@docs gridAutoColumns, gridAutoColumnsMany
@docs gridAutoFlow, gridAutoFlow2

## Grid areas
@docs GridLine, gridLineIdent, gridLineSpanNum, gridLineSpanIdent
@docs gridArea, gridArea2, gridArea3, gridArea4
@docs gridRow, gridRow2
@docs gridRowStart, gridRowEnd
@docs gridColumn, gridColumn2
@docs gridColumnStart, gridColumnEnd

## Grid templates
@docs gridTemplate
@docs gridTemplateAreas, gridTemplateAreasCells
@docs gridTemplateRows
@docs gridTemplateColumns
@docs templateRowsColumns, templateAreasRowsColumns
@docs templateAreaRow, templateColumns
@docs trackList, autoTrackList
@docs fixedRepeat, autoRepeat
@docs autoFill, autoFit, lineNames
@docs dense


------------------------------------------------------


# Gap

@docs gap, gap2, rowGap, columnGap


------------------------------------------------------


# Background

@docs backgroundColor
@docs backgroundAttachment, backgroundAttachmentMany
@docs local
@docs backgroundBlendMode, backgroundBlendModeMany
@docs backgroundClip, backgroundClipMany
@docs backgroundOrigin, backgroundOriginMany
@docs backgroundImage, backgroundImageMany
@docs backgroundPosition, backgroundPosition2, backgroundPosition3, backgroundPosition4
@docs backgroundRepeat, backgroundRepeat2
@docs backgroundSize, backgroundSize2


------------------------------------------------------


# Basic typographic options

## Sizing

@docs fontSize
@docs xxSmall, xSmall, small, medium, large, xLarge, xxLarge, xxxLarge, smaller, larger
@docs fontSizeAdjust

## @font-face

@docs fontDisplay, fallback, swap, optional

## Font family

@docs fontFamily, fontFamilyMany
@docs serif, sansSerif, monospace, cursive, fantasy
@docs systemUi, uiSerif, uiSansSerif, uiMonospace, uiRounded
@docs math, fangsong


## Font color, style, weight & stretch

@docs color
@docs fontStyle, italic, oblique
@docs fontWeight, bold, lighter, bolder
@docs fontStretch, ultraCondensed, extraCondensed, condensed, semiCondensed, semiExpanded, expanded, extraExpanded, ultraExpanded
    
## Missing typeface synthesis

@docs fontSynthesis, fontSynthesis2, fontSynthesis3
@docs weight

## Variable fonts (not to be confused with font variants)

@docs fontVariationSettings, fontVariationSettingsMany


------------------------------------------------------


# Typographic features

## OpenType typographic features

@docs fontFeatureSettings, fontFeatureSettingsMany
@docs featureTag, featureTag2

## Font Variants

@docs AllFontVariantsSupported, AllFontVariants
@docs fontVariant, fontVariant2

### Alternative capitals

@docs FontVariantCapsSupported
@docs fontVariantCaps
@docs smallCaps, allSmallCaps, petiteCaps, allPetiteCaps, unicase, titlingCaps

### East Asian glyph variants

@docs FontVariantEastAsianSupported, FontVariantEastAsian
@docs fontVariantEastAsian, fontVariantEastAsian2, fontVariantEastAsian3
@docs jis78, jis83, jis90, jis04, simplified, traditional, proportionalWidth

### Ligatures & contextual forms

@docs FontVariantLigaturesSupported
@docs fontVariantLigatures
@docs commonLigatures, noCommonLigatures, discretionaryLigatures, noDiscretionaryLigatures, historicalLigatures, noHistoricalLigatures, contextual, noContextual
    
### Numerical variants

@docs FontVariantNumericSupported, FontVariantNumeric
@docs fontVariantNumeric, fontVariantNumeric4
@docs ordinal, slashedZero, liningNums, oldstyleNums, proportionalNums, tabularNums, diagonalFractions, stackedFractions
    
### Emoji variants

@docs FontVariantEmojiSupported
@docs fontVariantEmoji, emoji, unicode

### Superscript & subscript

@docs FontVariantPositionSupported
@docs fontVariantPosition

## Other typographic properties

### Kerning

@docs fontKerning

### Language override

@docs fontLanguageOverride

### Optical sizing

@docs fontOpticalSizing

------------------------------------------------------


# Typographic metrics

@docs lineHeight
@docs letterSpacing
@docs textIndent, textIndent2, textIndent3
@docs hanging, eachLine
@docs wordSpacing
@docs tabSize


------------------------------------------------------


# Text wrapping, overflow and newlines

@docs wordBreak, breakAll, keepAll
@docs lineBreak, loose
@docs whiteSpace, pre, preWrap, preLine
@docs textOverflow, textOverflow2, ellipsis
@docs hyphens, manual
@docs hangingPunctuation, hangingPunctuation2, hangingPunctuation3
@docs first_, last, forceEnd, allowEnd


------------------------------------------------------


# Text decoration and transform

@docs textDecoration, textDecoration2, textDecoration3
@docs textDecorationLine, textDecorationLine2, textDecorationLine3
@docs textDecorationStyle
@docs wavy, underline, overline, lineThrough
@docs textDecorationColor, transparent
@docs textDecorationThickness, fromFont
@docs textDecorationSkipInk
@docs textUnderlinePosition, textUnderlinePosition2
@docs textUnderlineOffset
@docs textEmphasis, textEmphasis2, textEmphasis3
@docs textEmphasisStyle, textEmphasisStyle2
@docs textEmphasisColor
@docs textEmphasisPosition, textEmphasisPosition2
@docs filled, open, dot, doubleCircle, triangle, sesame, over
@docs textTransform
@docs capitalize, uppercase, lowercase, fullSizeKana


------------------------------------------------------


# Text alignment and justification

@docs textAlign, justify
@docs textJustify, interWord, interCharacter


------------------------------------------------------


# Script handling

@docs direction, ltr, rtl
@docs writingMode, verticalLr, verticalRl, horizontalTb
@docs unicodeBidi, embed, plaintext, bidiOverride, isolateOverride
@docs textOrientation
@docs mixed, sideways, sidewaysRight, upright, useGlyphOrientation
@docs quotes, quotes2, quotes4


------------------------------------------------------


# Text rendering

@docs textRendering
@docs geometricPrecision, optimizeLegibility, optimizeSpeed


------------------------------------------------------


# Text selection

@docs userSelect


------------------------------------------------------


# Accessibility

@docs speak, spellOut


------------------------------------------------------


# List styles

@docs ListStyleType, ListStyleTypeSupported
@docs listStyle, listStyle2, listStyle3, listStylePosition, inside, outside
@docs listStyleType
@docs listStyleImage
@docs arabicIndic, armenian, bengali, cambodian, cjkDecimal, cjkEarthlyBranch, cjkHeavenlyStem, cjkIdeographic, decimal, decimalLeadingZero, devanagari, disclosureClosed, disclosureOpen, disc, ethiopicNumeric, georgian, gujarati, gurmukhi, hebrew, hiragana, hiraganaIroha, japaneseFormal, japaneseInformal, kannada, katakana, katakanaIroha, khmer, koreanHangulFormal, koreanHanjaFormal, koreanHanjaInformal, lao, lowerAlpha, lowerArmenian, lowerGreek, lowerLatin, lowerRoman, malayalam, monogolian, myanmar, oriya, persian, simpChineseFormal, simpChineseInformal, tamil, telugu, thai, tibetan, tradChineseFormal, tradChineseInformal, upperAlpha, upperArmenian, upperLatin, upperRoman


------------------------------------------------------


# Columns

@docs columns, columns2
@docs columnWidth
@docs columnCount
@docs columnFill
@docs balance, balanceAll
@docs columnSpan
@docs columnRule, columnRule2, columnRule3
@docs columnRuleWidth
@docs columnRuleStyle
@docs columnRuleColor


------------------------------------------------------


# Tables

@docs borderCollapse
@docs collapse, separate
@docs borderSpacing, borderSpacing2
@docs captionSide
@docs emptyCells
@docs show, hide
@docs tableLayout


------------------------------------------------------


# Content fragmentation

@docs breakBefore, breakAfter, breakInside
@docs avoid, avoidPage, avoidColumn, page
@docs pageBreakBefore, pageBreakAfter, pageBreakInside
@docs orphans, widows
@docs boxDecorationBreak


------------------------------------------------------


# Arranging inline/block stuff

@docs float
@docs clear
@docs verticalAlign
@docs textTop, textBottom, middle


------------------------------------------------------


# Replaced elements

@docs objectFit
@docs scaleDown
@docs objectPosition, objectPosition2, objectPosition4


------------------------------------------------------


# Pointer and touch

## Pointer events

@docs pointerEvents
@docs visiblePainted, visibleFill, visibleStroke, painted

## Touch action

@docs touchAction
@docs panX, panY
@docs pinchZoom, manipulation


------------------------------------------------------


# Scrollbar customisation

@docs scrollbarColor, scrollbarWidth
@docs scrollbarGutter, scrollbarGutter2, stable, bothEdges


------------------------------------------------------


# Scrolling behavior

@docs scrollBehavior, smooth
@docs overscrollBehavior, overscrollBehavior2
@docs overscrollBehaviorX, overscrollBehaviorY
@docs overscrollBehaviorBlock, overscrollBehaviorInline


------------------------------------------------------


# Scroll snapping

@docs scrollSnapType, scrollSnapType2
@docs scrollSnapAlign
@docs scrollSnapStop
@docs mandatory, proximity

### Margin

@docs scrollMargin, scrollMargin2, scrollMargin3, scrollMargin4
@docs scrollMarginTop, scrollMarginLeft, scrollMarginRight, scrollMarginBottom
@docs scrollMarginBlock, scrollMarginBlock2, scrollMarginInline, scrollMarginInline2
@docs scrollMarginBlockStart, scrollMarginBlockEnd, scrollMarginInlineStart, scrollMarginInlineEnd

### Padding

@docs scrollPadding, scrollPadding2, scrollPadding3, scrollPadding4
@docs scrollPaddingTop, scrollPaddingLeft, scrollPaddingRight, scrollPaddingBottom
@docs scrollPaddingBlock, scrollPaddingBlock2, scrollPaddingInline, scrollPaddingInline2
@docs scrollPaddingBlockStart, scrollPaddingBlockEnd, scrollPaddingInlineStart, scrollPaddingInlineEnd


------------------------------------------------------


# Cursors

@docs CursorKeyword
@docs cursor, cursor2, cursor4

## Cursor values

[`text`](#text) is also a supported value for `cursor`.

@docs pointer, default_, contextMenu, help, progress, wait, cell
@docs crosshair, verticalText, alias, copy, move, noDrop
@docs notAllowed, allScroll, colResize, rowResize, nResize, eResize, sResize
@docs wResize, neResize, nwResize, seResize, swResize, ewResize, nsResize
@docs neswResize, nwseResize, zoomIn, zoomOut, grab, grabbing

## Caret color

@docs caretColor


------------------------------------------------------


# Gradients

@docs linearGradient, linearGradient2
@docs stop, stop2, stop3, toBottom, toBottomLeft, toBottomRight, toLeft, toRight, toTop, toTopLeft, toTopRight


------------------------------------------------------


# Shadows

@docs BoxShadowConfig
@docs boxShadow, boxShadowMany, defaultBoxShadow
@docs TextShadowConfig
@docs textShadow, textShadowMany, defaultTextShadow


------------------------------------------------------


# Transformation

@docs TransformFunction, TransformFunctionSupported
@docs transform, transformMany
@docs transformOrigin, transformOrigin2, transformOrigin3
@docs transformBox, transformStyle
@docs flat, preserve3d

## Matrix transformation

@docs matrix, matrix3d

## Scaling (resizing)

@docs scale, scale2, scale3, scale_, scale2_, scaleX, scaleY, scaleZ, scale3d

## Rotation

@docs rotate, rotate2, rotate4, rotate_, rotateX, rotateY, rotateZ, rotate3d

## Skewing (distortion)

@docs skew, skew2, skewX, skewY

## Translation (moving)

@docs translate, translate2, translateX, translateY, translateZ, translate3d

## Perspective

@docs perspective, perspectiveOrigin, perspectiveOrigin2
@docs perspective_

## 3D Rendering options

@docs backfaceVisibility


------------------------------------------------------


# Animation

@docs animationName, animationNameMany
@docs animationDuration, animationDurationMany
@docs animationTimingFunction, animationTimingFunctionMany
@docs animationIterationCount, animationIterationCountMany
@docs animationDirection, animationDirectionMany
@docs animationPlayState, animationPlayStateMany
@docs animationDelay, animationDelayMany
@docs animationFillMode, animationFillModeMany
@docs EasingFunction, EasingFunctionSupported
@docs linear, ease, easeIn, easeOut, easeInOut, cubicBezier, stepStart, stepEnd, steps, steps2, jumpStart, jumpEnd, jumpNone, jumpBoth, infinite, reverse, alternate, alternateReverse, running, paused, forwards, backwards


------------------------------------------------------


# Visual stuff

@docs opacity
@docs visibility
@docs mixBlendMode
@docs imageRendering
@docs crispEdges, pixelated
@docs clipPath, clipPath2


------------------------------------------------------


## Masks

@docs maskBorderMode
@docs maskBorderRepeat, maskBorderRepeat2
@docs maskBorderOutset, maskBorderOutset2, maskBorderOutset3, maskBorderOutset4
@docs maskBorderSlice, maskBorderSlice2, maskBorderSlice3, maskBorderSlice4
@docs maskBorderWidth, maskBorderWidth2, maskBorderWidth3, maskBorderWidth4
@docs maskClip, maskClipMany
@docs maskComposite
@docs maskMode, maskModeMany
@docs maskOrigin, maskOriginMany
@docs maskPosition
@docs maskRepeat, maskRepeat2
@docs maskSize, maskSize2
@docs maskType
@docs noClip, add, subtract, intersect, exclude, alpha, luminance, matchSource


------------------------------------------------------


## Filters
@docs filter, filterMany
@docs backdropFilter, backdropFilterMany


------------------------------------------------------


## Rendering

@docs paintOrder, paintOrder2, paintOrder3, markers


------------------------------------------------------


# Using a printer

@docs bleed


------------------------------------------------------


# SVG attributes that can be used as CSS presentation properties.

@docs fill
@docs strokeDasharray
@docs strokeDashoffset
@docs strokeWidth
@docs strokeAlign
@docs strokeColor
@docs strokeImage
@docs strokeMiterlimit
@docs strokeOpacity
@docs strokePosition, strokePosition2, strokePosition4
@docs strokeRepeat, strokeRepeat2
@docs strokeSize, strokeSize2
@docs strokeDashCorner
@docs strokeLinecap, butt, square
@docs strokeBreak, boundingBox, slice, clone
@docs strokeOrigin
@docs strokeLinejoin, strokeLinejoin2, crop, arcs, miter, bevel
@docs strokeDashJustify, compress, dashes, gaps


------------------------------------------------------


# Transition

@docs Animatable, AnimatableSupported
@docs TransitionConfig
@docs defaultTransition
@docs transition, transitionMany
@docs transitionProperty
@docs transitionDuration
@docs transitionDelay
@docs transitionTimingFunction
@docs transitionBehavior
@docs allowDiscrete
@docs background_
@docs backgroundColor_
@docs backgroundPosition_
@docs backgroundSize_
@docs border_
@docs borderBottom_
@docs borderBottomColor_
@docs borderBottomLeftRadius_
@docs borderBottomRightRadius_
@docs borderBottomWidth_
@docs borderColor_
@docs borderLeft_
@docs borderLeftColor_
@docs borderLeftWidth_
@docs borderRadius_
@docs borderRight_
@docs borderRightColor_
@docs borderRightWidth_
@docs borderTop_
@docs borderTopColor_
@docs borderTopLeftRadius_
@docs borderTopRightRadius_
@docs borderTopWidth_
@docs borderWidth_
@docs boxShadow_
@docs caretColor_
@docs clip_
@docs clipPath_
@docs columnCount_
@docs columnGap_
@docs columnRule_
@docs columnRuleColor_
@docs columnRuleWidth_
@docs columnWidth_
@docs columns_
@docs filter_
@docs flexBasis_
@docs flexGrow_
@docs flexShrink_
@docs font_
@docs fontSize_
@docs fontSizeAdjust_
@docs fontStretch_
@docs fontVariationSettings_
@docs fontWeight_
@docs gridColumnGap_
@docs gridGap_
@docs gridRowGap_
@docs height_
@docs letterSpacing_
@docs lineHeight_
@docs margin_
@docs marginBottom_
@docs marginLeft_
@docs marginRight_
@docs marginTop_
@docs mask_
@docs maskPosition_
@docs maskSize_
@docs maxHeight_
@docs maxWidth_
@docs minHeight_
@docs minWidth_
@docs objectPosition_
@docs offset_
@docs offsetAnchor_
@docs offsetDistance_
@docs offsetPath_
@docs offsetRotate_
@docs opacity__
@docs order_
@docs outline_
@docs outlineColor_
@docs outlineOffset_
@docs outlineWidth_
@docs padding_
@docs paddingBottom_
@docs paddingLeft_
@docs paddingRight_
@docs paddingTop_
@docs tabSize_
@docs textIndent_
@docs textShadow_
@docs transform_
@docs transformOrigin_
@docs verticalAlign_
@docs visibility_
@docs width_
@docs wordSpacing_
@docs zIndex_


------------------------------------------------------


# WebKit stuff that's standardised for legacy support

@docs lineClamp



-}

import Css.Preprocess as Preprocess exposing (Style(..))
import Css.Structure as Structure
import Css.Value as Value exposing (Value(..), Supported)

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------------- BASIC STUFF ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A CSS property (such as `color`), or multiple properties grouped into one.

    invisible : Style
    invisible =
        display none

This corresponds to the CSS `display: none`.

    boldAndUnderlineOnHover : Style
    boldAndUnderlineOnHover =
        hover [ textDecoration underline, fontWeight bold ]

This (roughly) corresponds to the CSS `:hover { text-decoration: underline; font-weight: bold; }`.

You can use `Style` values to reuse styles (like [mixins](http://sass-lang.com/guide#topic-6)
in other CSS systems). [`batch`](#batch) comes in handy for this!

-}
type alias Style =
    Preprocess.Style




-- CUSTOM PROPERTIES --


{-| Define a custom property.

    css [ property "-webkit-font-smoothing" "none" ]

...outputs

    -webkit-font-smoothing: none;

-}
property : String -> String -> Style
property key value =
    appendProperty (key ++ ":" ++ value)



-- STYLES --


{-| Create a style from multiple other styles.

    underlineOnHover =
        batch
            [ textDecoration none

            , hover
                [ textDecoration underline ]
            ]

    css
        [ color (rgb 128 64 32)
        , underlineOnHover
        ]

...has the same result as:

    css
        [ color (rgb 128 64 32)
        , textDecoration none
        , hover
            [ textDecoration underline ]
        ]

-}
batch : List Style -> Style
batch =
    Preprocess.ApplyStyles


{-| Transforms the given property by adding !important to the end of its
declaration.
-}
important : Style -> Style
important =
    Preprocess.mapProperties makeImportant


makeImportant : Structure.Property -> Structure.Property
makeImportant (Structure.Property str) =
    if String.endsWith " !important" (String.toLower str) then
        Structure.Property <| str

    else
        Structure.Property <| str ++ " !important"




appendProperty : String -> Style
appendProperty str =
    Preprocess.AppendProperty <| Structure.Property <| str


{-| Helper function to concatenate a list of values together
with a single separator.

If the list is empty, it will return `unset`. This to ensure
that no output features an empty property.
-}
valueListToString : String -> List (Value a) -> String
valueListToString separator list =
    if List.length list >= 1 then
        list
        |> List.map Value.unpack
        |> String.join separator
    else
        Value.unpack unset


{-| Helper function that acts like [`valueListToString`](#valueListToString)
but with the important distinction of not having an `unset` fallback.

This is for value lists for which returning `unset` would be unacceptable.
-}
valueListToStringNoFallback : String -> Value a -> List (Value a) -> String
valueListToStringNoFallback separator head rest =
    ( head :: rest )
    |> List.map Value.unpack
    |> String.join separator


{-| Helper function to concatenate a list of values together
with a single separator.

It will not return anything if the list is empty. Only use this if you're
sure it won't mess up the CSS output.
-}
valueListToStringUnsafe : String -> List (Value a) -> String
valueListToStringUnsafe separator list =
    if List.length list >= 1 then
        list
        |> List.map Value.unpack
        |> String.join separator
    else
        ""


stringListToStringEnquoted : String -> List String -> String
stringListToStringEnquoted separator list =
    if List.length list >= 1 then
        list
        |> List.map enquoteString
        |> String.join separator
    else
        Value.unpack unset


enquoteString : String -> String
enquoteString str =
    let
        escapeChars char rest =
            rest ++ escapeChar char

        escapeChar char =
            case char of
                '\n' ->
                    "\\A "

                '"' ->
                    "\\\""

                '\\' ->
                    "\\\\"

                _ ->
                    String.fromChar char
    in
    "\"" ++ String.foldl escapeChars "" str ++ "\""

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
---------------------------- PSEUDO-CLASSES ----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Define a custom pseudo-class.

This can be useful for deprecated [pseudo-classes](https://css-tricks.com/pseudo-class-selectors/) such as `-moz-any-link`, which
[has been deprecated and removed](https://www.fxsitecompat.com/en-CA/docs/2016/any-link-css-pseudo-class-has-been-unprefixed/)
in modern browsers.

    button
        [ css [ pseudoClass "-moz-any-link" [ color (hex "f00") ] ] ]
        [ text "Whee!" ]

...outputs

    <button class="f9fcb2">Whee!</button>

    <style>
        .f9fcb2:-moz-any-link {
            color: #f00;
        }
    </style>

-}
pseudoClass : String -> List Style -> Style
pseudoClass pseudoClassName =
    Preprocess.ExtendSelector (Structure.PseudoClassSelector pseudoClassName)


{-| An [`:active`](https://css-tricks.com/almanac/selectors/a/active/)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    button [ active [ color (rgb 12 160 190) ] ]

-}
active : List Style -> Style
active =
    pseudoClass "active"


{-| A [`:checked`](https://developer.mozilla.org/en-US/docs/Web/CSS/:checked)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

This pseudo-class is for any checkbox, option or radio input that is checked or toggled on.

    checked
        [ backgroundColor (rgb 0 0 255)
        ]

-}
checked : List Style -> Style
checked =
    pseudoClass "checked"


{-| A [`:default`](https://developer.mozilla.org/en-US/docs/Web/CSS/:default)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    default [ color (hex "#ff0000") ]

-}
default : List Style -> Style
default =
    pseudoClass "default"


{-| A [`:defined`](https://developer.mozilla.org/en-US/docs/Web/CSS/:defined)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    defined [ fontStyle italic ]

-}
defined : List Style -> Style
defined =
    pseudoClass "defined"


{-| A [`:disabled`](https://developer.mozilla.org/en-US/docs/Web/CSS/:disabled)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    button [ disabled [ color (rgb 194 194 194) ] ]

-}
disabled : List Style -> Style
disabled =
    pseudoClass "disabled"


{-| An [`:empty`](https://developer.mozilla.org/en-US/docs/Web/CSS/:empty)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    empty
        [ backgroundColor (rgb 20 20 20)
        ]

-}
empty : List Style -> Style
empty =
    pseudoClass "empty"


{-| An [`:enabled`](https://developer.mozilla.org/en-US/docs/Web/CSS/:enabled)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    enabled
        [ borderColor (rgba 150 150 0 0.5)
        ]

-}
enabled : List Style -> Style
enabled =
    pseudoClass "enabled"


{-| A [`:first`](https://developer.mozilla.org/en-US/docs/Web/CSS/:first)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    first
        [ marginTop (pct 30)
        ]

-}
first : List Style -> Style
first =
    pseudoClass "first"


{-| A [`:first-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/:first-child)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    firstChild
        [ fontWeight bold
        ]

-}
firstChild : List Style -> Style
firstChild =
    pseudoClass "first-child"


{-| A [`:first-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/:first-of-type)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    firstOfType
        [ color (rgb 255 0 0)
        ]

-}
firstOfType : List Style -> Style
firstOfType =
    pseudoClass "first-of-type"


{-| A [`:focus`](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    focus
        [ border3 (px 2) solid (rgb 0 0 0)
        ]

-}
focus : List Style -> Style
focus =
    pseudoClass "focus"


{-| A [`:fullscreen`](https://developer.mozilla.org/en-US/docs/Web/CSS/:fullscreen)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    fullscreen
        [ backgroundColor (rgb 0 0 0)
        ]

-}
fullscreen : List Style -> Style
fullscreen =
    pseudoClass "fullscreen"


{-| A [`:hover`](https://developer.mozilla.org/en-US/docs/Web/CSS/:hover)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    hover
        [ fontWeight bold
        , color (rgb 255 50 0)
        ]

-}
hover : List Style -> Style
hover =
    pseudoClass "hover"


{-| An [`:in-range`](https://developer.mozilla.org/en-US/docs/Web/CSS/:in-range)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    inRange
        [ backgroundColor (rgb 0 255 0)
        ]

-}
inRange : List Style -> Style
inRange =
    pseudoClass "in-range"


{-| An [`:indeterminate`](https://developer.mozilla.org/en-US/docs/Web/CSS/:indeterminate)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    indeterminate
        [ backgroundColor (rgb 100 100 100)
        ]

-}
indeterminate : List Style -> Style
indeterminate =
    pseudoClass "indeterminate"


{-| An [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    invalid
        [ color (rgb 255 0 0)
        , fontWeight bold
        ]

-}
invalid : List Style -> Style
invalid =
    pseudoClass "invalid"


{-| A [`:last-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-child)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    lastChild
        [ backgroundColor (rgb 0 0 255)
        ]

-}
lastChild : List Style -> Style
lastChild =
    pseudoClass "last-child"


{-| A [`:last-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-of-type)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    lastOfType
        [ color (rgb 100 100 100)
        ]

-}
lastOfType : List Style -> Style
lastOfType =
    pseudoClass "last-of-type"


{-| A [`:left`](https://developer.mozilla.org/en-US/docs/Web/CSS/:left)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    leftHandPage
        [ color (rgb 100 100 100)
        ]

Note: This is called `leftHandPage` instead of `left` or `left_` is
because both of those are taken by property and value keyword functions.
-}
leftHandPage : List Style -> Style
leftHandPage =
    pseudoClass "left"


{-| A [`:link`](https://developer.mozilla.org/en-US/docs/Web/CSS/:link)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    link
        [ color (rgb 0 0 255)
        ]

-}
link : List Style -> Style
link =
    pseudoClass "link"


{-| An [`:only-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/:only-child)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    onlyChild
        [ backgroundColor (rgb 255 255 255)
        ]

-}
onlyChild : List Style -> Style
onlyChild =
    pseudoClass "only-child"


{-| An [`:only-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/:only-of-type)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    onlyOfType
        [ color (rgb 255 0 0)
        , fontStyle italic
        ]

-}
onlyOfType : List Style -> Style
onlyOfType =
    pseudoClass "only-of-type"


{-| An [`:out-of-range`](https://developer.mozilla.org/en-US/docs/Web/CSS/:out-of-range)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    outOfRange
        [ color (rgb 255 0 0)
        ]

-}
outOfRange : List Style -> Style
outOfRange =
    pseudoClass "out-of-range"


{-| A [`:read-only`](https://developer.mozilla.org/en-US/docs/Web/CSS/:read-only)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    readOnly
        [ color (rgb 50 50 50)
        ]

-}
readOnly : List Style -> Style
readOnly =
    pseudoClass "read-only"


{-| A [`:read-write`](https://developer.mozilla.org/en-US/docs/Web/CSS/:read-write)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    readWrite
        [ backgroundColor (rgb 0 50 150)
        ]

-}
readWrite : List Style -> Style
readWrite =
    pseudoClass "read-write"


{-| A [`:required`](https://developer.mozilla.org/en-US/docs/Web/CSS/:required)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    required
        [ border (px 2) solid (rgb 100 100 100)
        ]

-}
required : List Style -> Style
required =
    pseudoClass "required"


{-| A [`:right`](https://developer.mozilla.org/en-US/docs/Web/CSS/:right)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    rightHandPage
        [ color (rgb 100 100 100)
        ]

Note: This is called `rightHandPage` instead of `right` or `right_` is
because both of those are taken by property and value keyword functions.
-}
rightHandPage : List Style -> Style
rightHandPage =
    pseudoClass "right"


{-| A [`:root`](https://developer.mozilla.org/en-US/docs/Web/CSS/:root)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    root
        [ backgroundColor (rgb 0 200 200)
        ]

-}
root : List Style -> Style
root =
    pseudoClass "root"


{-| A [`:scope`](https://developer.mozilla.org/en-US/docs/Web/CSS/:scope)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    scope
        [ backgroundColor (rgb 0 200 200)
        ]

-}
scope : List Style -> Style
scope =
    pseudoClass "scope"


{-| A [`:target`](https://developer.mozilla.org/en-US/docs/Web/CSS/:target)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    target
        [ fontWeight bold
        , border3 (px 2) dotted (rgb 255 0 0)
        ]

-}
target : List Style -> Style
target =
    pseudoClass "target"


{-| A [`:valid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:valid)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    valid
        [ border3 (px 1) solid (rgb 0 255 0)
        ]

-}
valid : List Style -> Style
valid =
    pseudoClass "valid"


{-| A [`:visited`](https://developer.mozilla.org/en-US/docs/Web/CSS/:visited)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    visited
        [ color (rgb 150 0 255)
        ]

-}
visited : List Style -> Style
visited =
    pseudoClass "visited"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------- PSEUDO-CLASSES WITH ARGUMENTS --------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A [`:dir()`](https://developer.mozilla.org/en-US/docs/Web/CSS/:dir)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    dir rtl
        [ backgroundColor (hex "#ff0000")
        ]

-}
dir : 
    Value
        { ltr : Supported 
        , rtl : Supported
        }
    -> List Style
    -> Style
dir (Value arg) =
    pseudoClass <| "dir(" ++ arg ++ ")"


{-| A [`:lang()`](https://developer.mozilla.org/en-US/docs/Web/CSS/:lang)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    lang "en-GB"
        [ backgroundColor (hex "#ff0000")
        ]

-}
lang : String -> List Style -> Style
lang langStr =
    pseudoClass <| "lang(" ++ langStr ++ ")"


{-| A [`:not()`](https://developer.mozilla.org/en-US/docs/Web/CSS/:not)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

The first argument is a list of selectors to not select.

    not ["p.notthis", ".notthat"]
        [ backgroundColor (hex "#ff0000")
        ]

-}
not : List String -> List Style -> Style
not selectors =
    pseudoClass <| "not(" ++ String.join ", " selectors ++ ")"


{-| An [`:nth-child()`](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-child)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    nthChild "3"
        [ backgroundColor (hex "#ff0000")
        ]

-}
nthChild : String -> List Style -> Style
nthChild positions =
    pseudoClass <| "nth-child(" ++ positions ++ ")"


{-| An [`:nth-last-child()`](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-last-child)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

This is the same as [`nthChild`](#nthChild), but counting from the end rather than the start.

    nthLastChild "3n+4"
        [ backgroundColor (hex "#ff0000")
        ]

-}
nthLastChild : String -> List Style -> Style
nthLastChild positions =
    pseudoClass <| "nth-last-child(" ++ positions ++ ")"


{-| An [`:nth-of-type()`](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-of-type)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    nthOfType "odd"
        [ backgroundColor (hex "#ff0000")
        ]

-}
nthOfType : String -> List Style -> Style
nthOfType positions =
    pseudoClass <| "nth-of-type(" ++ positions ++ ")"


{-| An [`:nth-last-of-type()`](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-last-of-type)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    nthLastOfType "0n+1"
        [ backgroundColor (hex "#ff0000")
        ]

-}
nthLastOfType : String -> List Style -> Style
nthLastOfType positions =
    pseudoClass <| "nth-last-of-type(" ++ positions ++ ")"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------------- PSEUDO-ELEMENTS ----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Define a custom [pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    textarea
        [ css [ pseudoElement "-webkit-scrollbar" [ display none ] ] ]
        []

...outputs

    <textarea class="d84ff7"></textarea>

    <style>
        .d84ff7::-webkit-scrollbar {
            display: none;
        }
    </style>

-}
pseudoElement : String -> List Style -> Style
pseudoElement element =
    Preprocess.WithPseudoElement (Structure.PseudoElement element)


{-| An [`::after`](https://css-tricks.com/almanac/selectors/a/after-and-before/)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    div [ after [ content "hi!" ] ]

--TODO : Introduce a way to do [`content`](https://developer.mozilla.org/en-US/docs/Web/CSS/content) - lots of options there, not just text. Also it's overloaded with `flexBasis content`.

-}
after : List Style -> Style
after =
    pseudoElement "after"


{-| A [`::backdrop`](https://developer.mozilla.org/en-US/docs/Web/CSS/::backdrop)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    backdrop
        [ background (rgba 255 0 0 0.25)
        ]

-}
backdrop : List Style -> Style
backdrop =
    pseudoElement "backdrop"


{-| A [`::before`](https://css-tricks.com/almanac/selectors/a/after-and-before/)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    div [ before [ content "hi!" ] ]

--TODO : Introduce a way to do [`content`](https://developer.mozilla.org/en-US/docs/Web/CSS/content) - lots of options there, not just text. Also it's overloaded with `flexBasis content`.

-}
before : List Style -> Style
before =
    pseudoElement "before"


{-| A [`::cue`](https://developer.mozilla.org/en-US/docs/Web/CSS/::cue)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    cue
        [ color (rgba 255 255 0 1)
        , fontWeight (int 600)
        ]

-}
cue : List Style -> Style
cue =
    pseudoElement "cue"


{-| A [`::first-letter`](https://developer.mozilla.org/en-US/docs/Web/CSS/::first-letter)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    firstLetter
        [ fontSize (rem 2)
        ]

-}
firstLetter : List Style -> Style
firstLetter =
    pseudoElement "first-letter"


{-| A [`::first-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/::first-line)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    firstLine
        [ fontWeight (int 600)
        ]

-}
firstLine : List Style -> Style
firstLine =
    pseudoElement "first-line"


{-| A [`::marker`](https://developer.mozilla.org/en-US/docs/Web/CSS/::marker)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    marker
        [ color (rgba 255 255 0 1)
        , fontWeight (int 600)
        ]

-}
marker : List Style -> Style
marker =
    pseudoElement "marker"


{-| A [`::placeholder`](https://developer.mozilla.org/en-US/docs/Web/CSS/::placeholder)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

Be careful when using placeholders as they can negatively impact accessibility.

    placeholder
        [ opacity (num 1) <| important
        , color (rgb 90 90 90)
        , fontWeight (int 400)
        ]

]

-}
placeholder : List Style -> Style
placeholder =
    pseudoElement "placeholder"


{-| A [`::selection`](https://developer.mozilla.org/en-US/docs/Web/CSS/::selection)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    selection
        [ backgroundColor (rgb 200 140 15)
        ]

-}
selection : List Style -> Style
selection =
    pseudoElement "selection"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------- PSEUDO-ELEMENTS WITH ARGUMENTS -------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A [`::slotted()`](https://developer.mozilla.org/en-US/docs/Web/CSS/::slotted)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    slotted "*"
        [ backgroundColor (rgb 200 140 15)
        ]

-}
slotted : String -> List Style -> Style
slotted selector =
    pseudoElement <| "slotted(" ++ selector ++ ")"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------- VALUE TYPE GROUPS ---------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A type that is used in properties for CSS wide values.
See [CSS-wide values](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Values_and_Units#css-wide_values).
-}
type alias BaseValue supported =
    Value
        { supported
            | initial : Supported
            , inherit : Supported
            , unset : Supported
            , revert : Supported
        }



{-| A type alias used to accept a [length](https://developer.mozilla.org/en-US/docs/Web/CSS/length)
among other values.
-}
type alias LengthSupported supported =
    { supported
        | ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inch : Supported
        , pc : Supported
        , pt : Supported
        , q : Supported
        , zero : Supported
        , calc : Supported
    }


{-| A type alias used to accept a [length](https://developer.mozilla.org/en-US/docs/Web/CSS/length).
-}
type alias Length =
    LengthSupported {}


{-| A type alias used to accept a [color](https://developer.mozilla.org/en-US/docs/Web/CSS/color)
among other values.
-}
type alias ColorSupported supported =
    { supported
        | rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , currentcolor : Supported
    }


{-| A type alias used to accept a [color](https://developer.mozilla.org/en-US/docs/Web/CSS/color).
-}
type alias Color =
    ColorSupported {}


{-| A type alias used to accept a [line-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#line-style)
(without the `hidden`) value among other values.
-}
type alias LineStyleSupported supported =
    { supported
        | none : Supported
        , dotted : Supported
        , dashed : Supported
        , solid : Supported
        , double : Supported
        , groove : Supported
        , ridge : Supported
        , inset_ : Supported
        , outset : Supported
    }


{-| A type alias used to accept a [line-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#line-style).
This includes `hidden` as a possible value.
-}
type alias LineStyle =
    LineStyleSupported { hidden : Supported }


{-| A type alias used to accept a [line-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width#line-width)
among other values.
-}
type alias LineWidthSupported supported =
    LengthSupported
        { supported
            | thin : Supported
            , medium : Supported
            , thick : Supported
        }


{-| A type alias used to accept a [line-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width#line-width).
-}
type alias LineWidth =
    LineWidthSupported {}


{-| A type alias used to accept a ['width'](https://developer.mozilla.org/en-US/docs/Web/CSS/width#values)
among other values.
-}
type alias WidthSupported supported =
    LengthSupported
        { supported
            | auto : Supported
            , pct : Supported
            , minContent : Supported
            , maxContent : Supported
            , fitContent : Supported
        }


{-| A type alias used to accept a ['width'](https://developer.mozilla.org/en-US/docs/Web/CSS/width#values).
-}
type alias Width =
    WidthSupported {}


{-| A type alias used to accept an [angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)
among other values.
-}
type alias AngleSupported supported =
    { supported
        | deg : Supported
        , grad : Supported
        , rad : Supported
        , turn : Supported
        , zero : Supported
        , calc : Supported
    }


{-| A type alias used to accept an [angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle).
-}
type alias Angle =
    AngleSupported {}




{-| A type alias used to accept an [image](https://developer.mozilla.org/en-US/docs/Web/CSS/image)
among other values.
-}
type alias ImageSupported supported =
    { supported
        | url : Supported
        , linearGradient : Supported
        , radialGradient : Supported
        , repeatingLinearGradient : Supported
        , repeatingRadialGradient : Supported
    }


{-| A type alias used to accept an [image](https://developer.mozilla.org/en-US/docs/Web/CSS/image).
-}
type alias Image =
    ImageSupported {}


{-| A type alias used to accept a [basic shape](https://developer.mozilla.org/en-US/docs/Web/CSS/basic-shape)
among other values.
-}
type alias BasicShapeSupported supported =
    { supported
        | insetRect : Supported
        , insetRect2 : Supported
        , insetRect3 : Supported
        , insetRect4 : Supported
        , circle : Supported
        , circleAt : Supported
        , circleAt2 : Supported
        , ellipse : Supported
        , ellipseAt : Supported
        , ellipseAt2 : Supported
        , polygon : Supported
        , path : Supported
    }


{-| A type alias used to accept a [basic shape](https://developer.mozilla.org/en-US/docs/Web/CSS/basic-shape).
-}
type alias BasicShape =
    BasicShapeSupported {}


{-| A type alias used to accept a [blend mode](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode)
among other values.
-}
type alias BlendModeSupported supported =
    { supported
    | normal : Supported
    , multiply : Supported
    , screen : Supported
    , overlay : Supported
    , darken : Supported
    , lighten : Supported
    , colorDodge : Supported
    , colorBurn : Supported
    , hardLight : Supported
    , softLight : Supported
    , difference : Supported
    , exclusion : Supported
    , hue : Supported
    , saturation : Supported
    , color_ : Supported
    , luminosity : Supported
    }

{-| A type alias used to accept a [blend mode](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode).
-}
type alias BlendMode =
    BlendModeSupported {}

{-| A type alias used to accept a [filter function](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function),
among other values.
-}
type alias FilterFunctionSupported supported =
    { supported
        | blur : Supported
        , brightness : Supported
        , contrast : Supported
        , dropShadow : Supported
        , grayscale : Supported
        , hueRotate : Supported
        , invert : Supported
        , opacity_ : Supported
        , saturate : Supported
        , sepia : Supported
    }

{-| A type alias used to accept a [filter function](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function).
-}
type alias FilterFunction =
    FilterFunctionSupported {}


{-| A type alias used to accept an [time](https://developer.mozilla.org/en-US/docs/Web/CSS/time)
among other values.
-}
type alias TimeSupported supported =
    { supported
        | s : Supported
        , ms : Supported
    }


{-| A type alias used to accept an [time](https://developer.mozilla.org/en-US/docs/Web/CSS/time).
-}
type alias Time =
    TimeSupported {}


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- Calc --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Either [`plus`](#plus) or [`minus`](#minus).

See [`calc`](#calc) for how to use this.

-}
type CalcOperation
    = CalcOperation String


getCalcExpression : String -> String
getCalcExpression str =
    if String.startsWith "calc(" str then
        String.dropLeft 4 str

    else
        str


{-| The css [`calc`](https://css-tricks.com/a-couple-of-use-cases-for-calc) function.

    almostPct100 =
        calc (pct 100) (minus (px 2))

    -- The following compiles to: calc(100vh - (2px + 2rem))
    screenMinusBorderAndFooter =
        calc (vh 100) (minus (calc (px 2) (plus (rem 2))))

    myWidth =
        width almostPct100

    myHeight =
        height screenMinusBorderAndFooter

**CAUTION:** `calc` can easily be used to create invalid CSS values! For example,
`zIndex (calc (pct 100) (minus (px 5)))` compiles to `z-index: calc(100% - 5px);`
which is invalid. According to the spec, `calc` may return values that have no
relation to its arguments, so unfortunately there's not much `elm-css` can do
to make `calc` more reliable. Use with caution!

-}
calc :
    Value
        (LengthSupported
            { pct : Supported
            , num : Supported
            , int : Supported
            }
        )
    -> CalcOperation
    -> Value { provides | calc : Supported }
calc (Value head) (CalcOperation operation) =
    Value
        ("calc("
            ++ getCalcExpression head
            ++ operation
            ++ ")"
        )


{-| Use with [`calc`](#calc) to subtract one value from another.

    calc (pct 100) (minus (px 2))
    -- calc: (100% - 2px)

-}
minus :
    Value
        (LengthSupported
            { pct : Supported
            , num : Supported
            , int : Supported
            }
        )
    -> CalcOperation
minus (Value second) =
    -- The calc `-` operator MUST be surrounded by whitespace.
    CalcOperation (" - " ++ getCalcExpression second)


{-| Use with [`calc`](#calc) to add one numeric value to another.

    calc (pct 100) (plus (px 2))
    -- calc: (100% + 2px)

-}
plus :
    Value
        (LengthSupported
            { pct : Supported
            , num : Supported
            , int : Supported
            }
        )
    -> CalcOperation
plus (Value second) =
    -- The calc `+` operator MUST be surrounded by whitespace.
    CalcOperation (" + " ++ getCalcExpression second)


{-| Use with [`calc`](#calc) to multiply a value by a unitless number.

    calc (pct 100) (times (int 2))
    -- calc: (100% * 2px)

-}
times :
    Value
        { num : Supported
        , int : Supported
        , zero : Supported
        }
    -> CalcOperation
times (Value second) =
    -- The calc `*` operator does not need to be surrounded by whitespace.
    CalcOperation (" * " ++ getCalcExpression second)


{-| Use with [`calc`](#calc) to divide a value by a unitless number.

    calc (pct 100) (dividedBy (int 2))
    -- calc: (100% / 2px)

-}
dividedBy :
    Value
        { num : Supported
        , int : Supported
        , zero : Supported
        }
    -> CalcOperation
dividedBy (Value second) =
    -- The calc `/` operator does not need to be surrounded by whitespace.
    CalcOperation (" / " ++ getCalcExpression second)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- LENGTHS --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Compiles to a `0` value with no units.

    css [ padding zero ]

...compiles to:

    padding: 0;

This conveniently lets you avoid doing things like `padding (px 0)`

-}
zero : Value { provides | zero : Supported }
zero =
    Value "0"


{-| [`px`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (px 5)

-}
px : Float -> Value { provides | px : Supported }
px value =
    Value (String.fromFloat value ++ "px")


{-| [`em`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (em 5)

-}
em : Float -> Value { provides | em : Supported }
em value =
    Value (String.fromFloat value ++ "em")


{-| [`ex`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (ex 5)

-}
ex : Float -> Value { provides | ex : Supported }
ex value =
    Value (String.fromFloat value ++ "ex")


{-| [`ch`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (ch 5)

-}
ch : Float -> Value { provides | ch : Supported }
ch value =
    Value (String.fromFloat value ++ "ch")


{-| [`rem`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (rem 5)

-}
rem : Float -> Value { provides | rem : Supported }
rem value =
    Value (String.fromFloat value ++ "rem")


{-| [`vh`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vh 5)

-}
vh : Float -> Value { provides | vh : Supported }
vh value =
    Value (String.fromFloat value ++ "vh")


{-| [`vw`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vw 5)

-}
vw : Float -> Value { provides | vw : Supported }
vw value =
    Value (String.fromFloat value ++ "vw")


{-| [`vmin`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vmin 5)

-}
vmin : Float -> Value { provides | vmin : Supported }
vmin value =
    Value (String.fromFloat value ++ "vmin")


{-| [`vmax`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vmax 5)

-}
vmax : Float -> Value { provides | vmax : Supported }
vmax value =
    Value (String.fromFloat value ++ "vmax")


{-| [`mm`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (mm 5)

-}
mm : Float -> Value { provides | mm : Supported }
mm value =
    Value (String.fromFloat value ++ "mm")


{-| [`cm`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (cm 5)

-}
cm : Float -> Value { provides | cm : Supported }
cm value =
    Value (String.fromFloat value ++ "cm")


{-| [`Q`](https://developer.mozilla.org/en-US/docs/Web/CSS/length) length units.

    borderWidth (q 2.5)

-}
q : Float -> Value { provides | q : Supported }
q value =
    Value (String.fromFloat value ++ "Q")


{-| [`in`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (inch 5)

(This is `inch` instead of `in` because `in` is a reserved keyword in Elm.)

-}
inch : Float -> Value { provides | inch : Supported }
inch value =
    Value (String.fromFloat value ++ "in")


{-| [`pt`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (pt 5)

-}
pt : Float -> Value { provides | pt : Supported }
pt value =
    Value (String.fromFloat value ++ "pt")


{-| [`pc`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (pc 5)

-}
pc : Float -> Value { provides | pc : Supported }
pc value =
    Value (String.fromFloat value ++ "pc")


{-| [`pct`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (pct 5)

-}
pct : Float -> Value { provides | pct : Supported }
pct value =
    Value (String.fromFloat value ++ "%")



------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------------- FLEX VALUES ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| [`fr`](https://css-tricks.com/introduction-fr-css-unit/) flex units.

    gridAutoColumns (fr 1)
-}
fr : Float -> Value { provides | fr : Supported }
fr val =
    Value <| String.fromFloat val ++ "fr"


{-| The [`minmax()`](https://css-tricks.com/minmax-function-works/)
value for grid properties.

    gridAutoRows (minmax (px 2) (pct 100))
-}
minmax : 
    Value (
        LengthSupported
            { pct : Supported
            , fr : Supported
            , maxContent : Supported
            , minContent : Supported
            , auto : Supported
            }
    )
    -> Value (
        LengthSupported
            { pct : Supported
            , fr : Supported
            , maxContent : Supported
            , minContent : Supported
            , auto : Supported
            }
    )
    -> Value { provides | minmax : Supported }
minmax (Value minBreadth) (Value maxBreadth) =
    Value <| "minmax(" ++ minBreadth ++ "," ++ maxBreadth ++ ")"


{-| The [`fit-content()`](https://developer.mozilla.org/en-US/docs/Web/CSS/fit-content_function)
value that can have a length or percentage value that you want the property to be clamped to.

Not to be confused with the [`fitContent`](#fitContent) value for flex properties.

    gridAutoColumns (fitContentTo (pct 100))

    height (fitContentTo (rem 20))
-}
fitContentTo :
    Value (
        LengthSupported
            { pct : Supported
            }
        )
    -> Value { provides | fitContentTo : Supported }
fitContentTo (Value val) =
    Value <| "fit-content(" ++ val ++ ")"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------ ANGLES ----------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A [`deg` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    deg 360 -- one full circle

    deg 14.23

-}
deg : Float -> Value { provides | deg : Supported }
deg degrees =
    Value (String.fromFloat degrees ++ "deg")


{-| A [`grad` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    grad 400 -- one full circle

    grad 38.8

-}
grad : Float -> Value { provides | grad : Supported }
grad gradians =
    Value (String.fromFloat gradians ++ "grad")


{-| A [`rad` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    rad 6.2832 -- approximately one full circle

    rad 1

-}
rad : Float -> Value { provides | rad : Supported }
rad radians =
    Value (String.fromFloat radians ++ "rad")


{-| A [`turn` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    turn 1 -- one full circle

    turn 0.25

-}
turn : Float -> Value { provides | turn : Supported }
turn turns =
    Value (String.fromFloat turns ++ "turn")


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------------- TIME ----------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`s`](https://developer.mozilla.org/en-US/docs/Web/CSS/time) time unit.

    animationDuration (s 1)

-}
s : Float -> Value { provides | s : Supported }
s value =
    Value (String.fromFloat value ++ "s")


{-| The [`ms`](https://developer.mozilla.org/en-US/docs/Web/CSS/time) time unit.

    animationDuration (ms 120)

-}
ms : Float -> Value { provides | ms : Supported }
ms value =
    Value (String.fromFloat value ++ "ms")


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- NUMBERS --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A unitless number. Useful with properties like
[`flexGrow`](#flexGrow),
and [`order`](#order)
which accept unitless numbers.

    flexGrow (num 2)

    order (num -2)

-}
num : Float -> Value { provides | num : Supported }
num value =
    Value (String.fromFloat value)


{-| A unitless integer. Useful with properties like [`zIndex`](#zIndex) which accept unitless integers.

    zIndex (int 3)

-}
int : Int -> Value { provides | int : Supported }
int value =
    Value (String.fromInt value)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- COLOR ----------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
in functional notation.

    color (rgb 96 181 204)

-}
rgb : Int -> Int -> Int -> Value { provides | rgb : Supported }
rgb red green blue =
    Value <|
        "rgb("
            ++ String.fromInt red
            ++ ","
            ++ String.fromInt green
            ++ ","
            ++ String.fromInt blue
            ++ ")"


{-| [RGBA color value](https://css-tricks.com/the-power-of-rgba/).

    color (rgba 96 181 204 0.25)

-}
rgba : Int -> Int -> Int -> Float -> Value { provides | rgba : Supported }
rgba red green blue alphaVal =
    Value <|
        "rgba("
            ++ String.fromInt red
            ++ ","
            ++ String.fromInt green
            ++ ","
            ++ String.fromInt blue
            ++ ","
            ++ String.fromFloat alphaVal
            ++ ")"


{-| [HSL color value](https://css-tricks.com/mother-effing-hsl/).

The `s` and `l` values are expressed as a number between 0 and 1 and are converted to the appropriate percentage.

    color (hsl 193 0.51 0.59) -- hsl(193, 51%, 59%)

-}
hsl : Float -> Float -> Float -> Value { provides | hsl : Supported }
hsl hueVal sat lightness =
    Value <|
        "hsl("
            ++ String.fromFloat hueVal
            ++ ","
            ++ String.fromFloat (sat * 100)
            ++ "%,"
            ++ String.fromFloat (lightness * 100)
            ++ "%"
            ++ ")"


{-| [HSLA color value](https://css-tricks.com/yay-for-hsla/)

The `s` and `l` values are expressed as a number between 0 and 1 and are converted to the appropriate percentage.

    color (hsla 193 0.51 0.59 0.25) -- hsl(193, 51%, 59%, 0.25)

-}
hsla : Float -> Float -> Float -> Float -> Value { provides | hsla : Supported }
hsla hueVal sat lightness alphaVal =
    Value <|
        "hsla("
            ++ String.fromFloat hueVal
            ++ ","
            ++ String.fromFloat (sat * 100)
            ++ "%,"
            ++ String.fromFloat (lightness * 100)
            ++ "%,"
            ++ String.fromFloat alphaVal
            ++ ")"


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb()) in hexadecimal notation.

You can optionally include `#` as the first character, for benefits like syntax highlighting in editors, ease of copy/pasting from tools which express these as e.g. `#abcdef0`, etc.

    color (hex "#60b5cc")

    color (hex "60b5cc")

-}
hex : String -> Value { provides | hex : Supported }
hex str =
    Value <|
        if String.startsWith "#" str then
            str

        else
            "#" ++ str


{-| The [`currentcolor`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#currentcolor_keyword)
value used by properties such as [`color`](#color), [`backgroundColor`](#backgroundColor)

    color currentcolor

-}
currentcolor : Value { provides | currentcolor : Supported }
currentcolor =
    Value "currentcolor"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
---------------------- STRINGS, IDENTS AND URLs ------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Produces a [`string`](https://developer.mozilla.org/en-US/docs/Web/CSS/string)
value used by properties such as:

  - [`listStyle`](#listStyle)

  - [`listStyleType`](#listStyleType)

  - [`quotes2`](#quotes2)

  - [`fontLanguageOverride`](#fontLanguageOverride)

```
listStyleType (string "> ")

quotes2 (string "«") (string "»")

fontLanguageOverride (string "ENG")
```

-}
string : String -> Value { provides | string : Supported }
string =
    Value << enquoteString


{-| Produces an [`custom-ident`](https://developer.mozilla.org/en-US/docs/Web/CSS/custom-ident)
value used by properties such as (but not limited to) [`listStyle`](#listStyle) and
[`listStyleType`](#listStyleType).

    listStyleType (customIdent "hello-world")

**Note:** This method does not do any checking if the identifierer supplied is valid.

-}
customIdent : String -> Value { provides | customIdent : Supported }
customIdent =
    Value


{-| The `url` value for the [`cursor`](#cursor),
[`fill`](#fill),
[`strokeImage`](#strokeImage),
and [`backgroundImage`](#backgroundImage) properties.
-}
url : String -> Value { provides | url : Supported }
url str =
    Value ("url(" ++ str ++ ")")


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- SHAPES --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Provides a one-argument `inset()` value. (Which creates an
inset rectangle shape.)

    clipPath <| insetRect (px 20) Nothing, "inset(20px)" )

    clipPath <| insetRect (px 20) (Just <| insetRound (px 2))

    clipPath <| insetRect2 (pct 40) (pct 20) (Just <| insetRound4 (px 1) (px 2) (px 3) (px 1))

    clipPath <| insetRect3 (px 20) (px 10) (pct 10) (Just <| insetRound (px 4))

    clipPath <| insetRect3 (em 4) (em 1) (px 2) Nothing

    clipPath <| insetRect4 (cm 4) (cm 5) (cm 2) (cm 1) (Just <| insetRound3 (mm 12) (mm 3) (mm 8))

    clipPath <| insetRect4 (pt 20) (pt 10) (pt 30) (pt 40) (Just <| insetRound2 (pt 2) (pt 5))

Note: This is called `insetRect` instead of `inset` because [`inset`](#inset) and [`inset_`](#inset_)
are already property and value functions handling other areas of CSS.
-}
insetRect :
    Value (
        LengthSupported
            { pct : Supported }
    )
    -> Maybe
        ( Value
            { insetRound : Supported
            , insetRound2 : Supported
            , insetRound3 : Supported
            , insetRound4 : Supported
            }
        )
    -> Value { provides | insetRect : Supported }
insetRect (Value val) maybeRounding =
    Value <| "inset("
        ++ val
        ++ ( case maybeRounding of
                Just ( Value r )  -> " " ++ r
                Nothing -> "" 
            )
        ++ ")"


{-| Provides a 2-argument `inset()` value. (Which creates an
inset rectangle shape.)

    clipPath <| insetRect (px 20) Nothing, "inset(20px)" )

    clipPath <| insetRect (px 20) (Just <| insetRound (px 2))

    clipPath <| insetRect2 (pct 40) (pct 20) (Just <| insetRound4 (px 1) (px 2) (px 3) (px 1))

    clipPath <| insetRect3 (px 20) (px 10) (pct 10) (Just <| insetRound (px 4))

    clipPath <| insetRect3 (em 4) (em 1) (px 2) Nothing

    clipPath <| insetRect4 (cm 4) (cm 5) (cm 2) (cm 1) (Just <| insetRound3 (mm 12) (mm 3) (mm 8))
    
    clipPath <| insetRect4 (pt 20) (pt 10) (pt 30) (pt 40) (Just <| insetRound2 (pt 2) (pt 5))

Note: This is called `insetRect2` instead of `inset2` because [`inset`](#inset) and [`inset_`](#inset_)
are already property and value functions handling other areas of CSS.
-}
insetRect2 :
    Value (
        LengthSupported
            { pct : Supported }
    )
    -> Value (
        LengthSupported
            { pct : Supported }
    )
    -> Maybe
        ( Value
            { insetRound : Supported
            , insetRound2 : Supported
            , insetRound3 : Supported
            , insetRound4 : Supported
            }
        )
    -> Value { provides | insetRect : Supported }
insetRect2 (Value val1) (Value val2) maybeRounding =
    Value <| "inset("
        ++ val1
        ++ " "
        ++ val2
        ++ ( case maybeRounding of
                Just ( Value r )  -> " " ++ r
                Nothing -> "" 
            )
        ++ ")"

{-| Provides a 2-argument `inset()` value. (Which creates an
inset rectangle shape.)

    clipPath <| insetRect (px 20) Nothing, "inset(20px)" )

    clipPath <| insetRect (px 20) (Just <| insetRound (px 2))

    clipPath <| insetRect2 (pct 40) (pct 20) (Just <| insetRound4 (px 1) (px 2) (px 3) (px 1))

    clipPath <| insetRect3 (px 20) (px 10) (pct 10) (Just <| insetRound (px 4))

    clipPath <| insetRect3 (em 4) (em 1) (px 2) Nothing

    clipPath <| insetRect4 (cm 4) (cm 5) (cm 2) (cm 1) (Just <| insetRound3 (mm 12) (mm 3) (mm 8))
    
    clipPath <| insetRect4 (pt 20) (pt 10) (pt 30) (pt 40) (Just <| insetRound2 (pt 2) (pt 5))

Note: This is called `insetRect3` instead of `inset3` because [`inset`](#inset) and [`inset_`](#inset_)
are already property and value functions handling other areas of CSS.
-}
insetRect3 :
    Value (
        LengthSupported
            { pct : Supported }
    )
    -> Value (
        LengthSupported
            { pct : Supported }
    )
    -> Value (
        LengthSupported
            { pct : Supported }
    )
    -> Maybe
        ( Value
            { insetRound : Supported
            , insetRound2 : Supported
            , insetRound3 : Supported
            , insetRound4 : Supported
            }
        )
    -> Value { provides | insetRect : Supported }
insetRect3 (Value val1) (Value val2) (Value val3) maybeRounding =
    Value <| "inset("
        ++ val1
        ++ " "
        ++ val2
        ++ " "
        ++ val3
        ++ ( case maybeRounding of
                Just ( Value r )  -> " " ++ r
                Nothing -> "" 
            )
        ++ ")"


{-| Provides a 2-argument `inset()` value. (Which creates an
inset rectangle shape.)

    clipPath <| insetRect (px 20) Nothing, "inset(20px)" )

    clipPath <| insetRect (px 20) (Just <| insetRound (px 2))

    clipPath <| insetRect2 (pct 40) (pct 20) (Just <| insetRound4 (px 1) (px 2) (px 3) (px 1))

    clipPath <| insetRect3 (px 20) (px 10) (pct 10) (Just <| insetRound (px 4))

    clipPath <| insetRect3 (em 4) (em 1) (px 2) Nothing

    clipPath <| insetRect4 (cm 4) (cm 5) (cm 2) (cm 1) (Just <| insetRound3 (mm 12) (mm 3) (mm 8))
    
    clipPath <| insetRect4 (pt 20) (pt 10) (pt 30) (pt 40) (Just <| insetRound2 (pt 2) (pt 5))

Note: This is called `insetRect4` instead of `inset4` because [`inset`](#inset) and [`inset_`](#inset_)
are already property and value functions handling other areas of CSS.
-}
insetRect4 :
    Value (
        LengthSupported
            { pct : Supported }
    )
    -> Value (
        LengthSupported
            { pct : Supported }
    )
    -> Value (
        LengthSupported
            { pct : Supported }
    )
    -> Value (
        LengthSupported
            { pct : Supported }
    )
    -> Maybe
        ( Value
            { insetRound : Supported
            , insetRound2 : Supported
            , insetRound3 : Supported
            , insetRound4 : Supported
            }
        )
    -> Value { provides | insetRect : Supported }
insetRect4 (Value val1) (Value val2) (Value val3) (Value val4) maybeRounding =
    Value <| "inset("
        ++ val1
        ++ " "
        ++ val2
        ++ " "
        ++ val3
        ++ " "
        ++ val4
        ++ ( case maybeRounding of
                Just ( Value r )  -> " " ++ r
                Nothing -> "" 
            )
        ++ ")"


{-| Provides a 1-value border radius for use with `insetRect`(#insetRect) (`inset()`).

    insetRect (px 40) (Just <| insetRound (px 2))

    insetRect (px 40) (Just <| insetRound2 (px 2) (px 5))

    insetRect (px 40) (Just <| insetRound3 (px 2) (px 3) (px 4))

    insetRect (px 40) (Just <| insetRound4 (px 2) (px 5) (px 1) (px 3))
-}
insetRound :
    Value
        ( LengthSupported { pct : Supported } )
    -> Value
        { provides | insetRound : Supported }
insetRound (Value val) =
    Value <| "round " ++ val


{-| Provides a 2-value border radius for use with `insetRect`(#insetRect) (`inset()`).

    insetRect (px 40) (Just <| insetRound (px 2))

    insetRect (px 40) (Just <| insetRound2 (px 2) (px 5))

    insetRect (px 40) (Just <| insetRound3 (px 2) (px 3) (px 4))

    insetRect (px 40) (Just <| insetRound4 (px 2) (px 5) (px 1) (px 3))
-}
insetRound2 :
    Value
        ( LengthSupported
            { pct : Supported }
        )
    -> Value
        ( LengthSupported
            { pct : Supported }
        )
    -> Value
        { provides | insetRound2 : Supported }
insetRound2 (Value val1) (Value val2) =
    Value <| "round " ++ val1 ++ " " ++ val2


{-| Provides a 3-value border radius for use with `insetRect`(#insetRect) (`inset()`).

    insetRect (px 40) (Just <| insetRound (px 2))

    insetRect (px 40) (Just <| insetRound2 (px 2) (px 5))

    insetRect (px 40) (Just <| insetRound3 (px 2) (px 3) (px 4))

    insetRect (px 40) (Just <| insetRound4 (px 2) (px 5) (px 1) (px 3))
-}
insetRound3 :
    Value
        ( LengthSupported
            { pct : Supported }
        )
    -> Value
        ( LengthSupported
            { pct : Supported }
        )
    -> Value
        ( LengthSupported
            { pct : Supported }
        )
    -> Value
        { provides | insetRound3 : Supported }
insetRound3 (Value val1) (Value val2) (Value val3) =
    Value <|
        "round "
        ++ val1
        ++ " "
        ++ val2
        ++ " "
        ++ val3


{-| Provides a 4-value border radius for use with `insetRect`(#insetRect) (`inset()`).

    insetRect (px 40) (Just <| insetRound (px 2))

    insetRect (px 40) (Just <| insetRound2 (px 2) (px 5))

    insetRect (px 40) (Just <| insetRound3 (px 2) (px 3) (px 4))

    insetRect (px 40) (Just <| insetRound4 (px 2) (px 5) (px 1) (px 3))
-}
insetRound4 :
    Value
        ( LengthSupported
            { pct : Supported }
        )
    -> Value
        ( LengthSupported
            { pct : Supported }
        )
    -> Value
        ( LengthSupported
            { pct : Supported }
        )
    -> Value
        ( LengthSupported
            { pct : Supported }
        )
    -> Value
        { provides | insetRound3 : Supported }
insetRound4 (Value val1) (Value val2) (Value val3) (Value val4) =
    Value <|
        "round "
        ++ val1
        ++ " "
        ++ val2
        ++ " "
        ++ val3
        ++ " "
        ++ val4


{-| Provides a one-argument `circle()` value.

    clipPath (circle (pct 10))

    clipPath (circle closestSide)

    clipPath (circleAt (pct 10) left)

    clipPath (circleAt closestSide (rem 5))

    clipPath (circleAt2 closestSide (rem 5) (rem 1))

Note: This is not to be confused with [`circle_`](#circle_),
which is a keyword value for properties such as `listStyleType`.

-}
circle :
    Value (
        LengthSupported
            { pct : Supported
            , closestSide : Supported
            , farthestSide : Supported
            }
    )
    -> Value { provides | circle : Supported }
circle (Value val) =
    Value <| "circle(" ++ val ++ ")"


{-| Provides a 2-argument `circle(<rad> at <pos>)` value.

    clipPath (circleAt (pct 10) left_)

    clipPath (circleAt closestSide (rem 5))

    clipPath (circleAt2 closestSide (rem 5) (rem 1))
-}
circleAt :
    Value (
        LengthSupported
            { pct : Supported
            , closestSide : Supported
            , farthestSide : Supported
            }
    )
    -> Value (
        LengthSupported
            { pct : Supported
            , top_ : Supported
            , bottom_ : Supported
            , left_ : Supported
            , right_ : Supported
            , center : Supported
            }
    )
    -> Value { provides | circleAt : Supported }
circleAt (Value val1) (Value val2) =
    Value <|
        "circle("
        ++ val1
        ++ " at "
        ++ val2
        ++ ")"


{-| Provides a 3-argument `circle(<rad> at <posX> <posY>)` value.

    clipPath (circleAt2 closestSide (rem 5) (rem 1))

    clipPath (circleAt2 (pct 10) top_ left_)
-}
circleAt2 :
    Value (
        LengthSupported
            { pct : Supported
            , closestSide : Supported
            , farthestSide : Supported
            }
    )
    -> Value (
        LengthSupported
            { pct : Supported
            , left_ : Supported
            , right_ : Supported
            , center : Supported
            }
    )
    -> Value (
        LengthSupported
            { pct : Supported
            , top_ : Supported
            , bottom_ : Supported
            , center : Supported
            }
    )
    -> Value { provides | circleAt2 : Supported }
circleAt2 (Value radius) (Value posX) (Value posY)=
    Value <|
        "circle("
        ++ radius
        ++ " at "
        ++ posX
        ++ " "
        ++ posY
        ++ ")"


{-| Provides a one-argument `ellipse()` value.

    clipPath (ellipse (px 20) (px 10))

    clipPath (ellipse closestSide farthestSide)

    clipPath (ellipseAt closestSide (pct 10) left_)

    clipPath (ellipseAt (pct 20) (pct 10) (rem 5))

    clipPath (ellipseAt2 (rem 5) closestSide (rem 5) (rem 1))

-}
ellipse :
    Value (
        LengthSupported
            { pct : Supported
            , closestSide : Supported
            , farthestSide : Supported
            }
    )
    -> Value (
        LengthSupported
            { pct : Supported
            , closestSide : Supported
            , farthestSide : Supported
            }
    )
    -> Value { provides | ellipse : Supported }
ellipse (Value radx) (Value rady) =
    Value <|
        "ellipse("
        ++ radx
        ++ " "
        ++ rady
        ++ ")"


{-| Provides a 3-argument `ellipse(<radiusX> <radiusY> at <pos>)` value.

    clipPath (ellipseAt (pct 50) (pct 10) left_)

    clipPath (ellipseAt (rem 5) closestSide (rem 5))
-}
ellipseAt :
    Value (
        LengthSupported
            { pct : Supported
            , closestSide : Supported
            , farthestSide : Supported
            }
    )
    -> Value (
        LengthSupported
            { pct : Supported
            , closestSide : Supported
            , farthestSide : Supported
            }
    )
    -> Value (
        LengthSupported
            { pct : Supported
            , top_ : Supported
            , bottom_ : Supported
            , left_ : Supported
            , right_ : Supported
            , center : Supported
            }
    )
    -> Value { provides | ellipseAt : Supported }
ellipseAt (Value radx) (Value rady) (Value pos) =
    Value <|
        "ellipse("
        ++ radx
        ++ " "
        ++ rady
        ++ " at "
        ++ pos
        ++ ")"


{-| Provides a 4-argument `ellipse(<radiusX> <radiusY> at <posX> <posY>)` value.

    clipPath (ellipseAt2 (rem 6) closestSide (rem 5) (rem 1))

    clipPath (ellipseAt2 farthestSide (pct 10) left_ top_)
-}
ellipseAt2 :
    Value (
        LengthSupported
            { pct : Supported
            , closestSide : Supported
            , farthestSide : Supported
            }
    )
    -> Value (
        LengthSupported
            { pct : Supported
            , closestSide : Supported
            , farthestSide : Supported
            }
    )
    -> Value (
        LengthSupported
            { pct : Supported
            , left_ : Supported
            , right_ : Supported
            , center : Supported
            }
    )
    -> Value (
        LengthSupported
            { pct : Supported
            , top_ : Supported
            , bottom_ : Supported
            , center : Supported
            }
    )
    -> Value { provides | ellipseAt2 : Supported }
ellipseAt2 (Value radx) (Value rady) (Value posx) (Value posy) =
    Value <|
        "ellipse("
        ++ radx
        ++ " "
        ++ rady
        ++ " at "
        ++ posx
        ++ " "
        ++ posy
        ++ ")"


{-| The `closest-side` value for use in [circle](#circle) and [ellipse](#ellipse) shapes.

    clipPath (circle closestSide)

    clipPath (ellipse farthestSide (px 20))

-}
closestSide : Value { provides | closestSide : Supported }
closestSide =
    Value "closest-side"


{-| The `farthest-side` value for use in [circle](#circle) and [ellipse](#ellipse) shapes.

    clipPath (circleAt farthestSide (pct 20))

    clipPath (ellipseAt farthestSide (px 2) (pct 20))

-}
farthestSide : Value { provides | farthestSide : Supported }
farthestSide =
    Value "farthest-side"


{-| Creates a `polygon()` value for CSS
properties that accept a `<basic-shape>` value.

Each numerical argument is a Float that represents a
percentage.

    clipPath <| polygon [ (20, 30), (40, 80.3), (14, 50) ]
-}
polygon : List (Float, Float) -> Value { provides | polygon : Supported }
polygon list = 

    let
        stringed = List.map (\l ->
                ( (String.fromFloat <| Tuple.first l )++ "% " )
                ++ ( (String.fromFloat <| Tuple.second l) ++ "%")
            ) list

        split = String.join ", " stringed

    in
    Value <| "polygon("
        ++ split
        ++ ")"


{-| Creates a `path()` value for CSS properties that accept a
`<basic-shape>` value.

The input string needs to be a valid SVG path string.

    clipPath <| path "M161.693,39.249C94.047,39.249 39.127,94.169 39.127,161.816C39.127,229.462 94.047,284.382 161.693,284.382C229.34,284.382 284.26,229.462 284.26,161.816C284.26,94.169 229.34,39.249 161.693,39.249ZM161.693,71.382C211.605,71.382 211.605,252.249 161.693,252.249C111.782,252.249 71.26,211.727 71.26,161.816C71.26,111.904 111.782,71.382 161.693,71.382Z"
-}
path : String -> Value { provides | path : Supported }
path svgPathDef =
    Value <| "path(\"" ++ svgPathDef ++ "\")"



------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------- BLEND MODE VALUES -------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The `multiply` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode multiply

-}
multiply : Value { provides | multiply : Supported }
multiply =
    Value "multiply"


{-| The `screen` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode screen

-}
screen : Value { provides | screen : Supported }
screen =
    Value "screen"


{-| The `overlay` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode overlay

-}
overlay : Value { provides | overlay : Supported }
overlay =
    Value "overlay"


{-| The `darken` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode darken

-}
darken : Value { provides | darken : Supported }
darken =
    Value "darken"


{-| The `lighten` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode lighten

-}
lighten : Value { provides | lighten : Supported }
lighten =
    Value "lighten"


{-| The `color-dodge` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode color - colorDodge

-}
colorDodge : Value { provides | colorDodge : Supported }
colorDodge =
    Value "color-dodge"


{-| The `color-burn` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode colorBurn

-}
colorBurn : Value { provides | colorBurn : Supported }
colorBurn =
    Value "color-burn"


{-| The `hard-light` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode hardLight

-}
hardLight : Value { provides | hardLight : Supported }
hardLight =
    Value "hard-light"


{-| The `soft-light` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode softLight

-}
softLight : Value { provides | softLight : Supported }
softLight =
    Value "soft-light"


{-| The `difference` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode difference

-}
difference : Value { provides | difference : Supported }
difference =
    Value "difference"


{-| The `exclusion` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode exclusion

-}
exclusion : Value { provides | exclusion : Supported }
exclusion =
    Value "exclusion"


{-| The `hue` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode hue

-}
hue : Value { provides | hue : Supported }
hue =
    Value "hue"


{-| The `saturation` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode saturation

-}
saturation : Value { provides | saturation : Supported }
saturation =
    Value "saturation"


{-| The `color` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode color_

Not to be confused with [`color`](#color).

-}
color_ : Value { provides | color_ : Supported }
color_ =
    Value "color"


{-| The `luminosity` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values).

    backgroundBlendMode luminosity

-}
luminosity : Value { provides | luminosity : Supported }
luminosity =
    Value "luminosity"



------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------- FILTER-FUNCTION VALUES -------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Provides a [`blur()` filter function value](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/blur).

    backdropFilter <| blur (px 20)
    -- backdrop-filter: blur(20px);
-}
blur :
    Value ( Length )
    -> Value { provides | blur : Supported }
blur (Value val) =
    Value <| "blur(" ++ val ++ ")"


{-| Provides a [`brightness()` filter function value](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/brightness).

    filter <| brightness (pct 20)
    -- backdrop-filter: brightness(20%);

    filter <| brightness zero -- completely black
    
    backdropFilter <| contrast (num 1) -- no effect

    filter <| brightness (num 0.4)

-}
brightness :
    Value
        { zero : Supported
        , pct : Supported
        , num : Supported
        }
    -> Value { provides | brightness : Supported }
brightness (Value val) =
    Value <| "brightness(" ++ val ++ ")"


{-| Provides a [`contrast()` filter function value](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/contrast).

    backdropFilter <| contrast (pct 20)
    -- backdrop-filter: contrast(20%);

    backdropFilter <| contrast zero -- completely gray

    backdropFilter <| contrast (num 1) -- no effect

    backdropFilter <| contrast (num 0.4)

-}
contrast :
    Value
        { zero : Supported
        , pct : Supported
        , num : Supported
        }
    -> Value { provides | contrast : Supported }
contrast (Value val) =
    Value <| "contrast(" ++ val ++ ")"


{-| Provides a [`drop-shadow()` filter function value](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/drop-shadow).

    filter <| dropShadow (px 20) (px 3) (Just <| px 30) (Just <| hex "#fff")
    -- filter: drop-shadow(20px 4px 30px #fff);
-}
dropShadow :
    Value ( Length )
    -> Value ( Length )
    -> Maybe ( Value Length )
    -> Maybe ( Value Color )
    -> Value { provides | dropShadow : Supported }
dropShadow (Value xOffset) (Value yOffset) maybeBlurRadius maybeColor =
    Value <| "drop-shadow("
        ++ xOffset
        ++ " "
        ++ yOffset
        ++ ( case maybeBlurRadius of
                Just ( Value r )  -> " " ++ r
                Nothing -> "" 
            )
        ++ ( case maybeColor of
                Just ( Value c )  -> " " ++ c
                Nothing -> "" 
            )
        ++ ")"


{-| Provides a [`grayscale()` filter function value](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/grayscale).

    backdropFilter <| grayscale (pct 20)
    -- backdrop-filter: grayscale(20%);

    backdropFilter <| grayscale zero -- no effect

    backdropFilter <| grayscale (num 1) -- completely grayscale

    backdropFilter <| grayscale (num 0.4) -- 40% grayscale

-}
grayscale :
    Value
        { zero : Supported
        , pct : Supported
        , num : Supported
        }
    -> Value { provides | grayscale : Supported }
grayscale (Value val) =
    Value <| "grayscale(" ++ val ++ ")"


{-| Provides a [`hue-rotate()` filter function value](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/hue-rotate).

    backdropFilter <| hueRotate (deg -180)
    -- backdrop-filter: hue-rotate(-180deg);

-}
hueRotate :
    Value Angle
    -> Value { provides | hueRotate : Supported }
hueRotate (Value val) =
    Value <| "hue-rotate(" ++ val ++ ")"


{-| Provides a [`invert()` filter function value](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/invert).

    backdropFilter <| invert (pct 20)
    -- backdrop-filter: invert(20%);

    backdropFilter <| invert zero -- no effect

    backdropFilter <| invert (num 1) -- completely inverted

    backdropFilter <| invert (num 0.4) -- 40% inversion

-}
invert :
    Value
        { zero : Supported
        , pct : Supported
        , num : Supported
        }
    -> Value { provides | invert : Supported }
invert (Value val) =
    Value <| "invert(" ++ val ++ ")"


{-| Provides a [`opacity()` filter function value](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/opacity).

    backdropFilter <| opacity_ (pct 20)
    -- backdrop-filter: opacity(20%);

    backdropFilter <| opacity_ zero -- completely transparent

    backdropFilter <| opacity_ (num 1) -- no effect

    backdropFilter <| opacity_ (num 0.4) -- 40% transparent

Note: This is called `opacity_` instead of `opacity` because [`opacity`](#opacity) is already used as a property function.
-}
opacity_ :
    Value
        { zero : Supported
        , pct : Supported
        , num : Supported
        }
    -> Value { provides | opacity_ : Supported }
opacity_ (Value val) =
    Value <| "opacity(" ++ val ++ ")"


{-| Provides a [`saturate()` filter function value](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/saturate).

    filter <| saturate (pct 20)
    -- filter: saturate(20%);

    filter <| saturate zero -- completely desaturated

    filter <| saturate (num 1) -- no effect

    filter <| saturate (num 2) -- double saturation

    filter <| saturate (num 0.4) -- 40% saturated

-}
saturate :
    Value
        { zero : Supported
        , pct : Supported
        , num : Supported
        }
    -> Value { provides | saturate : Supported }
saturate (Value val) =
    Value <| "saturate(" ++ val ++ ")"



{-| Provides a [`sepia()` filter function value](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/sepia).

    filter <| sepia (pct 20)
    -- filter: sepia(20%);

    filter <| sepia zero -- no effect

    filter <| sepia (num 1) -- completely sepia

    filter <| sepia (num 0.4) -- 40% sepia

-}
sepia :
    Value
        { zero : Supported
        , pct : Supported
        , num : Supported
        }
    -> Value { provides | sepia : Supported }
sepia (Value val) =
    Value <| "sepia(" ++ val ++ ")"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
---------------------------- GLOBAL VALUES -----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`inherit`](https://developer.mozilla.org/en-US/docs/Web/CSS/inherit) value.
Any CSS property can be set to this value.

    display inherit

-}
inherit : Value { provides | inherit : Supported }
inherit =
    Value "inherit"


{-| The [`initial`](https://developer.mozilla.org/en-US/docs/Web/CSS/initial) value.
Any CSS property can be set to this value.

    display initial

    borderStyle initial

-}
initial : Value { provides | initial : Supported }
initial =
    Value "initial"


{-| The [`unset`](https://developer.mozilla.org/en-US/docs/Web/CSS/unset) value.
Any CSS property can be set to this value.

    display unset

    borderStyle unset

-}
unset : Value { provides | unset : Supported }
unset =
    Value "unset"


{-| The [`revert`](https://css-tricks.com/what-does-revert-do-in-css/) value.
Any CSS property can be set to this value.

    all revert

    color revert

-}
revert : Value { provides | revert : Supported }
revert =
    Value "revert"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------ COMMON KEYWORD VALUES -------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The `auto` value used in many properties such as (but not limited to) [`width`](#width),
[`zoom`](#zoom),
[`outlineStyle`](#outlineStyle),
and [`flexBasis`](#flexBasis).

    width auto

    zoom auto

    flexBasis auto

-}
auto : Value { provides | auto : Supported }
auto =
    Value "auto"


{-| The `none` value used in many properties such as (but not limited to) [`display`](#display),
[`borderStyle`](#borderStyle),
[`maxWidth`](#maxWidth),
[`clear`](#clear),
[`strokeDashJustify`](#strokeDashJustify),
and [`flex`](#flex).

    display none

    borderStyle none

    strokeDashJustify none

    flex none

-}
none : Value { provides | none : Supported }
none =
    Value "none"



{-| The `left` value, used in many properties such as:

  - [`backgroundPosition`](#backgroundPosition)
  - [`clear`](#clear)
  - [`float`](#float)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)
  - [`pageBreakAfter`](#pageBreakAfter)
  - [`textAlign`](#textAlign)

```
backgroundPosition left_

clear left_

float left_

justifyContent left_

justifyItems left_

justifySelf left_

pageBreakAfter left_

textAlign left_
```

The value is called `left_` instead of `left` because [`left` is already a property function](#left).

-}
left_ : Value { provides | left_ : Supported }
left_ =
    Value "left"


{-| The `right` value, used in many properties such as:

  - [`backgroundPosition`](#backgroundPosition)
  - [`clear`](#clear)
  - [`float`](#float)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)
  - [`pageBreakAfter`](#pageBreakAfter)
  - [`textAlign`](#textAlign)

```
backgroundPosition right_

clear right_

float right_

justifyContent right_

justifyItems right_

justifySelf right_

pageBreakAfter right_

textAlign right_
```

The value is called `right_` instead of `right` because [`right` is already a property function](#right).

-}
right_ : Value { provides | right_ : Supported }
right_ =
    Value "right"


{-| The `top` value, used in the following properties:

  - [`backgroundPosition`](#backgroundPosition)
  - [`captionSide`](#captionSide)
  - [`objectPosition2`](#objectPosition2)
  - [`perspectiveOrigin2`](#perspectiveOrigin2)
  - [`strokePosition2`](#strokePosition2)
  - [`transformOrigin`](#transformOrigin)
  - [`verticalAlign`](#verticalAlign)

```
backgroundPosition top_

captionSide top_

objectPosition2 right_ top_

perspectiveOrigin2 left_ top_

transformOrigin top_

verticalAlign top_
```

The value is called `top_` instead of `top` because [`top` is already a property function](#top).

-}
top_ : Value { provides | top_ : Supported }
top_ =
    Value "top"


{-| The `bottom` value, used in the following properties:

  - [`backgroundPosition`](#backgroundPosition)
  - [`captionSide`](#captionSide)
  - [`objectPosition2`](#objectPosition2)
  - [`perspectiveOrigin2`](#perspectiveOrigin2)
  - [`strokePosition2`](#strokePosition2)
  - [`transformOrigin`](#transformOrigin)
  - [`verticalAlign`](#verticalAlign)

```
backgroundPosition bottom_

captionSide bottom_

objectPosition2 right_ bottom_

perspectiveOrigin2 left_ bottom_

transformOrigin bottom_

verticalAlign bottom_
```

The value is called `bottom_` instead of `bottom` because [`bottom` is already a property function](#bottom).

-}
bottom_ : Value { provides | bottom_ : Supported }
bottom_ =
    Value "bottom"


{-| The `block` value.

This is a [CSS Logical value](https://css-tricks.com/css-logical-properties-and-values/) used by [`display`](#display) and [`resize`](#resize).


    display block

    resize block

-}
block : Value { provides | block : Supported }
block =
    Value "block"


{-| The `inline` value.

This is a [CSS Logical value](https://css-tricks.com/css-logical-properties-and-values/) used by [`display`](#display) and [`resize`](#resize).

    display inline

    resize inline

-}
inline : Value { provides | inline : Supported }
inline =
    Value "inline"


{-| The `start` value.

It's used in the following properties as a [CSS Logical value](https://css-tricks.com/css-logical-properties-and-values/):

  - [`alignItems`](#alignItems)
  - [`alignContent`](#alignContent)
  - [`alignSelf`](#alignSelf)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)


```
alignContent start

justifyItems start

```

It's also used as an animation keyword used in [`steps2`](#steps2).

```
steps2 3 start
```

-}
start : Value { provides | start : Supported }
start =
    Value "start"


{-| The `end` value.

It's used in the following properties as a [CSS Logical value](https://css-tricks.com/css-logical-properties-and-values/):

  - [`alignItems`](#alignItems)
  - [`alignContent`](#alignContent)
  - [`alignSelf`](#alignSelf)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)


```
alignContent end

justifyItems end

```

It's also used as an animation keyword used in [`steps2`](#steps2).

```
steps2 3 end
```

-}
end : Value { provides | end : Supported }
end =
    Value "end"


{-| The `block-start` value, which is a [CSS Logical value](https://css-tricks.com/css-logical-properties-and-values/).
It can be used with [`captionSide`](#captionSide).

    captionSide blockStart
-}
blockStart : Value { provides | blockEnd : Supported }
blockStart =
    Value "block-start"


{-| The `block-end` value, which is a [CSS Logical value](https://css-tricks.com/css-logical-properties-and-values/).
It can be used with [`captionSide`](#captionSide).

    captionSide blockEnd
-}
blockEnd : Value { provides | blockEnd : Supported }
blockEnd =
    Value "block-end"


{-| Sets `inline-start`, which is a [CSS Logical value](https://css-tricks.com/css-logical-properties-and-values/).
It can be used with the following properties:

- [`captionSide`](#captionSide)
- [`clear`](#clear)
- [`float`](#float)

```
    clear inlineStart

    captionSide inlineStart

    float inlineStart
```
-}
inlineStart : Value { provides | inlineStart : Supported }
inlineStart =
    Value "inline-start"


{-| Sets `inline-end`, which is a [CSS Logical value](https://css-tricks.com/css-logical-properties-and-values/).
It can be used with the following properties:

- [`captionSide`](#captionSide)
- [`clear`](#clear)
- [`float`](#float)

```
    clear inlineEnd

    captionSide inlineEnd

    float inlineEnd
```
-}
inlineEnd : Value { provides | inlineEnd : Supported }
inlineEnd =
    Value "inline-end"


{-| The `min-content` value used for properties such as:

  - sizing (eg. [`width`](#width), [`height`](#height), [`inlineSize`](#inlineSize))

  - min/max sizing (eg. [`minWidth`](#minWidth), [`maxBlockWidth`](#maxBlockWidth))

  - [`flexBasis`](#flexBasis)

```
width minContent
```

-}
minContent : Value { provides | minContent : Supported }
minContent =
    Value "min-content"


{-| The `max-content` value used for properties such as:

  - sizing (eg. [`width`](#width), [`height`](#height), [`inlineSize`](#inlineSize))

  - min/max sizing (eg. [`minWidth`](#minWidth), [`maxBlockWidth`](#maxBlockWidth))

  - [`flexBasis`](#flexBasis)

```
width maxContent
```

-}
maxContent : Value { provides | maxContent : Supported }
maxContent =
    Value "max-content"


{-| The `fit-content` value used for properties such as:

  - sizing (eg. [`width`](#width), [`height`](#height), [`inlineSize`](#inlineSize))

  - min/max sizing (eg. [`minWidth`](#minWidth), [`maxBlockWidth`](#maxBlockWidth))

  - [`flexBasis`](#flexBasis)

```
width fitContent
```

-}
fitContent : Value { provides | fitContent : Supported }
fitContent =
    Value "fit-content"


{-| Sets `x` value for usage with [`scrollSnapType2`](#scrollSnapType2)
and [`rotate2`](#rotate2).

    scrollSnapType2 x mandatory

    rotate x (deg 10)

-}
x : Value { provides | x : Supported }
x =
    Value "x"


{-| Sets `y` value for usage with [`scrollSnapType2`](#scrollSnapType2)
and [`rotate2`](#rotate2).

    scrollSnapType2 y mandatory

    rotate y (deg 50)

-}
y : Value { provides | y : Supported }
y =
    Value "y"


{-| Sets `z` value for usage with [`rotate2`](#rotate2).

    rotate z (deg 100)

-}
z : Value { provides | z : Supported }
z =
    Value "z"


{-| The `stretch` value used in the following properties:

  - [`alignContent`](#alignContent)
  - [`alignItems`](#alignItems)
  - [`alignSelf`](#alignSelf)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)
  - [`strokeDashJustify`](#strokeDashJustify)

```
alignContent stretch

strokeDashJustify stretch
```

-}
stretch : Value { provides | stretch : Supported }
stretch =
    Value "stretch"


{-| The `center` value, used in many properties such as:

  - [`alignContent`](#alignContent)
  - [`alignItems`](#alignItems)
  - [`alignSelf`](#alignSelf)
  - [`backgroundPosition`](#backgroundPosition)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)
  - [`scrollSnapAlign`](#scrollSnapAlign)

```
backgroundPosition enter

justifyContent center
```

-}
center : Value { provides | center : Supported }
center =
    Value "center"


{-| The `margin-box` value, used in [`clipPath`](#clipPath).

```
clipPath marginBox
```
-}
marginBox : Value { provides | marginBox : Supported }
marginBox =
    Value "margin-box"

{-| The `border-box` value, used in the following properties:

  - [`boxSizing`](#boxSizing)
  - [`backgroundClip`](#backgroundClip)
  - [`backgroundOrigin`](backgroundOrigin)
  - [`strokeOrigin`](#strokeOrigin)

```
boxSizing borderBox

backgroundClip borderBox

backgroundOrigin borderBox

strokeOrigin borderBox
```
-}
borderBox : Value { provides | borderBox : Supported }
borderBox =
    Value "border-box"


{-| The `padding-box` value, used with [`backgroundClip`](#backgroundClip),
[`backgroundOrigin`](#backgroundOrigin),
and [`strokeOrigin`](#strokeOrigin).

    backgroundClip paddingBox

    backgroundOrigin paddingBox

    strokeOrigin paddingBox

-}
paddingBox : Value { provides | paddingBox : Supported }
paddingBox =
    Value "padding-box"


{-| The `content-box` value, used in the following properties:

  - [`boxSizing`](#boxSizing)
  - [`backgroundClip`](#backgroundClip)
  - [`backgroundOrigin`](#backgroundOrigin)
  - [`strokeOrigin`](#strokeOrigin)

```
boxSizing contentBox

backgroundClip contentBox

backgroundOrigin contentBox

strokeOrigin contentBox
```

-}
contentBox : Value { provides | contentBox : Supported }
contentBox =
    Value "content-box"


{-| The `fill-box` value used by [`strokeOrigin`](#strokeOrigin)
and [`transformBox`](#transformBox).

    strokeOrigin fillBox

    transformBox fillBox

-}
fillBox : Value { provides | fillBox : Supported }
fillBox =
    Value "fill-box"


{-| The `stroke-box` value used by [`strokeOrigin`](#strokeOrigin)
and [`transformBox`](#transformBox).

    strokeOrigin strokeBoxx

    transformBox strokeBox
-}
strokeBox : Value { provides | strokeBox : Supported }
strokeBox =
    Value "stroke-box"


{-| The `view-box` value used by [`transformBox`](#transformBox).

    transformBox viewBox
-}
viewBox : Value { provides | viewBox : Supported }
viewBox =
    Value "view-box"


{-| The `baseline` value, used in the following properties:

  - [`alignContent`](#alignContent)
  - [`alignItems`](#alignItems)
  - [`alignSelf`](#alignSelf)
  - [`verticalAlign`](#verticalAlign)

```
alignItems baseline

verticalAlign baseline
```

-}
baseline : Value { provides | baseline : Supported }
baseline =
    Value "baseline"


{-| A `sub` value for the following properties:

  - [`fontVariantPosition`](#fontVariantPosition)
  - [`verticalAlign`](#verticalAlign)

```
    fontVariantPosition sub

    verticalAlign sub
```

-}
sub : Value { provides | sub : Supported }
sub =
    Value "sub"


{-| A `super` value for the following properties:

  - [`fontVariantPosition`](#fontVariantPosition)
  - [`verticalAlign`](#verticalAlign)

```
    fontVariantPosition super

    verticalAlign super
```

-}
super : Value { provides | super : Supported }
super =
    Value "super"


{-| The `ruby` value used by [`display`](#display) and [`fontVariantEastAsian`](#fontVariantEastAsian).

    display ruby

    fontVariantEastAsian2 ruby jis83

-}
ruby : Value { provides | ruby : Supported }
ruby =
    Value "ruby"


{-| A `full-width` value for:


### [`textTransform`](#textTransform)

Forces the writing of characters in a square so they can be aligned in East Asian scripts.


### [`fontVariantEastAsian`](#fontVariantEastAsian)

Activates the East Asian characters that are roughly be the same width.

    textTransform fullWidth

    fontVariantEastAsian fullWidth

-}
fullWidth : Value { provides | fullWidth : Supported }
fullWidth =
    Value "full-width"



{-| A `under` value for the [`textUnderlinePosition`](#textUnderlinePosition) property and the [`textEmphasisPosition2`](#textEmphasisPosition2) property.

    textUnderlinePosition under

    textEmphasisPosition2 under left_

-}
under : Value { provides | under : Supported }
under =
    Value "under"




{-| The `circle` value used by properties such as [`listStyle`](#listStyle),
[`listStyleType`](#listStyleType), [`textEmphasis`](#textEmphasis) and [`textEmphasisStyle`](#textEmphasisStyle).

    listStyleType circle_

    textEmphasis2 circle_ (hex "ff0000")

    textEmphasisStyle circle_

Note: This is not to be confused with [`circle`](#circle),
[`circleAt`](#circleAt) or [`circleAt2`](#circleAt2), which are
`<basic-shape>` data types.

-}
circle_ : Value { provides | circle_ : Supported }
circle_ =
    Value "circle"



{-| The `hidden` value used for properties such as [`visibility`](https://css-tricks.com/almanac/properties/v/visibility/), [`overflow`](https://css-tricks.com/almanac/properties/o/overflow/) and [`borderStyle`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style).

    visibility hidden

    overflow hidden

    borderStyle hidden

-}
hidden : Value { provides | hidden : Supported }
hidden =
    Value "hidden"


{-| The `visible` value used for properties such as [`visibility`](https://css-tricks.com/almanac/properties/v/visibility/), [`overflow`](https://css-tricks.com/almanac/properties/o/overflow/) and [`pointer-events`](https://developer.mozilla.org/en-US/docs/Web/CSS/pointer-events).

    visibility visible

    overflow visible

    pointerEvents visible

-}
visible : Value { provides | visible : Supported }
visible =
    Value "visible"



{-| The `thin` value used by various properties.

In [`borderWidth`](#borderWidth) and
[`columnRuleWidth`](#columnRuleWidth), the value is
equivalent to 1px.

    borderWidth thin

    columnRuleWidth thin

It's also used in [`scrollbarWidth`](#scrollbarWidth).

    scrollbarWidth thin

-}
thin : Value { provides | thin : Supported }
thin =
    Value "thin"


{-| The `thick` value used by properties such as [`borderWidth`](#borderWidth),
and [`columnRuleWidth`](#columnRuleWidth).

    borderWidth thick

    columnRuleWidth thick

The value is equivalent of 5px.

-}
thick : Value { provides | thick : Supported }
thick =
    Value "thick"


{-| The `normal` value, which can be used with such properties as:

  - [`fontVariantCaps`](#fontVariantCaps)
  - [`fontKerning`](#fontKerning)
  - [`fontLanguageOverride`](#fontLanguageOverride)
  - [`whiteSpace`](#whiteSpace)
  - [`wordBreak`](#wordBreak)
  - [`columnGap`](#columnGap)
  - [`zoom`](#zoom)
  - [`animationDirection`](#animationDirection)
  - [`alignItems`](#alignItems)
  - [`lineBreak`](#lineBreak)

```
alignItems normal

columnGap normal

fontVariantCaps normal

whiteSpace normal

wordBreak normal

zoom normal
```

-}
normal : Value { provides | normal : Supported }
normal =
    Value "normal"


{-| Sets `strict` value for usage with [`lineBreak`](#lineBreak) and [`contain`](#contain).

    contain strict

    lineBreak strict

-}
strict : Value { provides | strict : Supported }
strict =
    Value "strict"


{-| The `all` value used in properties such as [`columnSpan`](#columnSpan)
and [`pointerEvents`](#pointerEvents).

    columnSpan all_

    pointerEvents all_

This value function has an underscore because [`all` is already a property function](#all).

-}
all_ : Value { provides | all_ : Supported }
all_ =
    Value "all"


{-| Sets `both` value for usage with [`clear`](#clear) and [`resize`](#resize).

      clear both

      resize both

-}
both : Value { provides | both : Supported }
both =
    Value "both"


{-| Sets `always` value for usage with [`scrollSnapStop`](#scrollSnapStop), [`pageBreakBefore`](#pageBreakBefore), and [`pageBreakAfter`](#pageBreakAfter).

    scrollSnapStop always

    pageBreakBefore always

    pageBreakAfter always

-}
always : Value { provides | always : Supported }
always =
    Value "always"


{-| The `scroll` value used for properties such as [`overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow#Values) and [`background-attachment`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment).

    overflow scroll

    backgroundAttachment scroll

-}
scroll : Value { provides | scroll : Supported }
scroll =
    Value "scroll"


{-| The `column` value, used in [`flex-direction`](#flexDirection),
[`break-before`](#breakBefore) and [`break-after`](#breakAfter) properties.

    flexDirection column

    breakBefore column

    breakAfter column

-}
column : Value { provides | column : Supported }
column =
    Value "column"


{-| The `content` value used in the following properties:

  - [`flex`](#flex)
  - [`flex-basis`](#flexBasis)
  - [`contain`](#contain)

```
flexBasis content

contain content
```

-}
content : Value { provides | content : Supported }
content =
    Value "content"


{-| The `fill` value used in properties such as [`objectFit`](#objectFit),
[`pointerEvents`](#pointerEvents), [`paintOrder`](#paintOrder) and [`maskBorderSlice`](#maskBorderSlice).

    objectFit fill_

    pointerEvents fill_

    paintOrder2 fill_ markers

    maskBorderSlice4 fill_ (num 20) (pct 10) (num 45)


The value is called `fill_` instead of `fill` because [`fill`](#fill) is already a property function.
-}
fill_ : Value { provides | fill_ : Supported }
fill_ =
    Value "fill"


{-| The `stroke` value used by [`pointerEvents`](#pointerEvents) and [`paintOrder`](#paintOrder).

    pointerEvents stroke

    paintOrder2 stroke markers

-}
stroke : Value { provides | stroke : Supported }
stroke =
    Value "stroke"


{-| The `text` value for the [`cursor`](#cursor),
[`backgroundClip`](#backgroundClip),
and [`user-select`](#userSelect) properties.

    backgroundClip text

    cursor text

    userSelect text

-}
text : Value { provides | text : Supported }
text =
    Value "text"


{-| Sets the `style` value for:

  - [`contain`](#contain). **(This value is considered at-risk from being deprecated for this property.)**
  - [`fontSynthesis`](#fontSynthesis)

```
    contain style

    fontSynthesis style
```

-}
style : Value { provides | style : Supported }
style =
    Value "style"


{-| The `clip` value used by [`overflow`](#overflow) and [`textOverflow`](#textOverflow).

    overflow clip

    overflowX clip

    overflowY clip

    textOverflow clip


Looking for the `clip` property? [It's been deprecated](https://developer.mozilla.org/en-US/docs/Web/CSS/clip) and not supported in this version of elm-css. You should use [`clipPath`](#clipPath) instead.

-}
clip : Value { provides | clip : Supported }
clip =
    Value "clip"


{-| Sets `cover` for the following properties:

  - [`backgroundSize`](#backgroundSize)
  - [`objectFit`](#objectFit)
  - [`strokeDashCorner`](#strokeDashCorner)
  - [`strokeSize`](#strokeSize)

```
backgroundSize cover

strokeSize cover
```
-}
cover : Value { provides | cover : Supported }
cover =
    Value "cover"


{-| Sets `contain` for the following properties:

  - [`backgroundSize`](#backgroundSize) (It always show the whole background
    image, even if it leaves empty spaces on the sides.)
  - [`objectFit`](#objectFit) (Replaced content is scaled to maintain proportions within the element's content box.)
  - [`userSelect`](#userSelect) (Lets selection start within the element but that selection will be contained within that element's bounds.)
  - [`overscrollBehavior`](#overscrollBehavior) (This means that default scroll overflow behavior
    is observed inside the element, but scroll chaining will not happen to neighbouring elements.)

```
backgroundSize contain_

overscrollBehavior contain_
```

The value is called `contain_` instead of `contain` because [`contain`](#contain) is already a property function.

-}
contain_ : Value { provides | contain_ : Supported }
contain_ =
    Value "contain"


{-| The `repeat` value for [background properties](#backgroundRepeat)
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat repeat

    strokeRepeat repeat

-}
repeat : Value { provides | repeat : Supported }
repeat =
    Value "repeat"


{-| The `no-repeat` value for [background properties](#backgroundRepeat)
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat noRepeat

    strokeRpeat noRepeat

-}
noRepeat : Value { provides | repeat : Supported }
noRepeat =
    Value "no-repeat"


{-| The `repeat-x` value for [repeating backgrounds](#backgroundRepeat)
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat repeatX

    strokeRepeat repeatX

-}
repeatX : Value { provides | repeatX : Supported }
repeatX =
    Value "repeat-x"


{-| The `repeat-y` value for [repeating backgrounds](#backgroundRepeat)
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat repeatY

    strokeRepeat repeatY

-}
repeatY : Value { provides | repeatY : Supported }
repeatY =
    Value "repeat-y"


{-| The `space` value for [repeating backgrounds](#backgroundRepeat)
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat space

    strokeRepeat space

-}
space : Value { provides | space : Supported }
space =
    Value "space"


{-| The `round` value used for properties such as:

  - [repeating backgrounds](#backgroundRepeat)
  - [`strokeLinecap`](#strokeLinecap)
  - [`strokeRepeat`](#strokeRepeat)
  - [`strokeLinejoin`](#strokeLinejoin2)

**This is called `round_` because `round` is a function
word used in Elm Core's `Basics` module.**

```
    backgroundRepeat round_

    strokeLineCap round_

    strokeLinejoin2 miter round_

    strokeRepeat round_
```

-}
round_ : Value { provides | round_ : Supported }
round_ =
    Value "round"


{-| Sets `isolate` value for usage with [`isolation`](#isolation), and
[`unicodeBidi`](#unicodeBidi).

    isolation isolate

    unicodeBidi isolate

-}
isolate : Value { provides | isolate : Supported }
isolate =
    Value "isolate"

    
{-| A `match-parent` value for the [`text-align`](https://css-tricks.com/almanac/properties/t/text-align/),
and [`strokeOrigin`](#strokeOrigin) properties.

    textAlign matchParent

    strokeOrigin matchParent

-}
matchParent : Value { provides | matchParent : Supported }
matchParent =
    Value "match-parent"


{-| A `nowrap` value for the [`white-space`](#whiteSpace)
and [`flex-wrap`](#flexWrap)properties.

    whiteSpace nowrap

    flexWrap nowrap

-}
nowrap : Value { provides | nowrap : Supported }
nowrap =
    Value "nowrap"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------------------- ALL ----------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets an [`all`](https://css-tricks.com/almanac/properties/a/all/) property.

    all inherit

-}
all : BaseValue a -> Style
all (Value val) =
    appendProperty ("all:" ++ val)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- DISPLAY --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`display`](https://css-tricks.com/almanac/properties/d/display/).

    display block

**Note:** This function accepts `flex_` and `grid_` 
ather than `flex` and `grid` because
[`flex`](#flex) and [`grid`](#grid) are already property functions.

-}
display :
    BaseValue
        { block : Supported
        , flex_ : Supported
        , flow : Supported
        , flowRoot : Supported
        , grid_ : Supported
        , listItem : Supported
        , inline : Supported
        , inlineBlock : Supported
        , inlineFlex : Supported
        , inlineGrid : Supported
        , inlineTable : Supported
        , none : Supported
        , contents : Supported
        , ruby : Supported
        , rubyBase : Supported
        , rubyBaseContainer : Supported
        , rubyText : Supported
        , rubyTextContainer : Supported
        , runIn : Supported
        , table : Supported
        , tableCaption : Supported
        , tableCell : Supported
        , tableColumn : Supported
        , tableColumnGroup : Supported
        , tableFooterGroup : Supported
        , tableHeaderGroup : Supported
        , tableRow : Supported
        , tableRowGroup : Supported
        }
    -> Style
display (Value val) =
    appendProperty ("display:" ++ val)


{-| Sets [`display`](https://css-tricks.com/almanac/properties/d/display/).

    display2 block flex_

**Note:** This function accepts `flex_` and `grid_` 
ather than `flex` and `grid` because
[`flex`](#flex) and [`grid`](#grid) are already property functions.

For `display: inline list-item` and similar property values that include `list-item`
look at [`displayListItem2`](#displayListItem2) and [`displayListItem3`](#displayListItem3).

-}
display2 :
    Value
        { block : Supported
        , inline : Supported
        , runIn : Supported
        }
    ->
        Value
            { flow : Supported
            , flowRoot : Supported
            , table : Supported
            , flex_ : Supported
            , grid_ : Supported
            , ruby : Supported
            }
    -> Style
display2 (Value displayOutside) (Value displayInside) =
    appendProperty ("display:" ++ displayOutside ++ " " ++ displayInside)


{-| The [`display`](https://css-tricks.com/almanac/properties/d/display/) property.
This function is used to generate complex `display: list-item` properties
such as `display: block list-item`.

    displayListItem2 block

-}
displayListItem2 :
    Value
        { block : Supported
        , inline : Supported
        , runIn : Supported
        , flow : Supported
        , flowRoot : Supported
        }
    -> Style
displayListItem2 (Value val) =
    appendProperty ("display:list-item " ++ val)


{-| The [`display`](https://css-tricks.com/almanac/properties/d/display/) property.
This function is used to generate complex `display: list-item` properties
such as `display: block flow-root list-item`.

    displayListItem3 block flowRoot

-}
displayListItem3 :
    Value
        { block : Supported
        , inline : Supported
        , runIn : Supported
        }
    ->
        Value
            { flow : Supported
            , flowRoot : Supported
            }
    -> Style
displayListItem3 (Value displayOutside) (Value displayFlow) =
    appendProperty ("display:list-item " ++ displayOutside ++ " " ++ displayFlow)


{-| The `flex` value used by [`display`](#display).

    display flex_

The value is called `flex_` instead of `flex` because [`flex` is already a property function](#flex).

-}
flex_ : Value { provides | flex_ : Supported }
flex_ =
    Value "flex"


{-| The `flow` value used by [`display`](#display).

    display flow

-}
flow : Value { provides | flow : Supported }
flow =
    Value "flow"


{-| The `flow-root` value used by [`display`](#display).

    display flowRoot

-}
flowRoot : Value { provides | flowRoot : Supported }
flowRoot =
    Value "flow-root"


{-| The `grid` value used by [`display`](#display).

The value is called `grid_` instead of `grid` because
[`grid` is already a property function](#grid).


    display grid_

-}
grid_ : Value { provides | grid_ : Supported }
grid_ =
    Value "grid"


{-| The `contents` value used by [`display`](#display).

    display contents

-}
contents : Value { provides | contents : Supported }
contents =
    Value "contents"


{-| The `inline-block` value used by [`display`](#display).

    display inlineBlock

-}
inlineBlock : Value { provides | inlineBlock : Supported }
inlineBlock =
    Value "inline-block"


{-| The `inline-flex` value used by [`display`](#display).

    display inlineFlex

-}
inlineFlex : Value { provides | inlineFlex : Supported }
inlineFlex =
    Value "inline-flex"


{-| The `list-item` value used by [`display`](#display).

    display listItem

-}
listItem : Value { provides | listItem : Supported }
listItem =
    Value "list-item"


{-| The `inline-table` value used by [`display`](#display).

    display inlineTable

-}
inlineTable : Value { provides | inlineTable : Supported }
inlineTable =
    Value "inline-table"


{-| The `inline-grid` value used by [`display`](#display).

    display inlineGrid

-}
inlineGrid : Value { provides | inlineGrid : Supported }
inlineGrid =
    Value "inline-grid"


{-| The `ruby-base` value used by [`display`](#display).

    display rubyBase

-}
rubyBase : Value { provides | rubyBase : Supported }
rubyBase =
    Value "ruby-base"


{-| The `ruby-base-container` value used by [`display`](#display).

    display rubyBaseContainer

-}
rubyBaseContainer : Value { provides | rubyBaseContainer : Supported }
rubyBaseContainer =
    Value "ruby-base-container"


{-| The `ruby-text` value used by [`display`](#display).

    display rubyText

-}
rubyText : Value { provides | rubyText : Supported }
rubyText =
    Value "ruby-text"


{-| The `ruby-text-container` value used by [`display`](#display).

    display rubyTextContainer

-}
rubyTextContainer : Value { provides | rubyTextContainer : Supported }
rubyTextContainer =
    Value "ruby-text-container"


{-| The `run-in` value used by [`display`](#display).

    display runIn

-}
runIn : Value { provides | runIn : Supported }
runIn =
    Value "run-in"


{-| The `table` value used by [`display`](#display).

    display table

-}
table : Value { provides | table : Supported }
table =
    Value "table"


{-| The `table-caption` value used by [`display`](#display).

    display tableCaption

-}
tableCaption : Value { provides | tableCaption : Supported }
tableCaption =
    Value "table-caption"


{-| The `table-cell` value used by [`display`](#display).

    display tableCell

-}
tableCell : Value { provides | tableCell : Supported }
tableCell =
    Value "table-cell"


{-| The `table-column` value used by [`display`](#display).

    display tableColumn

-}
tableColumn : Value { provides | tableColumn : Supported }
tableColumn =
    Value "table-column"


{-| The `table-column-group` value used by [`display`](#display).

    display tableColumnGroup

-}
tableColumnGroup : Value { provides | tableColumnGroup : Supported }
tableColumnGroup =
    Value "table-column-group"


{-| The `table-footer-group` value used by [`display`](#display).

    display tableFooterGroup

-}
tableFooterGroup : Value { provides | tableFooterGroup : Supported }
tableFooterGroup =
    Value "table-footer-group"


{-| The `table-header-group` value used by [`display`](#display).

    display tableHeaderGroup

-}
tableHeaderGroup : Value { provides | tableHeaderGroup : Supported }
tableHeaderGroup =
    Value "table-header-group"


{-| The `table-row` value used by [`display`](#display).

    display tableRow

-}
tableRow : Value { provides | tableRow : Supported }
tableRow =
    Value "table-row"


{-| The `table-row-group` value used by [`display`](#display).

    display tableRowGroup

-}
tableRowGroup : Value { provides | tableRowGroup : Supported }
tableRowGroup =
    Value "table-row-group"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- POSITION -------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets the [`position`](https://css-tricks.com/almanac/properties/p/position/) of an element.

    position absolute

    position relative

-}
position :
    BaseValue
        { absolute : Supported
        , fixed : Supported
        , relative : Supported
        , static : Supported
        , sticky : Supported
        }
    -> Style
position (Value val) =
    appendProperty ("position:" ++ val)


{-| An [`absolute` `position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position#relative).

    position absolute

The default `position` value is [`static`](#static). See also [`position: sticky`](#sticky), and [the differences between absolute, relative, and fixed positioning](<https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/>

-}
absolute : Value { provides | absolute : Supported }
absolute =
    Value "absolute"


{-| A [`fixed` `position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position#Values)
or [`fixed` `background-attachment`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment#Values)
or [`fixed` `table-layout`](https://css-tricks.com/almanac/properties/t/table-layout/).

    position fixed

    backgroundAttachment fixed

    tableLayout fixed

The default `position` value is [`static`](#static). See also [`position: sticky`](#sticky), and [the differences between absolute, relative, and fixed positioning](https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/)

-}
fixed : Value { provides | fixed : Supported }
fixed =
    Value "fixed"


{-| A [`relative` `position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position#Values).

    position relative

The default `position` value is [`static`](#static). See also [`position: sticky`](#sticky), and [the differences between absolute, relative, and fixed positioning](https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/).

-}
relative : Value { provides | relative : Supported }
relative =
    Value "relative"


{-| A [`static` `position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position#Values).

    position static

This is the default `position` value. See also [`position: sticky`](#sticky), and [the differences between absolute, relative, and fixed positioning](https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/).

-}
static : Value { provides | static : Supported }
static =
    Value "static"


{-| A [`sticky` `position`](https://css-tricks.com/position-sticky-2/)

    position sticky

The default `position` value is [`static`](#static). See also [the differences between absolute, relative, and fixed positioning](https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/).

-}
sticky : Value { provides | sticky : Supported }
sticky =
    Value "sticky"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------- STACKING CONTEXTS, BOX-SIZING --------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`z-index`](https://css-tricks.com/almanac/properties/z/z-index/)

    zIndex (int 10)

    zIndex auto

**NOTE:** Z-index is not as simple as it looks! Make sure to read about
[stacking contexts](https://css-tricks.com/css-stacking-contexts/) 
if you're not already familiar with them.

-}
zIndex :
    BaseValue
        { int : Supported
        , auto : Supported
        }
    -> Style
zIndex (Value val) =
    appendProperty ("z-index:" ++ val)


{-| Sets [`isolation`](https://css-tricks.com/almanac/properties/i/isolation/)

    isolation auto

    isolation isolate

-}
isolation :
    BaseValue
        { auto : Supported
        , isolate : Supported
        }
    -> Style
isolation (Value val) =
    appendProperty ("isolation:" ++ val)


{-| Sets [`box-sizing`](https://css-tricks.com/almanac/properties/b/box-sizing/) property.

    boxSizing contentBox

    boxSizing borderBox

-}
boxSizing :
    BaseValue
        { contentBox : Supported
        , borderBox : Supported
        }
    -> Style
boxSizing (Value value) =
    appendProperty ("box-sizing:" ++ value)

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- CONTAIN --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------



{-| The [`contain`](https://css-tricks.com/almanac/properties/c/contain/) property.

    contain none

    contain content

    contain2 size layout

    contain3 size layout style

    contain4 -- all multiple choice values in use, no value entry needed

-}
contain :
    BaseValue
        { none : Supported
        , strict : Supported
        , content : Supported
        , size : Supported
        , inlineSize_ : Supported
        , layout : Supported
        , style : Supported
        , paint : Supported
        }
    -> Style
contain (Value value) =
    appendProperty ("contain:" ++ value)


{-| The [`contain`](https://css-tricks.com/almanac/properties/c/contain/) property.

This two-argument version lets you use 2 of the 4 multiple choice values you
can use for this property.

    contain2 size layout

-}
contain2 :
    Value
        { size : Supported
        , inlineSize_ : Supported
        , layout : Supported
        , style : Supported
        , paint : Supported
        }
    ->
        Value
            { size : Supported
            , inlineSize_ : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    -> Style
contain2 (Value value1) (Value value2) =
    appendProperty ("contain:" ++ value1 ++ " " ++ value2)


{-| The [`contain`](https://css-tricks.com/almanac/properties/c/contain/) property.

This two-argument version lets you use 3 of the 4 multiple choice values you
can use for this property.

    contain3 size layout style

-}
contain3 :
    Value
        { size : Supported
        , inlineSize_ : Supported
        , layout : Supported
        , style : Supported
        , paint : Supported
        }
    ->
        Value
            { size : Supported
            , inlineSize_ : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    ->
        Value
            { size : Supported
            , inlineSize_ : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    -> Style
contain3 (Value value1) (Value value2) (Value value3) =
    appendProperty ("contain:" ++ value1 ++ " " ++ value2 ++ " " ++ value3)


{-| The [`contain`](https://css-tricks.com/almanac/properties/c/contain/) property.

This 4-argument version lets you use all 4 multiple choice values you
can use for this property.

    contain4 size layout style paint

**Note: The `style` value is considered at-risk from being deprecated.**

-}
contain4 :
    Value
        { size : Supported
        , inlineSize_ : Supported
        , layout : Supported
        , style : Supported
        , paint : Supported
        }
    ->
        Value
            { size : Supported
            , inlineSize_ : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    ->
        Value
            { size : Supported
            , inlineSize_ : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    ->
        Value
            { size : Supported
            , inlineSize_ : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    -> Style
contain4 (Value value1) (Value value2) (Value value3) (Value value4) =
    appendProperty ("contain:" ++ value1 ++ " " ++ value2 ++ " " ++ value3 ++ " " ++ value4)


{-| Sets the `size` value for [`contain`](#contain).

This indicates that the element can be sized without
needing to look at the size of its descendants.

    contain size

-}
size : Value { provides | size : Supported }
size =
    Value "size"


{-| Sets the `inline-size` value for [`contain`](#contain).

Indicates that inline size containment is applied to the element.

    contain inlineSize_

Note: This is named `inlineSize_` instead of `inlineSize` because
[it is already a property function](#inlineSize).

-}
inlineSize_ : Value { provides | inlineSize_ : Supported }
inlineSize_ =
    Value "inline-size"


{-| Sets the `layout` value for [`contain`](#contain).

This indicates that nothing outside the element
may affect its internal layout and vice versa.

    contain layout

-}
layout : Value { provides | layout : Supported }
layout =
    Value "layout"


{-| Sets the `paint` value for [`contain`](#contain).

Indicates that descendants of the element will not
display outside its bounds and will not be painted
by the browser if the containing box is offscreen.

    contain paint

-}
paint : Value { provides | paint : Supported }
paint =
    Value "paint"


{-| The [`contain-intrinsic-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-size)
property.

This 1-argument variant lets you use global values, `none` and lengths for width and height.

    containIntrinsicSize revert

    containIntrinsicSize none

                    -- width + height
    containIntrinsicSize (px 500)

                        -- width | height
    containIntrinsicSize2 (rem 5) (px 800)

                    -- width + height w/ auto
    containIntrinsicSize2 auto (px 800)

                      -- width w/ auto | height w/ auto
    containIntrinsicSize4 auto (rem 50) auto (px 250)

-}
containIntrinsicSize :
    BaseValue
        ( LengthSupported
            { none : Supported
            }
        )
    -> Style
containIntrinsicSize (Value val) =
    appendProperty <| "contain-intrinsic-size:" ++ val


{-| The [`contain-intrinsic-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-size)
property.

This 2-argument variant lets you use separate lengths for
width and height or joined with and height with `auto`.

    containIntrinsicSize revert

    containIntrinsicSize none

                    -- width + height
    containIntrinsicSize (px 500)

                        -- width | height
    containIntrinsicSize2 (rem 5) (px 800)

                    -- width + height w/ auto
    containIntrinsicSize2 auto (px 800)

                      -- width w/ auto | height w/ auto
    containIntrinsicSize4 auto (rem 50) auto (px 250)

-}
containIntrinsicSize2 :
    Value 
        ( LengthSupported
            { auto : Supported
            }
        )
    -> Value (Length)
    -> Style
containIntrinsicSize2 (Value val1) (Value val2) =
    appendProperty <| "contain-intrinsic-size:" ++ val1 ++ " " ++ val2


{-| The [`contain-intrinsic-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-size)
property.

This 4-argument variant lets you use separate lengths for
width and height with `auto`.

Note: The 1st and 3rd argument can only be `auto`.

    containIntrinsicSize revert

    containIntrinsicSize none

                    -- width + height
    containIntrinsicSize (px 500)

                        -- width | height
    containIntrinsicSize2 (rem 5) (px 800)

                    -- width + height w/ auto
    containIntrinsicSize2 auto (px 800)

                      -- width w/ auto | height w/ auto
    containIntrinsicSize4 auto (rem 50) auto (px 250)

-}
containIntrinsicSize4 :
    Value { auto : Supported }
    -> Value (Length)
    -> Value { auto : Supported }
    -> Value (Length)
    -> Style
containIntrinsicSize4 (Value valAutoX) (Value valX) (Value valAutoY) (Value valY) =
    appendProperty
        <| "contain-intrinsic-size:"
        ++ valAutoX
        ++ " "
        ++ valX
        ++ " "
        ++ valAutoY
        ++ " "
        ++ valY


{-| The [`contain-intrinsic-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-width)
property.

This 1-argument variant lets you use global values, `none` and lengths.

    containIntrinsicWidth revert

    containIntrinsicWidth none

                     -- specified width
    containIntrinsicWidth (px 500)

                     -- specified width w/ auto
    containIntrinsicWidth2 auto (px 800)

-}
containIntrinsicWidth :
    BaseValue
        ( LengthSupported
            { none : Supported
            }
        )
    -> Style
containIntrinsicWidth (Value val) =
    appendProperty <| "contain-intrinsic-width:" ++ val


{-| The [`contain-intrinsic-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-width)
property.

This 2-argument variant lets you use lengths with `auto`.

Note: The 1st argument can only be `auto`.

    containIntrinsicWidth revert

    containIntrinsicWidth none

                     -- specified width
    containIntrinsicWidth (px 500)

                     -- specified width w/ auto
    containIntrinsicWidth2 auto (px 800)

-}
containIntrinsicWidth2 :
    Value { auto : Supported }
    -> Value (Length)
    -> Style
containIntrinsicWidth2 (Value valAuto) (Value val) =
    appendProperty <| "contain-intrinsic-width:" ++ valAuto ++ " " ++ val


{-| The [`contain-intrinsic-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-height)
property.

This 1-argument variant lets you use global values, `none` and lengths.

    containIntrinsicHeight revert

    containIntrinsicHeight none

                     -- specified height
    containIntrinsicHeight (px 500)

                     -- specified height w/ auto
    containIntrinsicHeight2 auto (px 800)

-}
containIntrinsicHeight :
    BaseValue
        ( LengthSupported
            { none : Supported
            }
        )
    -> Style
containIntrinsicHeight (Value val) =
    appendProperty <| "contain-intrinsic-height:" ++ val


{-| The [`contain-intrinsic-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-height)
property.

This 2-argument variant lets you use lengths with `auto`.

Note: The 1st argument can only be `auto`.

    containIntrinsicHeight revert

    containIntrinsicHeight none

                     -- specified height
    containIntrinsicHeight (px 500)

                     -- specified height w/ auto
    containIntrinsicHeight2 auto (px 800)

-}
containIntrinsicHeight2 :
    Value { auto : Supported }
    -> Value (Length)
    -> Style
containIntrinsicHeight2 (Value valAuto) (Value val) =
    appendProperty <| "contain-intrinsic-height:" ++ valAuto ++ " " ++ val


{-| The [`contain-intrinsic-inline-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-inline-size)
property.

This 1-argument variant lets you use global values, `none` and lengths.

    containIntrinsicInlineSize revert

    containIntrinsicInlineSize none

                -- specified inline size
    containIntrinsicInlineSize (px 500)

                -- specified inline size w/ auto
    containIntrinsicInlineSize2 auto (px 800)

-}
containIntrinsicInlineSize :
    BaseValue
        ( LengthSupported
            { none : Supported
            }
        )
    -> Style
containIntrinsicInlineSize (Value val) =
    appendProperty <| "contain-intrinsic-inline-size:" ++ val


{-| The [`contain-intrinsic-inline-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-inline-size)
property.

This 2-argument variant lets you use lengths with `auto`.

Note: The 1st argument can only be `auto`.

    containIntrinsicInlineSize revert

    containIntrinsicInlineSize none

                -- specified inline size
    containIntrinsicInlineSize (px 500)

                -- specified inline size w/ auto
    containIntrinsicInlineSize2 auto (px 800)

-}
containIntrinsicInlineSize2 :
    Value { auto : Supported }
    -> Value (Length)
    -> Style
containIntrinsicInlineSize2 (Value valAuto) (Value val) =
    appendProperty <| "contain-intrinsic-inline-size:" ++ valAuto ++ " " ++ val


{-| The [`contain-intrinsic-block-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-block-size)
property.

This 1-argument variant lets you use global values, `none` and lengths.

    containIntrinsicBlockSize revert

    containIntrinsicBlockSize none

                -- specified block size
    containIntrinsicBlockSize (px 500)

                -- specified block size w/ auto
    containIntrinsicBlockSize2 auto (px 800)

-}
containIntrinsicBlockSize :
    BaseValue
        ( LengthSupported
            { none : Supported
            }
        )
    -> Style
containIntrinsicBlockSize (Value val) =
    appendProperty <| "contain-intrinsic-block-size:" ++ val


{-| The [`contain-intrinsic-block-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-block-size)
property.

This 2-argument variant lets you use lengths with `auto`.

Note: The 1st argument can only be `auto`.

    containIntrinsicBlockSize revert

    containIntrinsicBlockSize none

                -- specified block size
    containIntrinsicBlockSize (px 500)

                -- specified block size w/ auto
    containIntrinsicBlockSize2 auto (px 800)

-}
containIntrinsicBlockSize2 :
    Value { auto : Supported }
    -> Value (Length)
    -> Style
containIntrinsicBlockSize2 (Value valAuto) (Value val) =
    appendProperty <| "contain-intrinsic-block-size:" ++ valAuto ++ " " ++ val


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- SIZING ---------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`width`](https://css-tricks.com/almanac/properties/w/width/) property.

    width (px 150)

    width (em 1.5)

    width auto

    width minContent

-}
width :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
width (Value sizeVal) =
    appendProperty ("width:" ++ sizeVal)


{-| The [`min-width`](https://css-tricks.com/almanac/properties/m/min-width/) property.

    minWidth (px 150)

    minWidth (em 1.5)

    minWidth auto

-}
minWidth :
    BaseValue
        (LengthSupported
            { pct : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
minWidth (Value sizeVal) =
    appendProperty ("min-width:" ++ sizeVal)


{-| The [`max-width`](https://css-tricks.com/almanac/properties/m/max-width/) property.

    maxWidth (px 150)

    maxWidth (em 1.5)

    maxWidth auto

-}
maxWidth :
    BaseValue
        (LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
maxWidth (Value sizeVal) =
    appendProperty ("max-width:" ++ sizeVal)


{-| The [`height`](https://css-tricks.com/almanac/properties/h/height/) property.

    height (px 34)

-}
height :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
height (Value val) =
    appendProperty ("height:" ++ val)


{-| The [`min-height`](https://css-tricks.com/almanac/properties/m/min-height/) property.

    minHeight (px 20)

-}
minHeight :
    BaseValue
        (LengthSupported
            { pct : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
minHeight (Value val) =
    appendProperty ("min-height:" ++ val)


{-| The [`max-height`](https://css-tricks.com/almanac/properties/m/min-height/) property.

    maxHeight (px 20)

-}
maxHeight :
    BaseValue
        (LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
maxHeight (Value val) =
    appendProperty ("max-height:" ++ val)


{-| The [`block-size`](https://css-tricks.com/almanac/properties/b/block-size/) property.

    blockSize (px 20)

-}
blockSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
blockSize (Value val) =
    appendProperty ("block-size:" ++ val)


{-| The [`min-block-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-block-size) property.

    minBlockSize (px 20)

-}
minBlockSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
minBlockSize (Value val) =
    appendProperty ("min-block-size:" ++ val)


{-| The [`max-block-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-block-size) property.

    maxBlockSize (px 20)

-}
maxBlockSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
maxBlockSize (Value val) =
    appendProperty ("max-block-size:" ++ val)


{-| The [`inline-size`](https://css-tricks.com/almanac/properties/i/inline-size/) property.

    inlineSize (px 20)

-}
inlineSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
inlineSize (Value val) =
    appendProperty ("inline-size:" ++ val)


{-| The [`min-inline-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-inline-size) property.

    minInlineSize (px 20)

-}
minInlineSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
minInlineSize (Value val) =
    appendProperty ("min-inline-size:" ++ val)


{-| The [`max-inline-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-inline-size) property.

    maxInlineSize (px 20)

-}
maxInlineSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
    -> Style
maxInlineSize (Value val) =
    appendProperty ("max-inline-size:" ++ val)



------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- INSETS --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets the [`inset`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset) property.

`inset` sets the `top`, `bottom`, `left` and `right` properties.

    inset (px 10) -- top, bottom, left and right are all 10px.

    inset2 (pct 5) (pct 5) -- top & bottom = 5%, left & right = 5%

    inset3 (px 20) (px 20) (px 20) -- top = 20px, left & right = 20px, bottom = 20px

    inset4 (px 20) (px 20) (px 40) (px 20) -- top = 20px, right = 20px, bottom = 40px, left = 20px

-}
inset :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
inset (Value val) =
    appendProperty ("inset:" ++ val)


{-| Sets the [`inset`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset) property.

`inset` sets the `top`, `bottom`, `left` and `right` properties.

    inset (px 10) -- top, bottom, left and right are all 10px.

    inset2 (pct 5) (pct 5) -- top & bottom = 5%, left & right = 5%

    inset3 (px 20) (px 20) (px 20) -- top = 20px, left & right = 20px, bottom = 20px

    inset4 (px 20) (px 20) (px 40) (px 20) -- top = 20px, right = 20px, bottom = 40px, left = 20px

-}
inset2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
inset2 (Value valTopBottom) (Value valRightLeft) =
    appendProperty ("inset:" ++ valTopBottom ++ " " ++ valRightLeft)


{-| Sets the [`inset`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset) property.

`inset` sets the `top`, `bottom`, `left` and `right` properties.

    inset (px 10) -- top, bottom, left and right are all 10px.

    inset2 (pct 5) (pct 5) -- top & bottom = 5%, left & right = 5%

    inset3 (px 20) (px 20) (px 20) -- top = 20px, left & right = 20px, bottom = 20px

    inset4 (px 20) (px 20) (px 40) (px 20) -- top = 20px, right = 20px, bottom = 40px, left = 20px

-}
inset3 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
inset3 (Value valTop) (Value valRightLeft) (Value valBottom) =
    appendProperty ("inset:" ++ valTop ++ " " ++ valRightLeft ++ " " ++ valBottom)


{-| Sets the [`inset`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset) property.

`inset` sets the `top`, `bottom`, `left` and `right` properties.

    inset (px 10) -- top, bottom, left and right are all 10px.

    inset2 (pct 5) (pct 5) -- top & bottom = 5%, left & right = 5%

    inset3 (px 20) (px 20) (px 20) -- top = 20px, left & right = 20px, bottom = 20px

    inset4 (px 20) (px 20) (px 40) (px 20) -- top = 20px, right = 20px, bottom = 40px, left = 20px

-}
inset4 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
inset4 (Value valTop) (Value valRight) (Value valBottom) (Value valLeft) =
    appendProperty ("inset:" ++ valTop ++ " " ++ valRight ++ " " ++ valBottom ++ " " ++ valLeft)


{-| Sets the [`top`](https://css-tricks.com/almanac/properties/t/top/) property.

    top (px 10)

    top (pct 50)

    top auto

    top zero

If you need to use `top` as a CSS _value_ instead of as a _property_,
for example in `vertical-align: top`, use [`top_`](#top_) instead of this.

-}
top :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
top (Value val) =
    appendProperty ("top:" ++ val)


{-| Sets the [`bottom`](https://css-tricks.com/almanac/properties/b/bottom/) property.

    bottom (px 10)

    bottom (pct 50)

    bottom auto

    bottom zero

If you need to use `bottom` as a CSS _value_ instead of as a _property_,
for example in `vertical-align: bottom`, use [`bottom_`](#bottom_) instead of this.

-}
bottom :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
bottom (Value val) =
    appendProperty ("bottom:" ++ val)


{-| Sets the [`left`](https://css-tricks.com/almanac/properties/l/left/) property.

    left (px 10)

    left (pct 50)

    left auto

    left zero

If you need to use `left` as a CSS _value_ instead of as a _property_,
for example in `float: left`, use [`left_`](#left_) instead of this.

-}
left :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
left (Value val) =
    appendProperty ("left:" ++ val)


{-| Sets the [`right`](https://css-tricks.com/almanac/properties/r/right) property.

    right (px 10)

    right (pct 50)

    right auto

    right zero

If you need to use `right` as a CSS _value_ instead of as a _property_,
for example in `float: right`, use [`right_`](#right_) instead of this.

-}
right :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
right (Value val) =
    appendProperty ("right:" ++ val)


{-| Sets the [`inset-block`](https://css-tricks.com/almanac/properties/i/inset-block/) property.

`inset-block` sets the `inset-block-start` and `inset-block-end` properties.

    insetBlock (px 10) -- block start and block end are both 10px.

    insetBlock2 (pct 5) (pct 5) -- block start = 5%, block end = 5%

-}
insetBlock :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetBlock (Value val) =
    appendProperty ("inset-block:" ++ val)


{-| Sets the [`inset-block`](https://css-tricks.com/almanac/properties/i/inset-block/) property.

`inset-block` sets the `inset-block-start` and `inset-block-end` properties.

    insetBlock (px 10) -- block start and block end are both 10px.

    insetBlock2 (pct 5) (pct 5) -- block start = 5%, block end = 5%

-}
insetBlock2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
insetBlock2 (Value valStart) (Value valEnd) =
    appendProperty ("inset-block:" ++ valStart ++ " " ++ valEnd)


{-| Sets the [`inset-inline`](https://css-tricks.com/almanac/properties/i/inset-inline) property.

`inset-inline` sets the `inset-inline-start` and `inset-inline-end` properties.

    insetInline (px 10) -- inline start and inline end are both 10px.

    insetInline2 (pct 5) (pct 5) -- inline start = 5%, inline end = 5%

-}
insetInline :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetInline (Value val) =
    appendProperty ("inset-inline:" ++ val)


{-| Sets the [`inset-inline`](https://css-tricks.com/almanac/properties/i/inset-inline) property.

`inset-inline` sets the `inset-inline-start` and `inset-inline-end` properties.

    insetInline (px 10) -- inline start and inline end are both 10px.

    insetInline2 (pct 5) (pct 5) -- inline start = 5%, inline end = 5%

-}
insetInline2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
insetInline2 (Value valStart) (Value valEnd) =
    appendProperty ("inset-inline:" ++ valStart ++ " " ++ valEnd)


{-| Sets the [`inset-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-block-start) property.

    insetBlockStart (px 10)

    insetBlockStart (pct 50)

    insetBlockStart auto

    insetBlockStart zero

-}
insetBlockStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetBlockStart (Value val) =
    appendProperty ("inset-block-start:" ++ val)


{-| Sets the [`inset-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-block-end) property.

    insetBlockEnd (px 10)

    insetBlockEnd (pct 50)

    insetBlockEnd auto

    insetBlockEnd zero

-}
insetBlockEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetBlockEnd (Value val) =
    appendProperty ("inset-block-end:" ++ val)


{-| Sets the [`inset-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-inline-start) property.

    insetInlineStart (px 10)

    insetInlineStart (pct 50)

    insetInlineStart auto

    insetInlineStart zero

-}
insetInlineStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetInlineStart (Value val) =
    appendProperty ("inset-inline-start:" ++ val)


{-| Sets the [`inset-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-inline-end) property.

    insetInlineEnd (px 10)

    insetInlineEnd (pct 50)

    insetInlineEnd auto

    insetInlineEnd zero

-}
insetInlineEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetInlineEnd (Value val) =
    appendProperty ("inset-inline-end:" ++ val)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- MARGINS --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`margin`](https://css-tricks.com/almanac/properties/m/margin/) property.
The `margin` property is a shorthand property for setting `margin-top`,
`margin-right`, `margin-bottom`, and `margin-left` in a single declaration.

If there is only one argument value, it applies to all sides. If there are two
values, the top and bottom margins are set to the first value and the right and
left margins are set to the second. If there are three values, the top is set
to the first value, the left and right are set to the second, and the bottom is
set to the third. If there are four values they apply to the top, right,
bottom, and left, respectively.

    margin (em 4) -- set all margins to 4em

    margin2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

    margin3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

    margin4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
margin :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
margin (Value value) =
    appendProperty ("margin:" ++ value)


{-| Sets [`margin`](https://css-tricks.com/almanac/properties/m/margin/) property.
The `margin2` property is a shorthand property for setting `margin-top`,
`margin-right`, `margin-bottom`, and `margin-left` in a single declaration.

The top and bottom margins are set to the first value and the right and left
margins are set to the second.

    margin2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
margin2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
margin2 (Value valueTopBottom) (Value valueRightLeft) =
    appendProperty ("margin:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`margin`](https://css-tricks.com/almanac/properties/m/margin/) property.
The `margin3` property is a shorthand property for setting `margin-top`,
`margin-right`, `margin-bottom`, and `margin-left` in a single declaration.

The top margin is set to the first value, the left and right are set to the
second, and the bottom is set to the third.

    margin3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
margin3 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
margin3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    appendProperty ("margin:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`margin`](https://css-tricks.com/almanac/properties/m/margin/) property.
The `margin4` property is a shorthand property for setting `margin-top`,
`margin-right`, `margin-bottom`, and `margin-left` in a single declaration.

The four values apply to the top, right, bottom, and left margins.

    margin4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
margin4 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
margin4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    appendProperty ("margin:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`margin-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top) property.

    marginTop (px 4)

This article on [`margin-top` versus `margin-bottom`](https://css-tricks.com/margin-bottom-margin-top/) may be useful.

-}
marginTop :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginTop (Value value) =
    appendProperty ("margin-top:" ++ value)


{-| Sets [`margin-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right) property.

    marginRight (px 4)

-}
marginRight :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginRight (Value value) =
    appendProperty ("margin-right:" ++ value)


{-| Sets [`margin-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom) property.

    marginBottom (px 4)

This article on [`margin-top` versus `margin-bottom`](https://css-tricks.com/margin-bottom-margin-top/) may be useful.

-}
marginBottom :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginBottom (Value value) =
    appendProperty ("margin-bottom:" ++ value)


{-| Sets [`margin-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left) property.

    marginLeft (px 4)

-}
marginLeft :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginLeft (Value value) =
    appendProperty ("margin-left:" ++ value)



{-| Sets [`margin-block`](https://css-tricks.com/almanac/properties/m/margin-block/) property.
The `margin-block` property is a shorthand property for setting `margin-block-start` and
`margin-block-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the block start margin is set to the first value and the block end margin
is set to the second.

    marginBlock (em 4) -- set both block margins to 4em

    marginBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
marginBlock :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginBlock (Value value) =
    appendProperty ("margin-block:" ++ value)


{-| Sets [`margin-block`](https://css-tricks.com/almanac/properties/m/margin-block/) property.
The `margin-block` property is a shorthand property for setting `margin-block-start` and
`margin-block-end` in a single declaration.

The block start margin is set to the first value and the block end margin
is set to the second.

    marginBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
marginBlock2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
marginBlock2 (Value valueStart) (Value valueEnd) =
    appendProperty ("margin-block:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`margin-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-start) property.

    marginBlockStart (px 4)

-}
marginBlockStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginBlockStart (Value value) =
    appendProperty ("margin-block-start:" ++ value)


{-| Sets [`margin-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-end) property.

    marginBlockEnd (px 4)

-}
marginBlockEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginBlockEnd (Value value) =
    appendProperty ("margin-block-end:" ++ value)


{-| Sets [`margin-inline`](https://css-tricks.com/almanac/properties/m/margin-inline/) property.
The `margin-inline` property is a shorthand property for setting `margin-inline-start` and
`margin-inline-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the inline start margin is set to the first value and the inline end margin
is set to the second.

    marginInline (em 4) -- set both inline margins to 4em

    marginInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
marginInline :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginInline (Value value) =
    appendProperty ("margin-inline:" ++ value)


{-| Sets [`margin-inline`](https://css-tricks.com/almanac/properties/m/margin-inline/) property.
The `margin-inline` property is a shorthand property for setting `margin-inline-start` and
`margin-inline-end` in a single declaration.

The inline start margin is set to the first value and the inline end margin
is set to the second.

    marginInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
marginInline2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
marginInline2 (Value valueStart) (Value valueEnd) =
    appendProperty ("margin-inline:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`margin-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-start) property.

    marginInlineStart (px 4)

-}
marginInlineStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginInlineStart (Value value) =
    appendProperty ("margin-inline-start:" ++ value)


{-| Sets [`margin-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-end) property.

    marginInlineEnd (px 4)

-}
marginInlineEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginInlineEnd (Value value) =
    appendProperty ("margin-inline-end:" ++ value)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- PADDING --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`padding`](https://css-tricks.com/almanac/properties/p/padding/) property.
The `padding` property is a shorthand property for setting `padding-top`,
`padding-right`, `padding-bottom`, and `padding-left` in a single declaration.

If there is only one argument value, it applies to all sides. If there are two
values, the top and bottom paddings are set to the first value and the right and
left paddings are set to the second. If there are three values, the top is set
to the first value, the left and right are set to the second, and the bottom is
set to the third. If there are four values they apply to the top, right,
bottom, and left, respectively.

    padding (em 4) -- set all margins to 4em

    padding2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

    padding3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

    padding4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

-}
padding :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
padding (Value value) =
    appendProperty ("padding:" ++ value)


{-| Sets [`padding`](https://css-tricks.com/almanac/properties/p/padding/) property.
The `padding2` property is a shorthand property for setting `padding-top`,
`padding-right`, `padding-bottom`, and `padding-left` in a single declaration.

The top and bottom margins are set to the first value and the right and left
margins are set to the second.

    padding2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

-}
padding2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
padding2 (Value valueTopBottom) (Value valueRightLeft) =
    appendProperty ("padding:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`padding`](https://css-tricks.com/almanac/properties/p/padding/) property.
The `padding3` property is a shorthand property for setting `padding-top`,
`padding-right`, `padding-bottom`, and `padding-left` in a single declaration.

The top padding is set to the first value, the left and right are set to the
second, and the bottom is set to the third.

    padding3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

-}
padding3 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
padding3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    appendProperty ("padding:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`padding`](https://css-tricks.com/almanac/properties/p/padding/) property.
The `padding4` property is a shorthand property for setting `padding-top`,
`padding-right`, `padding-bottom`, and `padding-left` in a single declaration.

The four values apply to the top, right, bottom, and left paddings.

    padding4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

-}
padding4 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
padding4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    appendProperty ("padding:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`padding-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top) property.

    paddingTop (px 4)

-}
paddingTop :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingTop (Value value) =
    appendProperty ("padding-top:" ++ value)


{-| Sets [`padding-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right) property.

    paddingRight (px 4)

-}
paddingRight :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingRight (Value value) =
    appendProperty ("padding-right:" ++ value)


{-| Sets [`padding-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom) property.

    paddingBottom (px 4)

-}
paddingBottom :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingBottom (Value value) =
    appendProperty ("padding-bottom:" ++ value)


{-| Sets [`padding-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left) property.

    paddingLeft (px 4)

-}
paddingLeft :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingLeft (Value value) =
    appendProperty ("padding-left:" ++ value)


{-| Sets [`padding-block`](https://css-tricks.com/almanac/properties/p/padding-block/) property.
The `padding-block` property is a shorthand property for setting `padding-block-start` and
`padding-block-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the block start is set to the first value and the block end is set to the second.

    paddingBlock (em 4) -- set both block start and block end to 4em

    paddingBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
paddingBlock :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingBlock (Value value) =
    appendProperty ("padding-block:" ++ value)


{-| Sets [`padding-block`](https://css-tricks.com/almanac/properties/p/padding-block/) property.

The `padding-block` property is a shorthand property for setting `padding-block-start` and
`padding-block-end` in a single declaration.

The block start value is set to the first value and the block end value is set to the second.

    paddingBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
paddingBlock2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
paddingBlock2 (Value valueStart) (Value valueEnd) =
    appendProperty ("padding-block:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`padding-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-start) property.

    paddingBlockStart (px 4)

-}
paddingBlockStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingBlockStart (Value value) =
    appendProperty ("padding-block-start:" ++ value)


{-| Sets [`padding-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-end) property.

    paddingBlockEnd (px 4)

-}
paddingBlockEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingBlockEnd (Value value) =
    appendProperty ("padding-block-end:" ++ value)


{-| Sets [`padding-inline`](https://css-tricks.com/almanac/properties/p/padding-inline/) property.

The `padding-inline` property is a shorthand property for setting `padding-inline-start` and
`padding-inline-end` and in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the inline start is set to the first value and the inline end is set to the second.

    paddingInline (em 4) -- set both inline start and inline end to 4em

    paddingInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
paddingInline :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingInline (Value value) =
    appendProperty ("padding-inline:" ++ value)


{-| Sets [`padding-inline`](https://css-tricks.com/almanac/properties/p/padding-inline/) property.

The `padding-inline` property is a shorthand property for setting `padding-inline-start` and
`padding-inline-end` in a single declaration.

The inline start value is set to the first value and the inline end value is set to the second.

    paddingInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
paddingInline2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
paddingInline2 (Value valueStart) (Value valueEnd) =
    appendProperty ("padding-inline:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`padding-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-start) property.

    paddingInlineStart (px 4)

-}
paddingInlineStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingInlineStart (Value value) =
    appendProperty ("padding-inline-start:" ++ value)


{-| Sets [`padding-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-end) property.

    paddingInlineEnd (px 4)

-}
paddingInlineEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingInlineEnd (Value value) =
    appendProperty ("padding-inline-end:" ++ value)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------------- BORDER --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`border`](https://css-tricks.com/almanac/properties/b/border/) property.

    border (px 1)

    border2 (px 1) solid

    border3 (px 1) solid (hex "#f00")

-}
border : BaseValue LineWidth -> Style
border (Value widthVal) =
    appendProperty ("border:" ++ widthVal)


{-| Sets [`border`](https://css-tricks.com/almanac/properties/b/border/) property.

    border (px 1)

    border2 (px 1) solid

    border3 (px 1) solid (hex "#f00")

-}
border2 : Value LineWidth -> Value LineStyle -> Style
border2 (Value widthVal) (Value styleVal) =
    appendProperty ("border:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border`](https://css-tricks.com/almanac/properties/b/border/) property.

    border (px 1)

    border2 (px 1) solid

    border3 (px 1) solid (hex "#f00")

-}
border3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
border3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("border:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top) property.

    borderTop (px 1)

    borderTop2 (px 1) solid

    borderTop3 (px 1) solid (hex "#f00")

-}
borderTop : BaseValue LineWidth -> Style
borderTop (Value widthVal) =
    appendProperty ("border-top:" ++ widthVal)


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top) property.

    borderTop (px 1)

    borderTop2 (px 1) solid

    borderTop3 (px 1) solid (hex "#f00")

-}
borderTop2 : Value LineWidth -> Value LineStyle -> Style
borderTop2 (Value widthVal) (Value styleVal) =
    appendProperty ("border-top:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top) property.

    borderTop (px 1)

    borderTop2 (px 1) solid

    borderTop3 (px 1) solid (hex "#f00")

-}
borderTop3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderTop3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("border-top:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right) property.

    borderRight (px 1)

    borderRight2 (px 1) solid

    borderRight3 (px 1) solid (hex "#f00")

-}
borderRight : BaseValue LineWidth -> Style
borderRight (Value widthVal) =
    appendProperty ("border-right:" ++ widthVal)


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right) property.

    borderRight (px 1)

    borderRight2 (px 1) solid

    borderRight3 (px 1) solid (hex "#f00")

-}
borderRight2 : Value LineWidth -> Value LineStyle -> Style
borderRight2 (Value widthVal) (Value styleVal) =
    appendProperty ("border-right:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right) property.

    borderRight (px 1)

    borderRight2 (px 1) solid

    borderRight3 (px 1) solid (hex "#f00")

-}
borderRight3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderRight3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("border-right:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom) property.

    borderBottom (px 1)

    borderBottom2 (px 1) solid

    borderBottom3 (px 1) solid (hex "#f00")

-}
borderBottom : BaseValue LineWidth -> Style
borderBottom (Value widthVal) =
    appendProperty ("border-bottom:" ++ widthVal)


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom) property.

    borderBottom (px 1)

    borderBottom2 (px 1) solid

    borderBottom3 (px 1) solid (hex "#f00")

-}
borderBottom2 : Value LineWidth -> Value LineStyle -> Style
borderBottom2 (Value widthVal) (Value styleVal) =
    appendProperty ("border-bottom:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom) property.

    borderBottom (px 1)

    borderBottom2 (px 1) solid

    borderBottom3 (px 1) solid (hex "#f00")

-}
borderBottom3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderBottom3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("border-bottom:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left) property.

    borderLeft (px 1)

    borderLeft2 (px 1) solid

    borderLeft3 (px 1) solid (hex "#f00")

-}
borderLeft : BaseValue LineWidth -> Style
borderLeft (Value widthVal) =
    appendProperty ("border-left:" ++ widthVal)


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left) property.

    borderLeft (px 1)

    borderLeft2 (px 1) solid

    borderLeft3 (px 1) solid (hex "#f00")

-}
borderLeft2 : Value LineWidth -> Value LineStyle -> Style
borderLeft2 (Value widthVal) (Value styleVal) =
    appendProperty ("border-left:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left) property.

    borderLeft (px 1)

    borderLeft2 (px 1) solid

    borderLeft3 (px 1) solid (hex "#f00")

-}
borderLeft3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderLeft3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("border-left:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-block`](https://css-tricks.com/almanac/properties/b/border-block/) property.

    borderBlock (px 1)

    borderBlock2 (px 1) solid

    borderBlock3 (px 1) solid (hex "#f00")

-}
borderBlock : BaseValue LineWidth -> Style
borderBlock (Value widthVal) =
    appendProperty ("border-block:" ++ widthVal)


{-| Sets [`border-block`](https://css-tricks.com/almanac/properties/b/border-block/) property.

    borderBlock (px 1)

    borderBlock2 (px 1) solid

    borderBlock3 (px 1) solid (hex "#f00")

-}
borderBlock2 : Value LineWidth -> Value LineStyle -> Style
borderBlock2 (Value widthVal) (Value styleVal) =
    appendProperty ("border-block:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-block`](https://css-tricks.com/almanac/properties/b/border-block/) property.

    borderBlock (px 1)

    borderBlock2 (px 1) solid

    borderBlock3 (px 1) solid (hex "#f00")

-}
borderBlock3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderBlock3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("border-block:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-block-start`](https://css-tricks.com/almanac/properties/b/border-block-start/) property.

    borderBlockStart (px 1)

    borderBlockStart2 (px 1) solid

    borderBlockStart3 (px 1) solid (hex "#f00")

-}
borderBlockStart : BaseValue LineWidth -> Style
borderBlockStart (Value widthVal) =
    appendProperty ("border-block-start:" ++ widthVal)


{-| Sets [`border-block-start`](https://css-tricks.com/almanac/properties/b/border-block-start/) property.

    borderBlockStart (px 1)

    borderBlockStart2 (px 1) solid

    borderBlockStart3 (px 1) solid (hex "#f00")

-}
borderBlockStart2 : Value LineWidth -> Value LineStyle -> Style
borderBlockStart2 (Value widthVal) (Value styleVal) =
    appendProperty ("border-block-start:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-block-start`](https://css-tricks.com/almanac/properties/b/border-block-start/) property.

    borderBlockStart (px 1)

    borderBlockStart2 (px 1) solid

    borderBlockStart3 (px 1) solid (hex "#f00")

-}
borderBlockStart3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderBlockStart3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("border-block-start:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-block-end`](https://css-tricks.com/almanac/properties/b/border-block-end/) property.

    borderBlockEnd (px 1)

    borderBlockEnd2 (px 1) solid

    borderBlockEnd3 (px 1) solid (hex "#f00")

-}
borderBlockEnd : BaseValue LineWidth -> Style
borderBlockEnd (Value widthVal) =
    appendProperty ("border-block-end:" ++ widthVal)


{-| Sets [`border-block-end`](https://css-tricks.com/almanac/properties/b/border-block-end/) property.

    borderBlockEnd (px 1)

    borderBlockEnd2 (px 1) solid

    borderBlockEnd3 (px 1) solid (hex "#f00")

-}
borderBlockEnd2 : Value LineWidth -> Value LineStyle -> Style
borderBlockEnd2 (Value widthVal) (Value styleVal) =
    appendProperty ("border-block-end:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-block-end`](https://css-tricks.com/almanac/properties/b/border-block-end/) property.

    borderBlockEnd (px 1)

    borderBlockEnd2 (px 1) solid

    borderBlockEnd3 (px 1) solid (hex "#f00")

-}
borderBlockEnd3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderBlockEnd3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("border-block-end:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-inline`](https://css-tricks.com/almanac/properties/b/border-inline/) property.

    borderInline (px 1)

    borderInline2 (px 1) solid

    borderInline3 (px 1) solid (hex "#f00")

-}
borderInline : BaseValue LineWidth -> Style
borderInline (Value widthVal) =
    appendProperty ("border-inline:" ++ widthVal)


{-| Sets [`border-inline`](https://css-tricks.com/almanac/properties/b/border-inline/) property.

    borderInline (px 1)

    borderInline2 (px 1) solid

    borderInline3 (px 1) solid (hex "#f00")

-}
borderInline2 : Value LineWidth -> Value LineStyle -> Style
borderInline2 (Value widthVal) (Value styleVal) =
    appendProperty ("border-inline:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-inline`](https://css-tricks.com/almanac/properties/b/border-inline/) property.

    borderInline (px 1)

    borderInline2 (px 1) solid

    borderInline3 (px 1) solid (hex "#f00")

-}
borderInline3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderInline3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("border-inline:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-inline-start`](https://css-tricks.com/almanac/properties/b/border-inline-start/) property.

    borderInlineStart (px 1)

    borderInlineStart2 (px 1) solid

    borderInlineStart3 (px 1) solid (hex "#f00")

-}
borderInlineStart : BaseValue LineWidth -> Style
borderInlineStart (Value widthVal) =
    appendProperty ("border-inline-start:" ++ widthVal)


{-| Sets [`border-inline-start`](https://css-tricks.com/almanac/properties/b/border-inline-start/) property.

    borderInlineStart (px 1)

    borderInlineStart2 (px 1) solid

    borderInlineStart3 (px 1) solid (hex "#f00")

-}
borderInlineStart2 : Value LineWidth -> Value LineStyle -> Style
borderInlineStart2 (Value widthVal) (Value styleVal) =
    appendProperty ("border-inline-start:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-inline-start`](https://css-tricks.com/almanac/properties/b/border-inline-start/) property.

    borderInlineStart (px 1)

    borderInlineStart2 (px 1) solid

    borderInlineStart3 (px 1) solid (hex "#f00")

-}
borderInlineStart3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderInlineStart3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("border-inline-start:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-inline-end`](https://css-tricks.com/almanac/properties/b/border-inline-end/) property.

    borderInlineEnd (px 1)

    borderInlineEnd2 (px 1) solid

    borderInlineEnd3 (px 1) solid (hex "#f00")

-}
borderInlineEnd : BaseValue LineWidth -> Style
borderInlineEnd (Value widthVal) =
    appendProperty ("border-inline-end:" ++ widthVal)


{-| Sets [`border-inline-end`](https://css-tricks.com/almanac/properties/b/border-inline-end/) property.

    borderInlineEnd (px 1)

    borderInlineEnd2 (px 1) solid

    borderInlineEnd3 (px 1) solid (hex "#f00")

-}
borderInlineEnd2 : Value LineWidth -> Value LineStyle -> Style
borderInlineEnd2 (Value widthVal) (Value styleVal) =
    appendProperty ("border-inline-end:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-inline-end`](https://css-tricks.com/almanac/properties/b/border-inline-end/) property.

    borderInlineEnd (px 1)

    borderInlineEnd2 (px 1) solid

    borderInlineEnd3 (px 1) solid (hex "#f00")

-}
borderInlineEnd3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderInlineEnd3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("border-inline-end:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth : BaseValue LineWidth -> Style
borderWidth (Value widthVal) =
    appendProperty ("border-width:" ++ widthVal)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth2 : Value LineWidth -> Value LineWidth -> Style
borderWidth2 (Value widthTopBottom) (Value widthRightLeft) =
    appendProperty ("border-width:" ++ widthTopBottom ++ " " ++ widthRightLeft)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth3 : Value LineWidth -> Value LineWidth -> Value LineWidth -> Style
borderWidth3 (Value widthTop) (Value widthRightLeft) (Value widthBottom) =
    appendProperty ("border-width:" ++ widthTop ++ " " ++ widthRightLeft ++ " " ++ widthBottom)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth4 : Value LineWidth -> Value LineWidth -> Value LineWidth -> Value LineWidth -> Style
borderWidth4 (Value widthTop) (Value widthRight) (Value widthBottom) (Value widthLeft) =
    appendProperty ("border-width:" ++ widthTop ++ " " ++ widthRight ++ " " ++ widthBottom ++ " " ++ widthLeft)


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width) property.

    borderTopWidth (px 1)

-}
borderTopWidth : BaseValue LineWidth -> Style
borderTopWidth (Value widthVal) =
    appendProperty ("border-top-width:" ++ widthVal)


{-| Sets [`border-right-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width) property.

    borderRightWidth (px 1)

-}
borderRightWidth : BaseValue LineWidth -> Style
borderRightWidth (Value widthVal) =
    appendProperty ("border-right-width:" ++ widthVal)


{-| Sets [`border-bottom-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width) property.

    borderBottomWidth (px 1)

-}
borderBottomWidth : BaseValue LineWidth -> Style
borderBottomWidth (Value widthVal) =
    appendProperty ("border-bottom-width:" ++ widthVal)


{-| Sets [`border-left-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width) property.

    borderLeftWidth (px 1)

-}
borderLeftWidth : BaseValue LineWidth -> Style
borderLeftWidth (Value widthVal) =
    appendProperty ("border-left-width:" ++ widthVal)


{-| Sets [`border-block-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-width) property.

    borderBlockWidth (px 1)

-}
borderBlockWidth : BaseValue LineWidth -> Style
borderBlockWidth (Value widthVal) =
    appendProperty ("border-block-width:" ++ widthVal)


{-| Sets [`border-block-start-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-width) property.

    borderBlockStartWidth (px 1)

-}
borderBlockStartWidth : BaseValue LineWidth -> Style
borderBlockStartWidth (Value widthVal) =
    appendProperty ("border-block-start-width:" ++ widthVal)


{-| Sets [`border-block-end-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-width) property.

    borderBlockEndWidth (px 1)

-}
borderBlockEndWidth : BaseValue LineWidth -> Style
borderBlockEndWidth (Value widthVal) =
    appendProperty ("border-block-end-width:" ++ widthVal)


{-| Sets [`border-inline-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-width) property.

    borderTopWidth (px 1)

-}
borderInlineWidth : BaseValue LineWidth -> Style
borderInlineWidth (Value widthVal) =
    appendProperty ("border-inline-width:" ++ widthVal)


{-| Sets [`border-inline-start-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-width) property.

    borderInlineStartWidth (px 1)

-}
borderInlineStartWidth : BaseValue LineWidth -> Style
borderInlineStartWidth (Value widthVal) =
    appendProperty ("border-inline-start-width:" ++ widthVal)


{-| Sets [`border-inline-end-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-width) property.

    borderInlineEndWidth (px 1)

-}
borderInlineEndWidth : BaseValue LineWidth -> Style
borderInlineEndWidth (Value widthVal) =
    appendProperty ("border-inline-end-width:" ++ widthVal)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle solid

    borderStyle2 solid none

    borderStyle3 solid none dotted

    borderStyle4 solid none dotted groove

-}
borderStyle : BaseValue LineStyle -> Style
borderStyle (Value styleVal) =
    appendProperty ("border-style:" ++ styleVal)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle solid

-}
borderStyle2 : Value LineStyle -> Value LineStyle -> Style
borderStyle2 (Value styleTopBottom) (Value styleRigthLeft) =
    appendProperty ("border-style:" ++ styleTopBottom ++ " " ++ styleRigthLeft)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle2 solid none

-}
borderStyle3 : Value LineStyle -> Value LineStyle -> Value LineStyle -> Style
borderStyle3 (Value styleTop) (Value styleRigthLeft) (Value styleBottom) =
    appendProperty ("border-style:" ++ styleTop ++ " " ++ styleRigthLeft ++ " " ++ styleBottom)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle4 solid none dotted groove

-}
borderStyle4 : Value LineStyle -> Value LineStyle -> Value LineStyle -> Value LineStyle -> Style
borderStyle4 (Value styleTop) (Value styleRigt) (Value styleBottom) (Value styleLeft) =
    appendProperty ("border-style:" ++ styleTop ++ " " ++ styleRigt ++ " " ++ styleBottom ++ " " ++ styleLeft)


{-| Sets [`border-top-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-style) property.

    borderTopStyle solid

-}
borderTopStyle : BaseValue LineStyle -> Style
borderTopStyle (Value styleVal) =
    appendProperty ("border-top-style:" ++ styleVal)


{-| Sets [`border-right-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-style) property.

    borderRightStyle solid

-}
borderRightStyle : BaseValue LineStyle -> Style
borderRightStyle (Value styleVal) =
    appendProperty ("border-right-style:" ++ styleVal)


{-| Sets [`border-bottom-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-style) property.

    borderBottomStyle solid

-}
borderBottomStyle : BaseValue LineStyle -> Style
borderBottomStyle (Value styleVal) =
    appendProperty ("border-bottom-style:" ++ styleVal)


{-| Sets [`border-left-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-style) property.

    borderLeftStyle solid

-}
borderLeftStyle : BaseValue LineStyle -> Style
borderLeftStyle (Value styleVal) =
    appendProperty ("border-left-style:" ++ styleVal)


{-| Sets [`border-block-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-style) property.

    borderBlockStyle solid

-}
borderBlockStyle : BaseValue LineStyle -> Style
borderBlockStyle (Value styleVal) =
    appendProperty ("border-block-style:" ++ styleVal)


{-| Sets [`border-block-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-style) property.

    borderBlockStartStyle solid

-}
borderBlockStartStyle : BaseValue LineStyle -> Style
borderBlockStartStyle (Value styleVal) =
    appendProperty ("border-block-start-style:" ++ styleVal)


{-| Sets [`border-block-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-style) property.

    borderBlockEndStyle solid

-}
borderBlockEndStyle : BaseValue LineStyle -> Style
borderBlockEndStyle (Value styleVal) =
    appendProperty ("border-block-end-style:" ++ styleVal)


{-| Sets [`border-inline-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-style) property.

    borderInlineStyle solid

-}
borderInlineStyle : BaseValue LineStyle -> Style
borderInlineStyle (Value styleVal) =
    appendProperty ("border-inline-style:" ++ styleVal)


{-| Sets [`border-inline-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-style) property.

    borderInlineStartStyle solid

-}
borderInlineStartStyle : BaseValue LineStyle -> Style
borderInlineStartStyle (Value styleVal) =
    appendProperty ("border-inline-start-style:" ++ styleVal)


{-| Sets [`border-inline-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-style) property.

    borderInlineEndStyle solid

-}
borderInlineEndStyle : BaseValue LineStyle -> Style
borderInlineEndStyle (Value styleVal) =
    appendProperty ("border-inline-end-style:" ++ styleVal)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor : BaseValue Color -> Style
borderColor (Value colorVal) =
    appendProperty ("border-color:" ++ colorVal)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor2 : Value Color -> Value Color -> Style
borderColor2 (Value colorTopBottom) (Value colorRightLeft) =
    appendProperty ("border-color:" ++ colorTopBottom ++ " " ++ colorRightLeft)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor3 : Value Color -> Value Color -> Value Color -> Style
borderColor3 (Value colorTop) (Value colorRightLeft) (Value colorBottom) =
    appendProperty ("border-color:" ++ colorTop ++ " " ++ colorRightLeft ++ " " ++ colorBottom)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor4 : Value Color -> Value Color -> Value Color -> Value Color -> Style
borderColor4 (Value colorTop) (Value colorRight) (Value colorBottom) (Value colorLeft) =
    appendProperty ("border-color:" ++ colorTop ++ " " ++ colorRight ++ " " ++ colorBottom ++ " " ++ colorLeft)


{-| Sets [`border-top-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-color) property.

    borderTopColor (rgb 0 0 0)

-}
borderTopColor : BaseValue Color -> Style
borderTopColor (Value colorVal) =
    appendProperty ("border-top-color:" ++ colorVal)


{-| Sets [`border-right-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-color) property.

    borderRightColor (rgb 0 0 0)

-}
borderRightColor : BaseValue Color -> Style
borderRightColor (Value colorVal) =
    appendProperty ("border-right-color:" ++ colorVal)


{-| Sets [`border-bottom-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-color) property.

    borderBottomColor (rgb 0 0 0)

-}
borderBottomColor : BaseValue Color -> Style
borderBottomColor (Value colorVal) =
    appendProperty ("border-bottom-color:" ++ colorVal)


{-| Sets [`border-left-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-color) property.

    borderLeftColor (rgb 0 0 0)

-}
borderLeftColor : BaseValue Color -> Style
borderLeftColor (Value colorVal) =
    appendProperty ("border-left-color:" ++ colorVal)


{-| Sets [`border-block-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-color) property.

    borderBlockColor (rgb 0 0 0)

-}
borderBlockColor : BaseValue Color -> Style
borderBlockColor (Value colorVal) =
    appendProperty ("border-block-color:" ++ colorVal)


{-| Sets [`border-block-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-color) property.

    borderBlockStartColor (rgb 0 0 0)

-}
borderBlockStartColor : BaseValue Color -> Style
borderBlockStartColor (Value colorVal) =
    appendProperty ("border-block-start-color:" ++ colorVal)


{-| Sets [`border-block-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-color) property.

    borderBlockEndColor (rgb 0 0 0)

-}
borderBlockEndColor : BaseValue Color -> Style
borderBlockEndColor (Value colorVal) =
    appendProperty ("border-block-end-color:" ++ colorVal)


{-| Sets [`border-inline-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-color) property.

    borderInlineColor (rgb 0 0 0)

-}
borderInlineColor : BaseValue Color -> Style
borderInlineColor (Value colorVal) =
    appendProperty ("border-inline-color:" ++ colorVal)


{-| Sets [`border-inline-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-color) property.

    borderInlineStartColor (rgb 0 0 0)

-}
borderInlineStartColor : BaseValue Color -> Style
borderInlineStartColor (Value colorVal) =
    appendProperty ("border-inline-start-color:" ++ colorVal)


{-| Sets [`border-inline-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-color) property.

    borderInlineEndColor (rgb 0 0 0)

-}
borderInlineEndColor : BaseValue Color -> Style
borderInlineEndColor (Value colorVal) =
    appendProperty ("border-inline-end-color:" ++ colorVal)




-- BORDER STYLE --


{-| The `dotted` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

It represents a line that consists of dots.

    borderStyle dotted

    columnRuleStyle dotted

    textDecorationStyle dotted

-}
dotted : Value { provides | dotted : Supported }
dotted =
    Value "dotted"


{-| The `dashed` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

    borderStyle dashed

    columnRuleStyle dashed

    textDecorationStyle dashed

It represents a line that consists of dashes.

-}
dashed : Value { provides | dashed : Supported }
dashed =
    Value "dashed"


{-| The `solid` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

    borderStyle solid

    columnRuleStyle solid

    textDecorationStyle solid

It represents a solid, continuous line.

-}
solid : Value { provides | solid : Supported }
solid =
    Value "solid"


{-| The `double` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

    borderStyle double

    columnRuleStyle double

    textDecorationStyle double

It represents a double line: two lines side by side.

-}
double : Value { provides | double : Supported }
double =
    Value "double"


{-| The `groove` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

    borderStyle groove

    columnRuleStyle groove

    textDecorationStyle groove

Adds a bevel based on the color value, which makes things appear pressed into the document.

-}
groove : Value { provides | groove : Supported }
groove =
    Value "groove"


{-| The `ridge` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

    borderStyle ridge

    columnRuleStyle ridge

    textDecorationStyle ridge

Similar to [`groove`](#groove), but reverses the color values in a way that makes things appear raised.

-}
ridge : Value { provides | ridge : Supported }
ridge =
    Value "ridge"


{-| The `inset` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

This is called `inset_` rather than `inset` because [`inset` is already a property function](#inset).

    borderStyle inset_

    columnRuleStyle inset_

    textDecorationStyle inset_

Adds a split tone to the line that makes it appear slightly depressed.

Contrast with [`outset`](#outset)

-}
inset_ : Value { provides | inset_ : Supported }
inset_ =
    Value "inset"


{-| The `outset` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle),
and [`textDecorationStyle`](#textDecorationStyle),
and [`strokeAlign`](#strokeAlign).

    borderStyle outset

    columnRuleStyle outset

    strokeAlign outset

    textDecorationStyle outset

Similar to [`inset_`](#inset_), but reverses the colors in a way that makes it appear slightly raised.

-}
outset : Value { provides | outset : Supported }
outset =
    Value "outset"



{- BORDER RADIUS -}


{-| Sets [`border-radius`](https://css-tricks.com/almanac/properties/b/border-radius/) property.

    borderRadius (em 4)

    borderRadius2 (em 4) (px 2)

    borderRadius3 (em 4) (px 2) (pct 5)

    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderRadius (Value radius) =
    appendProperty ("border-radius:" ++ radius)


{-| Sets [`border-radius`](https://css-tricks.com/almanac/properties/b/border-radius/) property.

    borderRadius (em 4)

    borderRadius2 (em 4) (px 2)

    borderRadius3 (em 4) (px 2) (pct 5)

    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderRadius2 (Value radiusTopLeftAndBottomRight) (Value radiusTopRightAndBottomLeft) =
    appendProperty ("border-radius:" ++ radiusTopLeftAndBottomRight ++ " " ++ radiusTopRightAndBottomLeft)


{-| Sets [`border-radius`](https://css-tricks.com/almanac/properties/b/border-radius/) property.

    borderRadius (em 4)

    borderRadius2 (em 4) (px 2)

    borderRadius3 (em 4) (px 2) (pct 5)

    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius3 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderRadius3 (Value radiusTopLeft) (Value radiusTopRightAndBottomLeft) (Value radiusBottomRight) =
    appendProperty ("border-radius:" ++ radiusTopLeft ++ " " ++ radiusTopRightAndBottomLeft ++ " " ++ radiusBottomRight)


{-| Sets [`border-radius`](https://css-tricks.com/almanac/properties/b/border-radius/) property.

    borderRadius (em 4)

    borderRadius2 (em 4) (px 2)

    borderRadius3 (em 4) (px 2) (pct 5)

    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius4 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderRadius4 (Value radiusTopLeft) (Value radiusTopRight) (Value radiusBottomRight) (Value radiusBottomLeft) =
    appendProperty ("border-radius:" ++ radiusTopLeft ++ " " ++ radiusTopRight ++ " " ++ radiusBottomRight ++ " " ++ radiusBottomLeft)


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius) property.

    borderTopLeftRadius (em 4)

    borderTopLeftRadius2 (em 4) (px 2)

-}
borderTopLeftRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderTopLeftRadius (Value radius) =
    appendProperty ("border-top-left-radius:" ++ radius)


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius) property.

    borderTopLeftRadius (em 4)

    borderTopLeftRadius2 (em 4) (px 2)

-}
borderTopLeftRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderTopLeftRadius2 (Value valHorizontal) (Value valVertical) =
    appendProperty ("border-top-left-radius:" ++ valHorizontal ++ " " ++ valVertical)


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius) property.

    borderTopRightRadius (em 4)

    borderTopRightRadius2 (em 4) (px 2)

-}
borderTopRightRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderTopRightRadius (Value radius) =
    appendProperty ("border-top-right-radius:" ++ radius)


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius) property.

    borderTopRightRadius (em 4)

    borderTopRightRadius2 (em 4) (px 2)

-}
borderTopRightRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderTopRightRadius2 (Value valHorizontal) (Value valVertical) =
    appendProperty ("border-top-right-radius:" ++ valHorizontal ++ " " ++ valVertical)


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius) property.

    borderBottomRightRadius (em 4)

    borderBottomRightRadius2 (em 4) (px 2)

-}
borderBottomRightRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderBottomRightRadius (Value radius) =
    appendProperty ("border-bottom-right-radius:" ++ radius)


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius) property.

    borderBottomRightRadius (em 4)

    borderBottomRightRadius2 (em 4) (px 2)

-}
borderBottomRightRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderBottomRightRadius2 (Value valHorizontal) (Value valVertical) =
    appendProperty ("border-bottom-right-radius:" ++ valHorizontal ++ " " ++ valVertical)


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius) property.

    borderBottomLeftRadius (em 4)

    borderBottomLeftRadius2 (em 4) (px 2)

-}
borderBottomLeftRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderBottomLeftRadius (Value radius) =
    appendProperty ("border-bottom-left-radius:" ++ radius)


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius) property.

    borderBottomLeftRadius (em 4)

    borderBottomLeftRadius2 (em 4) (px 2)

-}
borderBottomLeftRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderBottomLeftRadius2 (Value valHorizontal) (Value valVertical) =
    appendProperty ("border-bottom-left-radius:" ++ valHorizontal ++ " " ++ valVertical)


{-| Sets [`border-start-start-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-start-start-radius) property.

    borderStartStartRadius (em 4)

    borderStartStartRadius2 (em 4) (px 2)

-}
borderStartStartRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderStartStartRadius (Value radius) =
    appendProperty ("border-start-start-radius:" ++ radius)


{-| Sets [`border-start-start-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-start-start-radius) property.

    borderStartStartRadius (em 4)

    borderStartStartRadius2 (em 4) (px 2)

-}
borderStartStartRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderStartStartRadius2 (Value horizontalValue) (Value verticalValue) =
    appendProperty ("border-start-start-radius:" ++ horizontalValue ++ " " ++ verticalValue)


{-| Sets [`border-start-end-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-start-end-radius) property.

    borderStartEndRadius (em 4)

    borderStartEndRadius2 (em 4) (px 2)

-}
borderStartEndRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderStartEndRadius (Value radius) =
    appendProperty ("border-start-end-radius:" ++ radius)


{-| Sets [`border-start-end-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-start-end-radius) property.

    borderStartEndRadius (em 4)

    borderStartEndRadius2 (em 4) (px 2)

-}
borderStartEndRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderStartEndRadius2 (Value horizontalValue) (Value verticalValue) =
    appendProperty ("border-start-end-radius:" ++ horizontalValue ++ " " ++ verticalValue)


{-| Sets [`border-end-start-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-end-start-radius) property.

    borderEndStartRadius (em 4)

    borderEndStartRadius2 (em 4) (px 2)

-}
borderEndStartRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderEndStartRadius (Value radius) =
    appendProperty ("border-end-start-radius:" ++ radius)


{-| Sets [`border-end-start-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-end-start-radius) property.

    borderEndStartRadius (em 4)

    borderEndStartRadius2 (em 4) (px 2)

-}
borderEndStartRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderEndStartRadius2 (Value horizontalValue) (Value verticalValue) =
    appendProperty ("border-end-start-radius:" ++ horizontalValue ++ " " ++ verticalValue)


{-| Sets [`border-end-end-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-end-end-radius) property.

    borderEndEndRadius (em 4)

    borderEndEndRadius2 (em 4) (px 2)

-}
borderEndEndRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderEndEndRadius (Value radius) =
    appendProperty ("border-end-end-radius:" ++ radius)


{-| Sets [`border-end-end-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-end-end-radius) property.

    borderEndEndRadius (em 4)

    borderEndEndRadius2 (em 4) (px 2)

-}
borderEndEndRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderEndEndRadius2 (Value horizontalValue) (Value verticalValue) =
    appendProperty ("border-end-end-radius:" ++ horizontalValue ++ " " ++ verticalValue)


{-| Sets [`border-image-outset`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageOutset (rem 1)

    borderImageOutset2 (num 1) (num 1.2)

    borderImageOutset3 (px 30) (num 2) (px 45)

    borderImageOutset4 (px 7) (px 12) (px 14) (px 5)

Specifies the distance by which an element's border image is set out from its border box. Supports values specified as length units or unitless numbers. Negative values are invalid.

-}
borderImageOutset :
    BaseValue
        (LengthSupported
            { num : Supported
            }
        )
    -> Style
borderImageOutset (Value widthVal) =
    appendProperty ("border-image-outset:" ++ widthVal)


{-| Sets [`border-image-outset`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageOutset (rem 1)

    borderImageOutset2 (num 1) (num 1.2)

    borderImageOutset3 (px 30) (num 2) (px 45)

    borderImageOutset4 (px 7) (px 12) (px 14) (px 5)

Specifies the distance by which an element's border image is set out from its border box. Supports values specified as length units or unitless numbers. Negative values are invalid.

-}
borderImageOutset2 :
    Value
        (LengthSupported
            { num : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
    -> Style
borderImageOutset2 (Value valueTopBottom) (Value valueRightLeft) =
    appendProperty ("border-image-outset:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`border-image-outset`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageOutset (rem 1)

    borderImageOutset2 (num 1) (num 1.2)

    borderImageOutset3 (px 30) (num 2) (px 45)

    borderImageOutset4 (px 7) (px 12) (px 14) (px 5)

Specifies the distance by which an element's border image is set out from its border box. Supports values specified as length units or unitless numbers. Negative values are invalid.

-}
borderImageOutset3 :
    Value
        (LengthSupported
            { num : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
    -> Style
borderImageOutset3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    appendProperty ("border-image-outset:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`border-image-outset`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageOutset (rem 1)

    borderImageOutset2 (num 1) (num 1.2)

    borderImageOutset3 (px 30) (num 2) (px 45)

    borderImageOutset4 (px 7) (px 12) (px 14) (px 5)

Specifies the distance by which an element's border image is set out from its border box. Supports values specified as length units or unitless numbers. Negative values are invalid.

-}
borderImageOutset4 :
    Value
        (LengthSupported
            { num : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
    -> Style
borderImageOutset4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    appendProperty ("border-image-outset:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`border-image-width`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageWidth (rem 1)

    borderImageWidth2 (num 1) (num 1.2)

    borderImageWidth3 (pct 5) (pct 15) (pct 10)

    borderImageWidth4 (px 7) (px 12) (px 14) (px 5)

Specifies the width of an element's border image. Supports values specified as length units, percentages, unitless numbers or auto. Negative values are invalid.

-}
borderImageWidth :
    BaseValue
        (LengthSupported
            { pct : Supported
            , num : Supported
            , auto : Supported
            }
        )
    -> Style
borderImageWidth (Value widthVal) =
    appendProperty ("border-image-width:" ++ widthVal)


{-| Sets [`border-image-width`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageWidth (rem 1)

    borderImageWidth2 (num 1) (num 1.2)

    borderImageWidth3 (pct 5) (pct 15) (pct 10)

    borderImageWidth4 (px 7) (px 12) (px 14) (px 5)

Specifies the width of an element's border image. Supports values specified as length units, percentages, unitless numbers or auto. Negative values are invalid.

-}
borderImageWidth2 :
    Value
        (LengthSupported
            { pct : Supported
            , num : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
    -> Style
borderImageWidth2 (Value valueTopBottom) (Value valueRightLeft) =
    appendProperty ("border-image-width:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`border-image-width`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageWidth (rem 1)

    borderImageWidth2 (num 1) (num 1.2)

    borderImageWidth3 (pct 5) (pct 15) (pct 10)

    borderImageWidth4 (px 7) (px 12) (px 14) (px 5)

Specifies the width of an element's border image. Supports values specified as length units, percentages, unitless numbers or auto. Negative values are invalid.

-}
borderImageWidth3 :
    Value
        (LengthSupported
            { pct : Supported
            , num : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
    -> Style
borderImageWidth3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    appendProperty ("border-image-width:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`border-image-width`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageWidth (rem 1)

    borderImageWidth2 (num 1) (num 1.2)

    borderImageWidth3 (pct 5) (pct 15) (pct 10)

    borderImageWidth4 (px 7) (px 12) (px 14) (px 5)

Specifies the width of an element's border image. Supports values specified as length units, percentages, unitless numbers or auto. Negative values are invalid.

-}
borderImageWidth4 :
    Value
        (LengthSupported
            { pct : Supported
            , num : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
    -> Style
borderImageWidth4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    appendProperty ("border-image-width:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------------- OUTLINE -------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`outline`](https://css-tricks.com/almanac/properties/o/outline/).

    outline zero

    outline none

-}
outline :
    BaseValue
        (LineWidthSupported
            (LineStyleSupported
                (ColorSupported
                    { auto : Supported
                    , invert_ : Supported
                    }
                )
            )
        )
    -> Style
outline (Value val) =
    appendProperty ("outline:" ++ val)


{-| Sets [`outline`](https://css-tricks.com/almanac/properties/o/outline/).

    outline3 (em 0.25) auto (rgb 120 250 32)

-}
outline3 :
    Value LineWidth
    -> Value (LineStyleSupported { auto : Supported })
    -> Value (ColorSupported { invert_ : Supported })
    -> Style
outline3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty
        ("outline:"
            ++ widthVal
            ++ " "
            ++ styleVal
            ++ " "
            ++ colorVal
        )


{-| Sets [`outline-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-width).

    outlineWidth (px 2)

    outlineWidth thin

-}
outlineWidth : BaseValue LineWidth -> Style
outlineWidth (Value val) =
    appendProperty ("outline-width:" ++ val)


{-| Sets [`outline-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-color).

    outlineColor (hex "eee")

    outlineColor invert_

-}
outlineColor : BaseValue (ColorSupported { invert_ : Supported }) -> Style
outlineColor (Value val) =
    appendProperty ("outline-color:" ++ val)


{-| The `invert` value used by properties such as [`outlineColor`](#outlineColor)

    outlineColor invert_

Note: This is called `invert_` instead of `invert` because [`invert`](#invert) is already used as a filter-function value.

-}
invert_ : Value { provides | invert_ : Supported }
invert_ =
    Value "invert"


{-| Sets [`outline-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-style).

    outlineStyle auto

    outlineStyle dashed

-}
outlineStyle : BaseValue (LineStyleSupported { auto : Supported }) -> Style
outlineStyle (Value val) =
    appendProperty ("outline-style:" ++ val)


{-| Sets [`outline-offset`](https://css-tricks.com/almanac/properties/o/outline-offset/).

    outlineOffset (px 2)

-}
outlineOffset : BaseValue Length -> Style
outlineOffset (Value val) =
    appendProperty ("outline-offset:" ++ val)



------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- OVERFLOW -------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------



{-| Sets [`overflow`](https://css-tricks.com/almanac/properties/o/overflow/).

    overflow visible

    overflow hidden

    overflow scroll

    overflow auto

    overflow2 visible hidden -- x: visible, y: hidden

-}
overflow :
    BaseValue
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        , clip : Supported
        }
    -> Style
overflow (Value val) =
    appendProperty ("overflow:" ++ val)


{-| Sets [`overflow`](https://css-tricks.com/almanac/properties/o/overflow/).

    overflow visible

    overflow hidden

    overflow scroll

    overflow auto

    overflow2 visible hidden -- x: visible, y: hidden

-}
overflow2 :
    Value
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        , clip : Supported
        }
    -> Value
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        , clip : Supported
        }
    -> Style
overflow2 (Value val1) (Value val2) =
    appendProperty <| "overflow:" ++ val1 ++ " " ++ val2


{-| Sets [`overflow-x`](https://css-tricks.com/almanac/properties/o/overflow/).

    overflowX visible

    overflowX hidden

    overflowX scroll

    overflowX auto

-}
overflowX :
    BaseValue
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        , clip : Supported
        }
    -> Style
overflowX (Value val) =
    appendProperty ("overflow-x:" ++ val)


{-| Sets [`overflow-y`](https://css-tricks.com/almanac/properties/o/overflow/).

    overflowY visible

    overflowY hidden

    overflowY scroll

    overflowY auto

-}
overflowY :
    BaseValue
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        , clip : Supported
        }
    -> Style
overflowY (Value val) =
    appendProperty ("overflow-y:" ++ val)


{-| Sets [`overflow-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-block).

    overflowBlock visible

    overflowBlock hidden

    overflowBlock scroll

    overflowBlock auto

-}
overflowBlock :
    BaseValue
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        }
    -> Style
overflowBlock (Value val) =
    appendProperty ("overflow-block:" ++ val)


{-| Sets [`overflow-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-inline).

    overflowInline visible

    overflowInline hidden

    overflowInline scroll

    overflowInline auto

-}
overflowInline :
    BaseValue
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        }
    -> Style
overflowInline (Value val) =
    appendProperty ("overflow-inline:" ++ val)


{-| Sets [`overflow-wrap`](https://css-tricks.com/almanac/properties/o/overflow-wrap/)

    overflowWrap breakWord

    overflowWrap normal

-}
overflowWrap :
    BaseValue
        { anywhere : Supported
        , breakWord : Supported
        , normal : Supported
        }
    -> Style
overflowWrap (Value val) =
    appendProperty ("overflow-wrap:" ++ val)


{-| Sets [`overflow-anchor`](https://css-tricks.com/almanac/properties/o/overflow-anchor/)

    overflowAnchor auto

    overflowAnchor none

-}
overflowAnchor :
    BaseValue
        { auto : Supported
        , none : Supported
        }
    -> Style
overflowAnchor (Value val) =
    appendProperty ("overflow-anchor:" ++ val)


{-| The `break-word` value, which can be used with such properties as
[`overflow-wrap`](https://css-tricks.com/almanac/properties/o/overflow-wrap/)
and [`word-break`](https://css-tricks.com/almanac/properties/w/word-break/).

    overflowWrap breakWord

    wordBreak breakWord

-}
breakWord : Value { provides | breakWord : Supported }
breakWord =
    Value "break-word"


{-| The `anywhere` value used by [`overflowWrap`](#overflowWrap) and [`lineBreak`](#lineBreak).

    overflowWrap anywhere

    lineBreak anywhere

-}
anywhere : Value { provides | anywhere : Supported }
anywhere =
    Value "anywhere"


{-| The [`resize`](https://css-tricks.com/almanac/properties/r/resize/) property.

    resize none

    resize both

    resize inline

-}
resize :
    BaseValue
        { none : Supported
        , both : Supported
        , horizontal : Supported
        , vertical : Supported
        , block : Supported
        , inline : Supported
        }
    -> Style
resize (Value value) =
    appendProperty ("resize:" ++ value)


{-| The `horizontal` value used by [`resize`](#resize).

    resize horizontal

-}
horizontal : Value { provides | horizontal : Supported }
horizontal =
    Value "horizontal"


{-| The `vertical` value used by [`resize`](#resize).

    resize vertical

-}
vertical : Value { provides | vertical : Supported }
vertical =
    Value "vertical"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------------------- FLEX ---------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`flex`](https://css-tricks.com/almanac/properties/f/flex/) shorthand property.

    flex none

    flex auto

    flex (num 1)

-}
flex :
    BaseValue
        (WidthSupported
            { none : Supported
            , content : Supported
            , num : Supported
            }
        )
    -> Style
flex (Value growOrBasis) =
    appendProperty ("flex:" ++ growOrBasis)


{-| The [`flex`](https://css-tricks.com/almanac/properties/f/flex/) shorthand property.

    flex2 zero auto

-}
flex2 :
    Value
        { num : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            (WidthSupported
                { content : Supported
                , num : Supported
                }
            )
    -> Style
flex2 (Value grow) (Value shrinkOrBasis) =
    appendProperty ("flex:" ++ grow ++ " " ++ shrinkOrBasis)


{-| The [`flex`](https://css-tricks.com/almanac/properties/f/flex/) shorthand property.

    flex3 (num 1) zero (pct 50)

-}
flex3 :
    Value
        { num : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { num : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Value (WidthSupported { content : Supported })
    -> Style
flex3 (Value grow) (Value shrink) (Value basis) =
    appendProperty ("flex:" ++ grow ++ " " ++ shrink ++ " " ++ basis)


{-| Sets [`flex-basis`](https://css-tricks.com/almanac/properties/f/flex-basis/).

    flexBasis (em 10)

    flexBasis (px 3)

    flexBasis (pct 100)

    flexBasis auto

-}
flexBasis : BaseValue (WidthSupported { content : Supported }) -> Style
flexBasis (Value val) =
    appendProperty ("flex-basis:" ++ val)


{-| Sets [`flex-grow`](https://css-tricks.com/almanac/properties/f/flex-grow/).

    flexGrow (num 3)

    flexGrow (num 0.6)

-}
flexGrow :
    BaseValue
        { num : Supported
        , zero : Supported
        , calc : Supported
        }
    -> Style
flexGrow (Value val) =
    appendProperty ("flex-grow:" ++ val)


{-| Sets [`flex-shrink`](https://css-tricks.com/almanac/properties/f/flex-shrink/).

    flexShrink (num 2)

    flexShrink (num 0.6)

-}
flexShrink :
    BaseValue
        { num : Supported
        , zero : Supported
        , calc : Supported
        }
    -> Style
flexShrink (Value val) =
    appendProperty ("flex-shrink:" ++ val)


{-| Sets [`flex-direction`](https://css-tricks.com/almanac/properties/f/flex-direction/).

    flexDirection column

-}
flexDirection :
    BaseValue
        { row : Supported
        , rowReverse : Supported
        , column : Supported
        , columnReverse : Supported
        }
    -> Style
flexDirection (Value val) =
    appendProperty ("flex-direction:" ++ val)


{-| Sets [`flex-wrap`](https://css-tricks.com/almanac/properties/f/flex-wrap/).

    flexWrap wrap

    flexWrap wrapReverse

    flexWrap nowrap

-}
flexWrap :
    BaseValue
        { nowrap : Supported
        , wrap : Supported
        , wrapReverse : Supported
        }
    -> Style
flexWrap (Value val) =
    appendProperty ("flex-wrap:" ++ val)


{-| The [`flex-flow`](https://css-tricks.com/almanac/properties/f/flex-flow/) shorthand property.

    flexFlow rowReverse

    flexFlow wrap

    flexFlow inherit

    flexFlow2 column wrapReverse

-}
flexFlow :
    BaseValue
        { row : Supported
        , rowReverse : Supported
        , column : Supported
        , columnReverse : Supported
        , nowrap : Supported
        , wrap : Supported
        , wrapReverse : Supported
        }
    -> Style
flexFlow (Value directionOrWrapping) =
    appendProperty ("flex-flow:" ++ directionOrWrapping)


{-| The [`flex-flow`](https://css-tricks.com/almanac/properties/f/flex-flow/) shorthand property.

    flexFlow rowReverse

    flexFlow wrap

    flexFlow inherit

    flexFlow2 column wrapReverse

-}
flexFlow2 :
    Value
        { row : Supported
        , rowReverse : Supported
        , column : Supported
        , columnReverse : Supported
        }
    ->
        Value
            { nowrap : Supported
            , wrap : Supported
            , wrapReverse : Supported
            }
    -> Style
flexFlow2 (Value direction_) (Value wrapping) =
    appendProperty ("flex-flow:" ++ direction_ ++ " " ++ wrapping)


{-| Sets [`align-content`](https://css-tricks.com/almanac/properties/a/align-content/).

    alignContent flexStart

**Note:** This property has no effect when the flexbox has only a single line.

-}
alignContent :
    BaseValue
        { normal : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , spaceBetween : Supported
        , spaceAround : Supported
        , spaceEvenly : Supported
        , stretch : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        }
    -> Style
alignContent (Value val) =
    appendProperty ("align-content:" ++ val)


{-| Sets [`align-content`](https://css-tricks.com/almanac/properties/a/align-content/).

    alignContent2 unsafe start

**Note:** This property has no effect when the flexbox has only a single line.

-}
alignContent2 :
    Value
        { safe : Supported
        , unsafe : Supported
        }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            }
    -> Style
alignContent2 (Value overflowPosition) (Value contentPosition) =
    appendProperty ("align-content:" ++ overflowPosition ++ " " ++ contentPosition)


{-| Sets [`align-items`](https://css-tricks.com/almanac/properties/a/align-items/).

    alignItems firstBaseline

-}
alignItems :
    BaseValue
        { normal : Supported
        , stretch : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        }
    -> Style
alignItems (Value val) =
    appendProperty ("align-items:" ++ val)


{-| Sets [`align-items`](https://css-tricks.com/almanac/properties/a/align-items/).

    alignItems2 unsafe selfStart

-}
alignItems2 :
    Value
        { safe : Supported
        , unsafe : Supported
        }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            }
    -> Style
alignItems2 (Value overflowPosition) (Value selfPosition) =
    appendProperty ("align-items:" ++ overflowPosition ++ " " ++ selfPosition)


{-| Sets [`align-self`](https://css-tricks.com/almanac/properties/a/align-self/).

    alignSelf firstBaseline

-}
alignSelf :
    BaseValue
        { auto : Supported
        , normal : Supported
        , stretch : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        }
    -> Style
alignSelf (Value val) =
    appendProperty ("align-self:" ++ val)


{-| Sets [`align-self`](https://css-tricks.com/almanac/properties/a/align-self/).

    alignSelf2 unsafe flexStart

-}
alignSelf2 :
    Value
        { safe : Supported
        , unsafe : Supported
        }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            }
    -> Style
alignSelf2 (Value overflowPosition) (Value selfPosition) =
    appendProperty ("align-self:" ++ overflowPosition ++ " " ++ selfPosition)


{-| Sets [`justify-content`](https://css-tricks.com/almanac/properties/j/justify-content/).

    justifyContent flexStart

-}
justifyContent :
    BaseValue
        { normal : Supported
        , spaceBetween : Supported
        , spaceAround : Supported
        , spaceEvenly : Supported
        , stretch : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , left_ : Supported
        , right_ : Supported
        }
    -> Style
justifyContent (Value val) =
    appendProperty ("justify-content:" ++ val)


{-| Sets [`justify-content`](https://css-tricks.com/almanac/properties/j/justify-content/).

    justifyContent2 safe flexStart

-}
justifyContent2 :
    Value
        { safe : Supported
        , unsafe : Supported
        }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , left_ : Supported
            , right_ : Supported
            }
    -> Style
justifyContent2 (Value overflowPosition) (Value contentPosition) =
    appendProperty ("justify-content:" ++ overflowPosition ++ " " ++ contentPosition)


{-| The [`justify-items`](https://css-tricks.com/almanac/properties/j/justify-items/) property.

    justifyItems center

Note: This property is ignored when used in flexbox or table cell layouts.
-}
justifyItems :
    BaseValue
        { normal : Supported
        , stretch : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        , left_ : Supported
        , right_ : Supported
        , legacy : Supported
        , legacyLeft : Supported
        , legacyRight : Supported
        , legacyCenter : Supported
        }
    -> Style
justifyItems (Value val) =
    appendProperty ("justify-items:" ++ val)


{-| The [`justify-items`](https://css-tricks.com/almanac/properties/j/justify-items/) property.

    justifyItems2 unsafe right_

Note: This property is ignored when used in flexbox or table cell layouts.
-}
justifyItems2 :
    Value
        { safe : Supported
        , unsafe : Supported
        }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            , left_ : Supported
            , right_ : Supported
            }
    -> Style
justifyItems2 (Value overflowPosition) (Value selfPosition) =
    appendProperty ("justify-items:" ++ overflowPosition ++ " " ++ selfPosition)


{-| The [`justify-self`](https://css-tricks.com/almanac/properties/j/justify-self/) property.

    jusitfySelf left_

Note: This property is ignored when used in flexbox or table cell layouts.
-}
justifySelf :
    BaseValue
        { auto : Supported
        , normal : Supported
        , stretch : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        , left_ : Supported
        , right_ : Supported
        }
    -> Style
justifySelf (Value val) =
    appendProperty ("justify-self:" ++ val)


{-| The [`justify-self`](https://css-tricks.com/almanac/properties/j/justify-self/) property.

    justifySelf2 unsafe left_

Note: This property is ignored when used in flexbox or table cell layouts.

-}
justifySelf2 :
    Value { safe : Supported, unsafe : Supported }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            , left_ : Supported
            , right_ : Supported
            }
    -> Style
justifySelf2 (Value overflowPosition) (Value contentPosition) =
    appendProperty ("justify-self:" ++ overflowPosition ++ " " ++ contentPosition)


{-| The [`place-content`](https://css-tricks.com/almanac/properties/p/place-content) property.

`placeContent` is a shorthand for the [`alignContent`](#alignContent) and
[`justifyContent`](#justifyContent) properties in a single declaration.

This one-argument version only accepts global values.

    placeContent inherit

    placeContent2 flexStart flexEnd

-}
placeContent :
    BaseValue {}
    -> Style
placeContent (Value value) =
    appendProperty ("place-content:" ++ value)


{-| The [`place-content`](https://css-tricks.com/almanac/properties/p/place-content) property.

`placeContent` is a shorthand for the [`alignContent`](#alignContent) and
[`justifyContent`](#justifyContent) properties in a single declaration.

This two-argumant version accepts `alignContent` and `justifyContent` values.

    placeContent inherit

    placeContent2 flexStart flexEnd

-}
placeContent2 :
    Value
        { normal : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , spaceBetween : Supported
        , spaceAround : Supported
        , spaceEvenly : Supported
        , stretch : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        }
    ->
        Value
            { normal : Supported
            , spaceBetween : Supported
            , spaceAround : Supported
            , spaceEvenly : Supported
            , stretch : Supported
            , center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , left_ : Supported
            , right_ : Supported
            }
    -> Style
placeContent2 (Value alignContentValue) (Value justifyContentValue) =
    appendProperty ("place-content:" ++ alignContentValue ++ " " ++ justifyContentValue)


{-| The [`place-items`](https://css-tricks.com/almanac/properties/p/place-items) property.

`placeItems` is a shorthand for the [`alignItems`](#alignItems) and
[`justifyItems`](#justifyItems) properties in a single declaration.

This one-argument version only accepts global values.

    placeItems inherit

    placeItems2 center selfEnd

-}
placeItems :
    BaseValue
        { center : Supported
        }
    -> Style
placeItems (Value value) =
    appendProperty ("place-items:" ++ value)


{-| The [`place-items`](https://css-tricks.com/almanac/properties/p/place-items) property.

`placeItems` is a shorthand for the [`alignItems`](#alignItems) and
[`justifyItems`](#justifyItems) properties in a single declaration.

This one-argument version only accepts global values.

    placeItems inherit

    placeItems2 center selfEnd

-}
placeItems2 :
    Value
        { normal : Supported
        , stretch : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        }
    ->
        Value
            { normal : Supported
            , stretch : Supported
            , baseline : Supported
            , firstBaseline : Supported
            , lastBaseline : Supported
            , center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            , left_ : Supported
            , right_ : Supported
            , legacy : Supported
            , legacyLeft : Supported
            , legacyRight : Supported
            , legacyCenter : Supported
            }
    -> Style
placeItems2 (Value alignItemsValue) (Value justifyItemsValue) =
    appendProperty ("place-items:" ++ alignItemsValue ++ " " ++ justifyItemsValue)


{-| The [`place-self`](https://css-tricks.com/almanac/properties/p/place-self) property.

`placeSelf` is a shorthand for the [`alignSelf`](#alignSelf) and
[`justifySelf`](#justifySelf) properties in a single declaration.

This one-argument version only accepts global values.

    placeSelf inherit

    placeSelf2 flexStart flexEnd

-}
placeSelf :
    BaseValue {}
    -> Style
placeSelf (Value value) =
    appendProperty ("place-self:" ++ value)


{-| The [`place-self`](https://css-tricks.com/almanac/properties/p/place-self) property.

`placeSelf` is a shorthand for the [`alignSelf`](#alignSelf) and
[`justifySelf`](#justifySelf) properties in a single declaration.

This one-argument version only accepts global values.

    placeSelf inherit

    placeSelf2 flexStart flexEnd

-}
placeSelf2 :
    Value
        { auto : Supported
        , normal : Supported
        , stretch : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        }
    ->
        Value
            { auto : Supported
            , normal : Supported
            , stretch : Supported
            , baseline : Supported
            , firstBaseline : Supported
            , lastBaseline : Supported
            , center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            , left_ : Supported
            , right_ : Supported
            }
    -> Style
placeSelf2 (Value alignSelfValue) (Value justifySelfValue) =
    appendProperty ("place-self:" ++ alignSelfValue ++ " " ++ justifySelfValue)


{-| Sets [`order`](https://css-tricks.com/almanac/properties/o/order/)

    order (num 2)

    order (num -2)

-}
order :
    BaseValue
        { int : Supported
        , zero : Supported
        }
    -> Style
order (Value val) =
    appendProperty ("order:" ++ val)


{-| The `row` [`flex-direction` value](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction#Values).

    flexDirection row

-}
row : Value { provides | row : Supported }
row =
    Value "row"


{-| The `row-reverse` [`flex-direction` value](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction#Values).

    flexDirection rowReverse

-}
rowReverse : Value { provides | rowReverse : Supported }
rowReverse =
    Value "row-reverse"


{-| The `column-reverse` [`flex-direction` value](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction#Values).

    flexDirection columnReverse

-}
columnReverse : Value { provides | columnReverse : Supported }
columnReverse =
    Value "column-reverse"


{-| The `flex-start` value used by [`alignItems`](#alignItems),
[`justifyContent`](#justifyContent),
and [`alignContent`](#alignContent).

    alignItems flexStart

    justifyContent flexStart

    alignContent flexStart

-}
flexStart : Value { provides | flexStart : Supported }
flexStart =
    Value "flex-start"


{-| The `flex-end` value used by [`alignItems`](#alignItems),
[`justifyContent`](#justifyContent),
and [`alignContent`](#alignContent).

    alignItems flexEnd

    justifyContent flexEnd

    alignContent flexEnd

-}
flexEnd : Value { provides | flexEnd : Supported }
flexEnd =
    Value "flex-end"


{-| -}
selfStart : Value { provides | selfStart : Supported }
selfStart =
    Value "self-start"


{-| -}
selfEnd : Value { provides | selfEnd : Supported }
selfEnd =
    Value "self-end"


{-| The `space-between` value used by [`justifyContent`](#justifyContent)
and [`alignContent`](#alignContent).

    justifyContent spaceBetween

    alignContent spaceBetween

-}
spaceBetween : Value { provides | spaceBetween : Supported }
spaceBetween =
    Value "space-between"


{-| The `space-around` value used by [`justifyContent`](#justifyContent)
and [`alignContent`](#alignContent).

    justifyContent spaceAround

    alignContent spaceAround

-}
spaceAround : Value { provides | spaceAround : Supported }
spaceAround =
    Value "space-around"


{-| Distribute items evenly, with an equal size space between each element and
the start and end.

    justifyContent spaceEvenly

-}
spaceEvenly : Value { provides | spaceEvenly : Supported }
spaceEvenly =
    Value "space-evenly"


{-| The `first baseline` value used for properties such as [`alignContent`](#alignContent),
[`alignItems`](#alignItems),
and [`alignSelf`](#alignSelf).

    alignItems firstBaseline

-}
firstBaseline : Value { provides | firstBaseline : Supported }
firstBaseline =
    Value "first baseline"


{-| The `last baseline` value used for properties such as [`alignContent`](#alignContent),
[`alignItems`](#alignItems),
and [`alignSelf`](#alignSelf).

    alignItems lastBaseline

-}
lastBaseline : Value { provides | lastBaseline : Supported }
lastBaseline =
    Value "last baseline"


{-| The `safe` value used for properties such as [`alignContent2`](#alignContent2).

    alignContent2 safe center

-}
safe : Value { provides | safe : Supported }
safe =
    Value "safe"


{-| The `unsafe` value used for properties such as [`alignContent2`](#alignContent2).

    alignContent2 unsafe center

-}
unsafe : Value { provides | unsafe : Supported }
unsafe =
    Value "unsafe"


{-| The `legacy` value used for properties such as [`justifyItems`](#justifyItems).

    justifyItems legacy

-}
legacy : Value { provides | legacy : Supported }
legacy =
    Value "legacy"


{-| The `legacy left` value used for properties such as [`justifyItems`](#justifyItems).

    justifyItems legacyLeft

-}
legacyLeft : Value { provides | legacyLeft : Supported }
legacyLeft =
    Value "legacy left"


{-| The `legacy right` value used for properties such as [`justifyItems`](#justifyItems).

    justifyItems legacyRight

-}
legacyRight : Value { provides | legacyRight : Supported }
legacyRight =
    Value "legacy right"


{-| The `legacy center` value used for properties such as [`justifyItems`](#justifyItems).

    justifyItems legacyCenter

-}
legacyCenter : Value { provides | legacyCenter : Supported }
legacyCenter =
    Value "legacy center"


{-| The `wrap` [`flex-wrap` value](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap#Values).

    flexWrap wrap

-}
wrap : Value { provides | wrap : Supported }
wrap =
    Value "wrap"


{-| The `wrap-reverse` [`flex-wrap` value](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap#Values).

    flexWrap wrapReverse

-}
wrapReverse : Value { provides | wrapReverse : Supported }
wrapReverse =
    Value "wrap-reverse"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------------------- GRID ---------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Extensible type representing the possibilities of the
`<fixed-size>` type used in grids.
-}
type alias FixedSizeSupported supported =
    TrackBreadthSupported (
        { supported
            | minmax : Supported
            , fitContent : Supported
        }
    )


{-| Extensible type representing the possibilities of the 
`<track-breadth>` type used in grids.
-}
type alias TrackBreadthSupported supported =
    LengthSupported (
        { supported
            | pct : Supported
            , fr : Supported
            , auto : Supported
            , minContent : Supported
            , maxContent : Supported
        }
    )


{-| Extensible type representing the possibilities of the 
`<track-size>` type used in grids.
-}
type alias TrackSizeSupported supported =
    TrackBreadthSupported (
        { supported
            | minmax : Supported
            , fitContentTo : Supported
        }
    )


{-| Type representing the possibilities of the 
`<track-size>` type used in grids.
-}
type alias TrackSize =
    TrackSizeSupported {}


{-| Custom ident(s) that are only used in grid area definitions,
for naming lines of a grid layout. A line may have multiple names.

Line names are case sensitive.

    gridTemplateColumnsList
        [ lineNames["line1", "line2"]
        , px 300
        , lineNames["line3"]
        ]

    --- grid-template-colums: [line1 line2] 300px [line3];
-}
lineNames : List String -> Value { provides | lineNames : Supported }
lineNames list =
    Value <| "[" ++ String.join " " list ++ "]"















{-| The 1-argument version of the [`grid-auto-rows`](https://css-tricks.com/almanac/properties/g/grid-auto-rows/)
 property.

    gridAutoRows (px 100)

    gridAutoRows (vmax 30)

    gridAutoRows (fr 1)

    gridAutoRows (minmax (fr 2) (pct 20))
-}
gridAutoRows :
    BaseValue ( TrackSize )
    -> Style
gridAutoRows (Value val) =
    appendProperty ("grid-auto-rows:" ++ val)


{-| The many-argument version of the [`grid-auto-rows`](https://css-tricks.com/almanac/properties/g/grid-auto-rows/)
property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    gridAutoRows (px 100)

    gridAutoRows (vmax 30)

    gridAutoRows (fr 1)

    gridAutoRows (minmax (fr 2) (pct 20))

    gridAutoRowsMany [ fr 1, px 100, minmax (fr 2) (pct 20) ]

    gridAutoRowsMany [] -- unset

-}
gridAutoRowsMany :
    List ( Value TrackSize )
    -> Style
gridAutoRowsMany values =
    appendProperty <| "grid-auto-rows:" ++ valueListToString " " values


{-| The 1-argument version of the [`grid-auto-columns`](https://css-tricks.com/almanac/properties/g/grid-auto-columns/)
property.

    gridAutoColumns (px 100)

    gridAutoColumns (vmax 30)

    gridAutoColumns (fr 1)

    gridAutoColumns (minmax (fr 2) (pct 20))

    gridAutoColumnsMany [ fr 1, px 100, minmax (fr 2) (pct 20) ]

    gridAutoColumnsMany [] -- unset
-}
gridAutoColumns :
    BaseValue ( TrackSize )
    -> Style
gridAutoColumns (Value val) =
    appendProperty ("grid-auto-columns:" ++ val)


{-| The many-argument version of the [`grid-auto-columns`](https://css-tricks.com/almanac/properties/g/grid-auto-columns/)
property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    gridAutoColumns (px 100)

    gridAutoColumns (vmax 30)

    gridAutoColumns (fr 1)

    gridAutoColumns (minmax (fr 2) (pct 20))

    gridAutoColumnsMany [ fr 1, px 100, minmax (fr 2) (pct 20) ]

    gridAutoColumnsMany [] -- unset

-}
gridAutoColumnsMany :
    List ( Value TrackSize )
    -> Style
gridAutoColumnsMany values =
    appendProperty <| "grid-auto-columns:" ++ valueListToString " " values


{-| The 1-argument version of the [`grid-auto-flow`](https://css-tricks.com/almanac/properties/g/grid-auto-flow/)
property.

    gridAutoFlow dense
    
    gridAutoFlow column

    gridAutoFlow2 row dense
-}
gridAutoFlow :
    BaseValue (
        { row : Supported
        , column : Supported
        , dense : Supported
        }
    )
    -> Style
gridAutoFlow (Value val) =
    appendProperty ("grid-auto-flow:" ++ val)


{-| The 1-argument version of the [`grid-auto-flow`](https://css-tricks.com/almanac/properties/g/grid-auto-flow/)
property.

    gridAutoFlow2 row dense

(The last argument can only be `dense` but I thought this
would be the most natural way to make it fit into Elm,
even if it's a bit redundant.)
-}
gridAutoFlow2 :
    Value
        { row : Supported
        , column : Supported
        }
    -> Value { dense : Supported }
    -> Style
gridAutoFlow2 (Value val1) (Value val2) =
    appendProperty <|
        "grid-auto-flow:"
        ++ val1
        ++ " "
        ++ val2




-------------------------------------------------------------------
------------------------ Grid Lines -------------------------------
-------------------------------------------------------------------


{-| A type encapsulating the possibilities for defining a `<grid-line>`,
which are the lines around the spaces in a CSS grid.
-}
type alias GridLine =
    { auto : Supported
    , num : Supported
    , gridLineIdent : Supported
    , gridLineSpanNum : Supported
    , gridLineSpanIdent : Supported
    }


{-| Creates a grid line value with a <custom-ident> value
and an optional integer.

    gridLineIdent "footer" Nothing -- footer

    gridLineIdent "header" (Just 1) -- header 1

    gridLineSpanNum 4 -- span 4

    gridLineSpanIdent "header" Nothing -- span header

    gridLineSpanIdent "footer" (Just 1) -- span header 1

-}
gridLineIdent :
    String
    -> Maybe Int
    -> Value { provides | gridLineIdent : Supported }
gridLineIdent val1 val2 =
    let
        val2Str =
            case val2 of
                Just val -> " " ++ String.fromInt val
                Nothing -> ""

    in
    Value <| val1 ++ val2Str


{-| Creates a grid line value with a 'span' keyword value followed by
an integer.

    gridLineIdent "footer" Nothing -- footer

    gridLineIdent "header" (Just 1) -- header 1

    gridLineSpanNum 4 -- span 4

    gridLineSpanIdent "header" Nothing -- span header

    gridLineSpanIdent "footer" (Just 1) -- span header 1
    
-}
gridLineSpanNum :
    Int
    -> Value { provides | gridLineSpanNum : Supported }
gridLineSpanNum val =
    Value <| "span " ++ String.fromInt val



{-| Creates a grid line value with a 'span' keyword value followed by
an ident and an optional integer.

    gridLineIdent "footer" Nothing -- footer

    gridLineIdent "header" (Just 1) -- header 1

    gridLineSpanNum 4 -- span 4

    gridLineSpanIdent "header" Nothing -- span header

    gridLineSpanIdent "footer" (Just 1) -- span header 1

-}
gridLineSpanIdent :
    String
    -> Maybe Int
    -> Value { provides | gridLineSpanIdent : Supported }
gridLineSpanIdent val1 val2 =
    Value <| "span " ++
        val1
        ++ ( case val2 of
            Just v -> " " ++ String.fromInt v
            Nothing -> ""
        )
        

{-| The [`grid-area`](https://css-tricks.com/almanac/properties/g/grid-area/)
property.

This variant is for keywords or for 1 `<grid-line>` ([`GridLine`](#GridLine)) that determines
the start and end positions of this grid item.

Numbers used in this should not be zero, else they won't work.

    gridArea auto

    gridArea inherit

    gridArea <| gridLineSpanNum 4
      
    gridArea <| gridLineIdent "big-grid" (Just 4)

    gridArea2
        ( gridLineIdent "big-grid" (Just 4) )
        ( gridLineSpanIdent "other-grid" Nothing )

    gridArea3
        ( gridLineIdent "big-grid" (Just 4))
        ( gridLineSpanIdent "other-grid" Nothing)
        ( num 7 )

    gridArea4
        ( gridLineIdent "big-grid" (Just 4) )
        ( gridLineSpanIdent "other-grid" Nothing )
        ( num 7 )
        ( gridLineSpanIdent "another-grid" (Just 12) )

-}
gridArea :
    BaseValue ( GridLine )
    -> Style
gridArea (Value val) =
    appendProperty <| "grid-area:" ++ val


{-| The [`grid-area`](https://css-tricks.com/almanac/properties/g/grid-area/)
property.

This variant specifies 2 `<grid-line>`s ([`GridLine`](#GridLine)) that determines
the start and end positions of this grid item.

Numbers used in this should not be zero, else they won't work.

    gridArea auto

    gridArea inherit

    gridArea <| gridLineSpanNum 4
      
    gridArea <| gridLineIdent "big-grid" (Just 4)

    gridArea2
        ( gridLineIdent "big-grid" (Just 4) )
        ( gridLineSpanIdent "other-grid" Nothing )

    gridArea3
        ( gridLineIdent "big-grid" (Just 4))
        ( gridLineSpanIdent "other-grid" Nothing)
        ( num 7 )

    gridArea4
        ( gridLineIdent "big-grid" (Just 4) )
        ( gridLineSpanIdent "other-grid" Nothing )
        ( num 7 )
        ( gridLineSpanIdent "another-grid" (Just 12) )

-}
gridArea2 :
    Value ( GridLine )
    -> Value ( GridLine )
    -> Style
gridArea2 (Value gl1) (Value gl2) =
    appendProperty <| "grid-area:" ++ gl1 ++ "/" ++ gl2


{-| The [`grid-area`](https://css-tricks.com/almanac/properties/g/grid-area/)
property.

This variant specifies 3 `<grid-line>`s ([`GridLine`](#GridLine)) that determines
the start and end positions of this grid item.

Numbers used in this should not be zero, else they won't work.

    gridArea auto

    gridArea inherit

    gridArea <| gridLineSpanNum 4
      
    gridArea <| gridLineIdent "big-grid" (Just 4)

    gridArea2
        ( gridLineIdent "big-grid" (Just 4) )
        ( gridLineSpanIdent "other-grid" Nothing )

    gridArea3
        ( gridLineIdent "big-grid" (Just 4))
        ( gridLineSpanIdent "other-grid" Nothing)
        ( num 7 )

    gridArea4
        ( gridLineIdent "big-grid" (Just 4) )
        ( gridLineSpanIdent "other-grid" Nothing )
        ( num 7 )
        ( gridLineSpanIdent "another-grid" (Just 12) )

-}
gridArea3 :
    Value ( GridLine )
    -> Value ( GridLine )
    -> Value ( GridLine )
    -> Style
gridArea3 (Value gl1) (Value gl2) (Value gl3) =
    appendProperty <| "grid-area:" ++ gl1 ++ "/" ++ gl2 ++ "/" ++ gl3


{-| The [`grid-area`](https://css-tricks.com/almanac/properties/g/grid-area/)
property.

This variant specifies 4 `<grid-line>`s ([`GridLine`](#GridLine)) that determines
the start and end positions of this grid item.

Numbers used in this should not be zero, else they won't work.

    gridArea auto

    gridArea inherit

    gridArea <| gridLineSpanNum 4
      
    gridArea <| gridLineIdent "big-grid" (Just 4)

    gridArea2
        ( gridLineIdent "big-grid" (Just 4) )
        ( gridLineSpanIdent "other-grid" Nothing )

    gridArea3
        ( gridLineIdent "big-grid" (Just 4))
        ( gridLineSpanIdent "other-grid" Nothing)
        ( num 7 )

    gridArea4
        ( gridLineIdent "big-grid" (Just 4) )
        ( gridLineSpanIdent "other-grid" Nothing )
        ( num 7 )
        ( gridLineSpanIdent "another-grid" (Just 12) )

-}
gridArea4 :
    Value ( GridLine )
    -> Value ( GridLine )
    -> Value ( GridLine )
    -> Value ( GridLine )
    -> Style
gridArea4 (Value gl1) (Value gl2) (Value gl3) (Value gl4) =
    appendProperty <| "grid-area:" ++ gl1 ++ "/" ++ gl2 ++ "/" ++ gl3 ++ "/" ++ gl4


{-| The [`grid-row`](https://css-tricks.com/almanac/properties/g/grid-row/)
property.

This variant is for single keyword arguments and
specifying 1 `<grid-line>` ([`GridLine`](#GridLine)), which determines
the start and end position of this grid item.

Numbers used in this should not be zero, else they won't work.

    gridRow auto

    gridRow inherit

    gridRow <| gridLineIdent "main-grid" (Just 3)
    -- grid-row: main-grid 3

    gridRow2 auto ( gridLineSpanIdent "grid-thing" (Just 5) )
    -- grid-row: auto / span grid-thing 5
-}
gridRow :
    BaseValue (GridLine)
    -> Style
gridRow (Value val) =
    appendProperty <| "grid-row:" ++ val


{-| The [`grid-row`](https://css-tricks.com/almanac/properties/g/grid-row/)
property.

This variant specifies 2 `<grid-line>`s ([`GridLine`](#GridLine)) that determine
the start and end position of this grid item.

Numbers used in this should not be zero, else they won't work.

    gridRow auto

    gridRow inherit

    gridRow <| gridLineIdent "main-grid" (Just 3)
    -- grid-row: main-grid 3

    gridRow2 auto ( gridLineSpanIdent "grid-thing" (Just 5) )
    -- grid-row: auto / span grid-thing 5
-}
gridRow2 :
    Value ( GridLine )
    -> Value ( GridLine )
    -> Style
gridRow2 (Value gl1) (Value gl2) =
    appendProperty <| "grid-row:" ++ gl1 ++ "/" ++ gl2


{-| The 1-argument version of the [`grid-row-start`](https://css-tricks.com/almanac/properties/g/grid-row-start/)
property.

    gridRowStart inherit

    gridRowStart auto

    gridRowStart <| gridLineSpanIdent "big-grid" Nothing

    gridRowStart <| int 3

    gridRowStart <| gridLineIdent "big-grid" (Just 2)
-}
gridRowStart :
    BaseValue ( GridLine )
    -> Style
gridRowStart (Value val) =
    appendProperty ("grid-row-start:" ++ val)



{-| The 1-argument version of the [`grid-row-end`](https://css-tricks.com/almanac/properties/g/grid-row-end/)
property.

    gridRowEnd inherit

    gridRowEnd auto

    gridRowEnd <| gridLineSpanIdent "big-grid" Nothing

    gridRowEnd <| int 3

    gridRowEnd <| gridLineIdent "big-grid" (Just 2)
-}
gridRowEnd :
    BaseValue ( GridLine )
    -> Style
gridRowEnd (Value val) =
    appendProperty ("grid-row-end:" ++ val)


{-| The [`grid-column`](https://css-tricks.com/almanac/properties/g/grid-column/)
property.

This variant is for single keyword arguments and
specifying 1 `<grid-line>` ([`GridLine`](#GridLine)), which determines
the start and end position of this grid item.

Numbers used in this should not be zero, else they won't work.

    gridColumn auto

    gridColumn inherit

    gridColumn <| gridLineIdent "main-grid" (Just 3)
    -- grid-column: main-grid 3

    gridColumn2 auto ( gridLineSpanIdent "grid-thing") (Just 5) )
    -- grid-column: auto / span grid-thing 5
-}
gridColumn :
    BaseValue (GridLine)
    -> Style
gridColumn (Value val) =
    appendProperty <| "grid-column:" ++ val


{-| The [`grid-column`](https://css-tricks.com/almanac/properties/g/grid-column/)
property.

This variant specifies 2 `<grid-line>`s ([`GridLine`](#GridLine)) that determine
the start and end position of this grid item.

Numbers used in this should not be zero, else they won't work.

    gridColumn auto

    gridColumn inherit

    gridColumn <| gridLineIdent "main-grid" (Just 3)
    -- grid-column: main-grid 3

    gridColumn2 auto ( gridLineSpanIdent "grid-thing") (Just 5) )
    -- grid-column: auto / span grid-thing 5
-}
gridColumn2 :
    Value ( GridLine )
    -> Value ( GridLine )
    -> Style
gridColumn2 (Value gl1) (Value gl2) =
    appendProperty <| "grid-column:" ++ gl1 ++ "/" ++ gl2


{-| The 1-argument version of the [`grid-column-start`](https://css-tricks.com/almanac/properties/g/grid-column-start/)
property.

    gridColumnStart inherit

    gridColumnStart auto

    gridColumnStart <| gridLineSpanIdent "big-grid") Nothing

    gridColumnStart <| int 3

    gridColumnStart <| gridLineIdent "big-grid" (Just 2)
-}
gridColumnStart :
    BaseValue ( GridLine )
    -> Style
gridColumnStart (Value val) =
    appendProperty ("grid-column-start:" ++ val)


{-| The 1-argument version of the [`grid-column-end`](https://css-tricks.com/almanac/properties/g/grid-column-end/)
property.

    gridColumnEnd inherit

    gridColumnEnd auto

    gridColumnEnd <| gridLineSpanIdent "big-grid") Nothing

    gridColumnEnd <| int 3

    gridColumnEnd <| gridLineIdent "big-grid" (Just 2)
-}
gridColumnEnd :
    BaseValue ( GridLine )
    -> Style
gridColumnEnd (Value val) =
    appendProperty ("grid-column-end:" ++ val)

    
{-| The[`grid-template`](https://css-tricks.com/almanac/properties/g/grid-template/)
property.

    gridTemplate initial

    gridTemplate none

    gridTemplate <|
        templateAreasRowsColumns
            [ templateAreaRow
                ( Just <| lineNames ["header-left"] )
                "head head"
                ( Just <| px 30 )
                ( Just <| lineNames ["header-right"] )
            
            , templateAreaRow
                ( Just <| lineNames ["main-left"] )
                "nav main"
                ( Just <| fr 1 )
                ( Just <| lineNames ["main-right"])

            , templateAreaRow
                ( Just <| lineNames ["footer-left"] )
                "nav foot"
                ( Just <| px 30 )
                ( Just <| lineNames ["footer-right"])
            ]
            ( Just <| templateColumns
                ( px 120 )
                [ fr 120
                ]
            )

    gridTemplate <|
        templateRowsColumns
            ( trackList
                ( lineNames ["line1", "line2"] )
                [ px 300
                , lineNames ["line3"]
                ]
            )
            
            ( autoTrackList
                ( minmax (px 210) maxContent )
                [ autoRepeat autoFill [px 200]
                , pct 20
                ]
            )
-}

gridTemplate :
    BaseValue
        { none : Supported
        , templateRowsColumns : Supported
        , templateAreasRowsColumns : Supported
        }
    -> Style
gridTemplate (Value value) =
    appendProperty <| "grid-template:" ++ value


{-| The [`grid-template-areas`](https://css-tricks.com/almanac/properties/g/grid-template-areas/)
property. Use the [`gridTemplateAreasMany`](#gridTemplateAreasMany) function if you want
to use multiple strings as a value.

    gridTemplateAreas none

    gridTemplateAreas inherit

    gridTemplateAreasCells
        [ "c c b"
        , "c a b"
        , "c d e"
        ]

-}
gridTemplateAreas :
    BaseValue
        { none : Supported
        }
    -> Style
gridTemplateAreas (Value val) =
    appendProperty ("grid-template-areas:" ++ val)


{-| A version of [`gridTemplateAreas`](#gridTemplateAreas) that
lets you input a list of strings as values, representing grid cells.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    gridTemplateAreasCells
        [ "c c b"
        , "c a b"
        , "c d e"
        ]

    gridTemplateAreasCells [] -- unset
-}
gridTemplateAreasCells :
    List String
    -> Style
gridTemplateAreasCells values =
        appendProperty <| "grid-template-areas:" ++ stringListToStringEnquoted "" values
            
{-| The [`grid-template-rows`](https://css-tricks.com/almanac/properties/g/grid-template-rows/)
property.

    gridTemplateRows inherit

    gridTemplateRows none

    gridTemplateRows <|
        trackList (px 200) [fr 1, px 180]

    gridTemplateRows <|
        trackList 
            ( lineNames ["line1", "line2"] )
            [ px 300
            , lineNames ["line3"]
            ]

    gridTemplateRows <|
        trackList [ fixedRepeat (num 4) [px 520] ]

    gridTemplateRows <|
        autoTrackList
            ( minmax (px 210) maxContent )
            [ autoRepeat autoFill [px 200]
            , pct 20
            ]
-}
gridTemplateRows :
    BaseValue
        { none : Supported
        , trackList : Supported
        , autoTrackList : Supported
        }
    -> Style
gridTemplateRows (Value val) =
    appendProperty <| "grid-template-rows:" ++ val


{-| The [`grid-template-columns`](https://css-tricks.com/almanac/properties/g/grid-template-columns/)
property.

    gridTemplateColumns inherit

    gridTemplateColumns none

    gridTemplateColumns <|
        trackList (px 200) [fr 1, px 180]

    gridTemplateColumns <|
        trackList 
            ( lineNames ["line1", "line2"] )
            [ px 300
            , lineNames ["line3"]
            ]

    gridTemplateColumns <|
        trackList [ fixedRepeat (num 4) [px 520] ]

    gridTemplateColumns <|
        autoTrackList
            ( minmax (px 210) maxContent )
            [ autoRepeat autoFill [px 200]
            , pct 20
            ]
-}
gridTemplateColumns :
    BaseValue
        { none : Supported
        , trackList : Supported
        , autoTrackList : Supported
        }
    -> Style
gridTemplateColumns (Value val) =
    appendProperty <| "grid-template-columns:" ++ val


{-| Provides structured input for [`gridTemplate`](#gridTemplate) for
inputting rows and columns, equivalent to inputting [`gridTemplateRows`](#gridTemplateRows)
and [`gridTemplateColumns`] separately.

    gridTemplate <|
        templateRowsColumns
            trackList
                ( lineNames ["line1", "line2"] )
                [ px 300
                , lineNames ["line3"]
                ]
            
            autoTrackList
                ( minmax (px 210) maxContent )
                [ autoRepeat autoFill [px 200]
                , pct 20
                ]
-}
templateRowsColumns :
    Value
        { trackList : Supported
        , autoTrackList : Supported
        }
    -> Value
        { trackList : Supported
        , autoTrackList : Supported
        }
    -> Value { provides | templateRowsColumns : Supported }
templateRowsColumns (Value r) (Value c) =
    Value <| r ++ "/" ++ c


{-| Provides structured input for [`gridTemplate`](#gridTemplate) for
inputting areas combined with rows, and then columns.

    gridTemplate <|
        templateAreasRowsColumns
            [ templateAreaRow
                ( Just <| lineNames ["left"] )
                "nav foot"
                ( Just <| px 30 )
                ( Just <| lineNames ["right"])
            ]
            ( Just <| templateColumns
                ( px 120 )
                [ fr 120
                ]
            )
-}
templateAreasRowsColumns :
    ( List 
        ( Value { templateAreaRow : Supported })
    )
    -> ( Maybe
        ( Value { templateColumns : Supported } )
    )
    -> Value { provides | templateAreasRowsColumns : Supported }
templateAreasRowsColumns areasAndRows maybeColumns  =
    Value <|
        ( areasAndRows
        |> List.map Value.unpack
        |> String.join " "
        )
        ++ ( case maybeColumns of
            Just c ->  "/" ++ Value.unpack c
            Nothing -> ""
        )
        
{-| The portion of a possible way of giving a
[`gridTemplate`](#gridTemplate)`a value that sets rows and areas.

    gridTemplate <|
        templateAreasRowsColumns
            [ templateAreaRow
                ( Just <| lineNames ["header-left"] )
                "head head"
                ( Just <| px 30 )
                ( Just <| lineNames ["header-right"] )
            
            , templateAreaRow
                ( Just <| lineNames ["main-left"] )
                "nav main"
                ( Just <| fr 1 )
                ( Just <| lineNames ["main-right"])

            , templateAreaRow
                ( Just <| lineNames ["footer-left"] )
                "nav foot"
                ( Just <| px 30 )
                ( Just <| lineNames ["footer-right"])
            ]
            ( Just <| templateColumns
                ( px 120 )
                [ fr 120
                ]
            )
-}
templateAreaRow :
    Maybe ( Value { lineNames : Supported } )
    -> String
    -> Maybe ( Value TrackSize )
    -> Maybe ( Value { lineNames : Supported } )
    -> Value { provides | templateAreaRow : Supported }
templateAreaRow startLines templateAreas trackSize endLines =
    Value (
        [ Maybe.map (Value.unpack) startLines
        , Just <| enquoteString templateAreas
        , Maybe.map (Value.unpack) trackSize
        , Maybe.map (Value.unpack) endLines
        ]
        |> List.filterMap (\v -> v)
        |> String.join " "
    )


{-| The portion of a possible way of giving a
[`gridTemplate`](#gridTemplate)`a value that sets columns.

The first value is the head of the list. This function is structured in this
way to prevent giving empty lists.

    gridTemplate <|
        templateAreasRowsColumns
            [ templateAreaRow
                ( Just <| lineNames ["left"] )
                "nav foot"
                ( Just <| px 30 )
                ( Just <| lineNames ["right"])
            ]
            ( Just <| templateColumns
                ( px 120 )
                [ fr 120
                ]
            )

-}
templateColumns :
    ( Value
            ( TrackSizeSupported
                ( { lineNames : Supported } )
            )
    )
    -> List
        ( Value
            ( TrackSizeSupported
                ( { lineNames : Supported } )
            )
        )
    -> Value { provides | templateColumns : Supported }
templateColumns head rest =
    Value <| valueListToStringNoFallback " " head rest


{-| Creates a `<track-list>` value for use in creating grid tempolates.

    gridTemplateColumns <|
        trackList [ fixedRepeat (num 4) [px 520] ]
-}
trackList :
    Value
        ( TrackSizeSupported
            { fixedRepeat : Supported
            , lineNames : Supported
            }
        )
    -> List
        ( Value
            ( TrackSizeSupported
                { fixedRepeat : Supported
                , lineNames : Supported
                }
            )
        )
    -> Value { provides | trackList : Supported }
trackList head rest =
    Value <| valueListToStringNoFallback " " head rest


{-| Creates a `<auto-track-list>` value for use in creating grid templates.

    gridTemplateColumns <|
        autoTrackList
            ( minmax (px 210) maxContent )
            [ autoRepeat autoFill [px 200]
            , pct 20
            ]
-}
autoTrackList :
    Value
        ( FixedSizeSupported
            { fixedRepeat : Supported
            , autoRepeat : Supported
            , lineNames : Supported
            }
        )
    -> List
        ( Value
            ( FixedSizeSupported
                { fixedRepeat : Supported
                , autoRepeat : Supported
                , lineNames : Supported
                }
            )
        )
    -> Value { provides | autoTrackList : Supported }
autoTrackList head rest =
    Value <| valueListToStringNoFallback " " head rest


{-| Performs the `repeat()` function used in CSS Grid track lists. This lets you
repeat a pattern of grid lines in CSS Grid without duplicating code.

This is the fixed variant of the repeat() function. In this variant, you must
specify a `num` before specifying the track list pattern you want to repeat.

    gridTemplate <|
        templateRowsColumns
            ( trackList
                ( lineNames ["line1", "line2"] )
                [ px 300
                , lineNames ["line3"]
                ]
            )
            
            ( autoTrackList
                ( minmax (px 210) maxContent )
                [ autoRepeat autoFill [px 200]
                , pct 20
                ]
            )
-}
fixedRepeat : 
    Value
        { num : Supported
        }
    -> List ( Value
        ( LengthSupported
            { pct : Supported
            , fr : Supported
            , minmax : Supported
            , lineNames : Supported
            }
        )
    )
    -> Value { provides | fixedRepeat : Supported }
fixedRepeat (Value firstArg) list =
    Value <| "repeat(" ++ firstArg ++ "," ++ valueListToStringUnsafe " " list ++ ")"


{-| Performs the `repeat()` function used in CSS Grid track lists. This lets you
repeat a pattern of grid lines in CSS Grid without duplicating code.

You must specify a `autoFit`, or `autoFill` before specifying the track
list pattern you want to repeat.

    gridTemplateRows <|
        autoTrackList
            [ lineNames ["linename1"]
            , px 100
            , lineNames ["linename2"]
            , autoRepeat autoFit
                (px 10)
                [ lineNames["row-start"]
                , px 250
                , lineNames["row-end"]
                ]
            , px 100
            ]
-}
autoRepeat : 
    Value
        { autoFill : Supported
        , autoFit : Supported
        }
    -> List ( Value
        ( LengthSupported
            { pct : Supported
            , fr : Supported
            , minmax : Supported
            , lineNames : Supported
            }
        )
    )
    -> Value { provides | autoRepeat : Supported }
autoRepeat (Value firstArg) list =
    Value <| "repeat(" ++ firstArg ++ "," ++ valueListToStringUnsafe " " list ++ ")"


{-| The `auto-fill` value [used in the `repeat()` function](https://developer.mozilla.org/en-US/docs/Web/CSS/repeat#values).

    gridTemplateColumnsList
        [ minmax (px 210) maxContent
        , repeatedTracks autoFill [px 200]
        , pct 20
        ]

(Note: due to a naming conflict, the `repeat()` function is
called [`repeatedTracks`](#repeatedTracks) in this package.)
-}
autoFill : Value { provides | autoFill : Supported }
autoFill =
    Value "auto-fill"


{-| The `auto-fit` value [used in the `repeat()` function](https://developer.mozilla.org/en-US/docs/Web/CSS/repeat#values).

    gridTemplateColumnsList
        [ minmax (px 210) maxContent
        , repeatedTracks autoFit [px 200]
        , pct 20
        ]

(Note: due to a naming conflict, the `repeat()` function is
called [`repeatedTracks`](#repeatedTracks) in this package.)
-}
autoFit : Value { provides | autoFit : Supported }
autoFit =
    Value "auto-fit"



{-| The `dense` value for the [`grid-auto-flow`](#gridAutoFlow) property.

    gridAutoFlow dense

    gridAutoFlow2 row dense

-}
dense : Value { provides | dense : Supported }
dense =
    Value "dense"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
---------------------------------- GAP ---------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets the [`gap`](https://css-tricks.com/almanac/properties/g/gap/) property.

The `gap` property is a shorthand for setting `row-gap` and `column-gap`
in a single declaration.

`gap` specifies the size of spacing between items within grid, flex
and multi-column layouts.

    gap initial

    gap (px 20) -- 20px gap between all items.

    gap2 (px 20) (px 40) -- 20px row gap, 40px column gap.

-}
gap :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
gap (Value val) =
    appendProperty ("gap:" ++ val)


{-| Sets the [`gap`](https://css-tricks.com/almanac/properties/g/gap/) property.

The `gap` property is a shorthand for setting `row-gap` and `column-gap`
in a single declaration.

`gap` specifies the size of spacing between items within grid, flex
and multi-column layouts.

    gap2 (px 20) (px 40) -- 20px row gap, 40px column gap.

-}
gap2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
gap2 (Value rowVal) (Value columnVal) =
    appendProperty ("gap:" ++ rowVal ++ " " ++ columnVal)


{-| Sets the [`row-gap`](https://developer.mozilla.org/en-US/docs/Web/CSS/row-gap) property.

`row-gap` specifies the size of spacing between rows of items within grid, flex
and multi-column layouts.

    rowGap normal

    rowGap (px 20)

-}
rowGap :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
rowGap (Value widthVal) =
    appendProperty ("row-gap:" ++ widthVal)


{-| Sets the [`column-gap`](https://developer.mozilla.org/en-US/docs/Web/CSS/column-gap) property.

`column-gap` specifies the size of spacing between column of items within grid, flex
and multi-column layouts.

    columnGap normal

    columnGap (px 20)

-}
columnGap :
    BaseValue
        (LengthSupported
            { normal : Supported
            , pct : Supported
            }
        )
    -> Style
columnGap (Value widthVal) =
    appendProperty ("column-gap:" ++ widthVal)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------------- BACKGROUND ---------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`background-color`](https://css-tricks.com/almanac/properties/b/background-color/).

    backgroundColor (hex "#60b5cc")

    backgroundColor (rgb 96 181 204)

    backgroundColor (rgba 96 181 204 0.5)

    backgroundColor transparent

-}
backgroundColor :
    BaseValue
        ( ColorSupported
            { transparent : Supported }
        )
    -> Style
backgroundColor (Value val) =
    appendProperty ("background-color:" ++ val)



{-| Sets [`background-attachment`](https://css-tricks.com/almanac/properties/b/background-attachment/).

    backgroundAttachment local

    backgroundAttachmentMany [ fixed, scroll, fixed ]

    backgroundAttachmentMany [ fixed, scroll, fixed ]

    backgroundAttachmentMany [] -- background-attachment: unset;

-}
backgroundAttachment :
    BaseValue
        { fixed : Supported
        , scroll : Supported
        , local : Supported
        }
    -> Style
backgroundAttachment (Value str) =
    appendProperty ("background-attachment:" ++ str)


{-| Sets [`background-attachment`](https://css-tricks.com/almanac/properties/b/background-attachment/).

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    backgroundAttachment local

    backgroundAttachmentMany [ fixed, scroll, fixed ]

    backgroundAttachmentMany [ fixed, scroll, fixed ]

    backgroundAttachmentMany [] -- background-attachment: unset;

-}
backgroundAttachmentMany :
    List
        (Value
            { fixed : Supported
            , scroll : Supported
            , local : Supported
            }
        )
    -> Style
backgroundAttachmentMany values =
    appendProperty ("background-attachment:" ++ valueListToString "," values)


{-| The `local` [`background-attachment` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment#Values)

    backgroundAttachment local

-}
local : Value { provides | local : Supported }
local =
    Value "local"


{-| Sets [`background-blend-mode`](https://css-tricks.com/almanac/properties/b/background-blend-mode/).
Note that this takes an argument of [`color_`](#color_), not [`color`](#color)!

    backgroundBlendMode color_

    backgroundBlendMode darken

    backgroundBlendMode colorBurn

    backgroundBlendModeMany [ darken, color_ ]

    backgroundBlendModeMany [] -- background-blend-mode: unset;

-}
backgroundBlendMode :
    BaseValue BlendMode
    -> Style
backgroundBlendMode (Value str) =
    appendProperty ("background-blend-mode:" ++ str)


{-| Sets [`background-blend-mode`](https://css-tricks.com/almanac/properties/b/background-blend-mode/).

Note that this takes an argument of [`color_`](#color_), not [`color`](#color)!

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    backgroundBlendMode color_

    backgroundBlendMode darken

    backgroundBlendMode colorBurn

    backgroundBlendModeMany [ darken, color_ ]

    backgroundBlendModeMany [] -- background-blend-mode: unset;
    

-}
backgroundBlendModeMany :
    List ( Value BlendMode )
    -> Style
backgroundBlendModeMany values =
    appendProperty ("background-blend-mode:" ++ valueListToString "," values )


{-| Sets [`background-clip`](https://css-tricks.com/almanac/properties/b/background-clip/).
Note that this takes an argument of [`text`](#text), not [`color`](#color)!

    backgroundClip text

    backgroundClip paddingBox

    backgroundClip contentBox

    backgroundClipMany [ text, borderBox, text ]

    backgroundClipMany [] -- background-clip: unset;

-}
backgroundClip :
    BaseValue
        { borderBox : Supported
        , paddingBox : Supported
        , contentBox : Supported
        , text : Supported
        }
    -> Style
backgroundClip (Value str) =
    appendProperty ("background-clip:" ++ str)


{-| Sets [`background-clip`](https://css-tricks.com/almanac/properties/b/background-clip/).
Note that this takes an argument of [`text`](#text), not [`color`](#color)!

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    backgroundClip text

    backgroundClip paddingBox

    backgroundClip contentBox

    backgroundClipMany [ text, borderBox, text ]

    backgroundClipMany [] -- background-clip: unset;

-}
backgroundClipMany :
    List
        (Value
            { borderBox : Supported
            , paddingBox : Supported
            , contentBox : Supported
            , text : Supported
            }
        )
    -> Style
backgroundClipMany values =
    appendProperty ("background-clip:" ++ valueListToString "," values)



-- BACKGROUND ORIGIN --


{-| Sets [`background-origin`](https://css-tricks.com/almanac/properties/b/background-origin/).

    backgroundOrigin paddingBox

    backgroundOrigin contentBox
    
    backgroundOriginMany [ contentBox, borderBox, contentBox ]

    backgroundOriginMany [] -- background-origin: unset;

-}
backgroundOrigin :
    BaseValue
        { borderBox : Supported
        , paddingBox : Supported
        , contentBox : Supported
        }
    -> Style
backgroundOrigin (Value str) =
    appendProperty ("background-origin:" ++ str)


{-| Sets [`background-origin`](https://css-tricks.com/almanac/properties/b/background-origin/).

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    backgroundOrigin paddingBox

    backgroundOrigin contentBox

    backgroundOriginMany [ contentBox, borderBox, contentBox ]

    backgroundOriginMany [] -- background-origin: unset;

-}
backgroundOriginMany :
    List
        (Value
            { borderBox : Supported
            , paddingBox : Supported
            , contentBox : Supported
            }
        )
    -> Style
backgroundOriginMany values =
    appendProperty ("background-origin:" ++ valueListToString "," values)


{-| Sets [`background-image`](https://css-tricks.com/almanac/properties/b/background-image/).

    backgroundImage (url "http://www.example.com/chicken.jpg")

    backgroundImage (linearGradient (stop red) (stop blue))

See also [`backgroundImages`](#backgroundImages) if you need multiple images.

-}
backgroundImage : BaseValue (ImageSupported { none : Supported }) -> Style
backgroundImage (Value value) =
    appendProperty ("background-image:" ++ value)


{-| Sets [`background-image`](https://css-tricks.com/almanac/properties/b/background-image/) for multiple images.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    backgroundImageMany
        (linearGradient (stop red) (stop blue))
        [ url "http://www.example.com/chicken.jpg" ]

    backgroundImageMany [] -- background-image: unset;

See also [`backgroundImage`](#backgroundImage) if you need only one.

-}
backgroundImageMany :
    List (Value Image)
    -> Style
backgroundImageMany values =
    appendProperty ("background-image:" ++ valueListToString "," values)


-- BACKGROUND POSITION --


{-| Sets [`background-position`](https://css-tricks.com/almanac/properties/b/background-position/).

    backgroundPosition left_

    backgroundPosition (px 45)

`backgroundPosition` sets the horizontal direction. If you need the vertical
direction instead, use [`backgroundPosition2`](#backgroundPosition2) like this:

    backgroundPosition2 zero (px 45)

If you need to set the offsets from the right or bottom, use
[`backgroundPosition4`](#backgroundPosition4) like this:

    backgroundPosition4 right_ (px 20) bottom_ (pct 30)

-}
backgroundPosition :
    BaseValue
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , right_ : Supported
            , top_ : Supported
            , bottom_ : Supported
            , center : Supported
            }
        )
    -> Style
backgroundPosition (Value val) =
    appendProperty ("background-position:" ++ val)


{-| Sets [`background-position`](https://css-tricks.com/almanac/properties/b/background-position/).

    backgroundPosition2 left_ top_

    backgroundPosition2 (px 45) (pct 50)

`backgroundPosition2` sets both the horizontal and vertical directions (in that
order, same as CSS.) If you need only the horizontal, you can use
[`backgroundPosition`](#backgroundPosition) instead:

    backgroundPosition left_

If you need to set the offsets from the right or bottom, use
[`backgroundPosition4`](#backgroundPosition4).

-}
backgroundPosition2 :
    Value
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , right_ : Supported
            , center : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , top_ : Supported
                , bottom_ : Supported
                , center : Supported
                }
            )
    -> Style
backgroundPosition2 (Value horiz) (Value vert) =
    appendProperty ("background-position:" ++ horiz ++ " " ++ vert)


{-| Sets [`background-position`](https://css-tricks.com/almanac/properties/b/background-position/).

    backgroundPosition3 right_ (px 20) center

The three-argument form of background position sets one side to center and the
other to the specified offest. So the example above would position the background
image 20px from the right, and center it vertically.

-}
backgroundPosition3 :
    Value
        { left_ : Supported
        , right_ : Supported
        , top_ : Supported
        , bottom_ : Supported
        }
    -> Value (LengthSupported { pct : Supported })
    -> Value { center : Supported }
    -> Style
backgroundPosition3 (Value side) (Value amount) (Value centerVal) =
    appendProperty
        ("background-position:"
            ++ side
            ++ " "
            ++ amount
            ++ " "
            ++ centerVal
        )


{-| Sets [`background-position`](https://css-tricks.com/almanac/properties/b/background-position/).

    backgroundPosition4 right_ (px 20) bottom_ (pct 30)

The four-argument form of background position alternates sides and offets. So the
example above would position the background image 20px from the right, and 30%
from the bottom.

See also [`backgroundPosition`](#backgroundPosition) for horizontal alignment and
[`backgroundPosition2`](#backgroundPosition2) for horizontal (from left) and
vertical (from top) alignment.

-}
backgroundPosition4 :
    Value
        { left_ : Supported
        , right_ : Supported
        }
    -> Value (LengthSupported { pct : Supported })
    ->
        Value
            { top_ : Supported
            , bottom_ : Supported
            }
    -> Value (LengthSupported { pct : Supported })
    -> Style
backgroundPosition4 (Value horiz) (Value horizAmount) (Value vert) (Value vertAmount) =
    appendProperty
        ("background-position:"
            ++ horiz
            ++ " "
            ++ horizAmount
            ++ " "
            ++ vert
            ++ " "
            ++ vertAmount
        )



-- BACKGROUND REPEAT --


{-| Sets [`background-repeat`](https://css-tricks.com/almanac/properties/b/background-repeat/)

    backgroundRepeat repeat

    backgroundRepeat repeatX

If you need to set horizontal and vertical direction separately, see
[`backgroundRepeat2`](#backgroundRepeat2)

-}
backgroundRepeat :
    BaseValue
        { repeat : Supported
        , repeatX : Supported
        , repeatY : Supported
        , space : Supported
        , round_ : Supported
        , noRepeat : Supported
        }
    -> Style
backgroundRepeat (Value repeatVal) =
    appendProperty ("background-repeat:" ++ repeatVal)


{-| Sets [`background-repeat`](https://css-tricks.com/almanac/properties/b/background-repeat/) along the horizontal axis, then the vertical axis.

    backgroundRepeat2 repeat space

    backgroundRepeat2 space round

If you only need to set one value for both, see
[`backgroundRepeat`](#backgroundRepeat) instead.

-}
backgroundRepeat2 :
    Value
        { repeat : Supported
        , space : Supported
        , round_ : Supported
        , noRepeat : Supported
        }
    ->
        Value
            { repeat : Supported
            , space : Supported
            , round_ : Supported
            , noRepeat : Supported
            }
    -> Style
backgroundRepeat2 (Value horiz) (Value vert) =
    appendProperty ("background-repeat:" ++ horiz ++ " " ++ vert)


{-| Sets [`background-size`](https://css-tricks.com/almanac/properties/b/background-size/).

    backgroundSize cover

    backgroundSize (px 400)

If you give a length value, it will be used for the width. The height will be set
proportional to the size of the [`background-image`](#backgroundImage). If you
need to set both width and height explicitly, use
[`backgroundImage2`](#backgroundImage2) instead.

-}
backgroundSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            , cover : Supported
            , contain_ : Supported
            }
        )
    -> Style
backgroundSize (Value sizeVal) =
    appendProperty ("background-size:" ++ sizeVal)


{-| Sets [`background-size`](https://css-tricks.com/almanac/properties/b/background-size/) for both width and height (in that order.)

    backgroundSize2 (px 300) (px 100)

    backgroundSize2 auto (px 400)

If you only want to set the width, use [`backgroundImage`](#backgroundImage) instead.

-}
backgroundSize2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
backgroundSize2 (Value widthVal) (Value heightVal) =
    appendProperty ("background-size:" ++ widthVal ++ " " ++ heightVal)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- FONT SIZE ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`color`](https://css-tricks.com/almanac/properties/c/color/).

    color (hex "#60b5cc")

    color (rgb 96 181 204)

    color (rgba 96 181 204 0.5)

-}
color : BaseValue Color -> Style
color (Value val) =
    appendProperty ("color:" ++ val)


{-| Sets [`font-size`](https://css-tricks.com/almanac/properties/f/font-size/)

    fontSize xxSmall

    fontSize (px 12)

Check out [fluid typography](https://css-tricks.com/snippets/css/fluid-typography/) for some cool stuff you can do with this.

-}
fontSize :
    BaseValue
        (LengthSupported
            { xxSmall : Supported
            , xSmall : Supported
            , small : Supported
            , medium : Supported
            , large : Supported
            , xLarge : Supported
            , xxLarge : Supported
            , xxxLarge : Supported
            , smaller : Supported
            , larger : Supported
            , pct : Supported
            }
        )
    -> Style
fontSize (Value val) =
    appendProperty ("font-size:" ++ val)


{-| The `xx-small` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize xxSmall

-}
xxSmall : Value { provides | xxSmall : Supported }
xxSmall =
    Value "xx-small"


{-| The `x-small` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize xSmall

-}
xSmall : Value { provides | xSmall : Supported }
xSmall =
    Value "x-small"


{-| The `small` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize small

-}
small : Value { provides | small : Supported }
small =
    Value "small"


{-| The `medium` value used by properties such as [`fontSize`](#fontSize),
[`borderWidth`](#borderWidth),
[`columnRuleWidth`](#columnRuleWidth).

    fontSize medium

    borderWidth medium

    columnRuleWidth medium

The value is equivalent of 3px when using for `border-width`.

-}
medium : Value { provides | medium : Supported }
medium =
    Value "medium"


{-| The `large` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize large

-}
large : Value { provides | large : Supported }
large =
    Value "large"


{-| The `x-large` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize xLarge

-}
xLarge : Value { provides | xLarge : Supported }
xLarge =
    Value "x-large"


{-| The `xx-large` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize xxLarge

-}
xxLarge : Value { provides | xxLarge : Supported }
xxLarge =
    Value "xx-large"


{-| The `xxx-large` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize xxxLarge

-}
xxxLarge : Value { provides | xxxLarge : Supported }
xxxLarge =
    Value "xxx-large"


{-| The `smaller` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize smaller

-}
smaller : Value { provides | smaller : Supported }
smaller =
    Value "smaller"


{-| The `larger` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize larger

-}
larger : Value { provides | larger : Supported }
larger =
    Value "larger"


{-| Sets [`font-size-adjust`](https://css-tricks.com/almanac/properties/f/font-size-adjust/)

    fontSizeAdjust zero

    fontSizeAdjust none

    fontSizeAdjust (num 0.5)

-}
fontSizeAdjust :
    BaseValue
        { none : Supported
        , zero : Supported
        , num : Supported
        }
    -> Style
fontSizeAdjust (Value val) =
    appendProperty ("font-size-adjust:" ++ val)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- FONT-FACE ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`font-display`](https://css-tricks.com/almanac/properties/f/font-display/)

    fontDisplay auto

    fontDisplay block

    fontDisplay swap

    fontDisplay fallback

    fontDisplay optional

-}
fontDisplay :
    BaseValue
        { auto : Supported
        , block : Supported
        , swap : Supported
        , fallback : Supported
        , optional : Supported
        }
    -> Style
fontDisplay (Value val) =
    appendProperty ("font-display:" ++ val)


{-| Sets `fallback` value for usage with [`fontDisplay`](#fontDisplay) or [`strokeLinejoin`](#strokeLinejoin2).

      fontDisplay fallback

      strokeLinejoin2 miter fallback

-}
fallback : Value { provides | fallback : Supported }
fallback =
    Value "fallback"


{-| Sets `swap` value for usage with [`fontDisplay`](#fontDisplay).

    fontDisplay swap

-}
swap : Value { provides | swap : Supported }
swap =
    Value "swap"


{-| Sets `optional` value for usage with [`fontDisplay`](#fontDisplay).

      fontDisplay optional

-}
optional : Value { provides | optional : Supported }
optional =
    Value "optional"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------ FONT FAMILY -----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| For when your font is one of the six [generic font family names](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#%3Cgeneric-name%3E) - [`serif`](#serif), [`sansSerif`](#sansSerif), [`monospace`](#monospace), [`cursive`](#cursive), [`fantasy`](#fantasy), or [`systemUi`](#systemUi).

If you want to refer to a font by its name (like Helvetica or Arial), use [`fontFamilyMany`](#fontFamilyMany) instead.

-}
fontFamily :
    BaseValue
        { serif : Supported
        , sansSerif : Supported
        , monospace : Supported
        , cursive : Supported
        , fantasy : Supported
        , systemUi : Supported
        , uiSerif : Supported
        , uiSansSerif : Supported
        , uiMonospace : Supported
        , uiRounded : Supported
        , emoji : Supported
        , math : Supported
        , fangsong : Supported
        }
    -> Style
fontFamily (Value genericFont) =
    appendProperty ("font-family:" ++ genericFont)


{-| The `serif` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#%3Cgeneric-name%3E).

    fontFamily serif

    fontFamilyMany [ "Gill Sans", "Helvetica" ] serif

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
serif : Value { provides | serif : Supported }
serif =
    Value "serif"


{-| The `sans-serif` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#%3Cgeneric-name%3E).

    fontFamily sansSerif

    fontFamilyMany [ "Georgia", "Times" ] sansSerif

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
sansSerif : Value { provides | sansSerif : Supported }
sansSerif =
    Value "sans-serif"


{-| The `monospace` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#3Cgeneric-name%3E).

    fontFamily monospace

    fontFamilyMany [ "Source Code Pro", "Lucida Console" ] monospace

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
monospace : Value { provides | monospace : Supported }
monospace =
    Value "monospace"


{-| The `cursive` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#3Cgeneric-name%3E).

    fontFamily cursive

    fontFamilyMany [ "Brush Script Std", "Lucida Calligraphy" ] cursive

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
cursive : Value { provides | cursive : Supported }
cursive =
    Value "cursive"


{-| The `fantasy` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#3Cgeneric-name%3E).

    fontFamily fantasy
    fontFamilyMany [ "Herculanum", "Harrington" ] fantasy

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
fantasy : Value { provides | fantasy : Supported }
fantasy =
    Value "fantasy"


{-| The `system-ui` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#3Cgeneric-name%3E).

You may want to [read more about the system font stack](https://css-tricks.com/snippets/css/system-font-stack/) before using this one.

    fontFamily systemUi

    fontFamilyMany [ "", "Segoe UI" ] systemUi

    fontFamilyMany [ "system-ui", "Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol" ] sansSerif

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
systemUi : Value { provides | systemUi : Supported }
systemUi =
    Value "system-ui"


{-| The `ui-serif` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#values).

    fontFamily uiSerif

    fontFamilyMany [ "New York" ] uiSerif

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
uiSerif : Value { provides | uiSerif : Supported }
uiSerif =
    Value "ui-serif"


{-| The `ui-sans-serif` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#values).

    fontFamily uiSansSerif

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
uiSansSerif : Value { provides | uiSansSerif : Supported }
uiSansSerif =
    Value "ui-sans-serif"


{-| The `ui-monospace` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#values).

    fontFamily uiMonospace

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
uiMonospace : Value { provides | uiMonospace : Supported }
uiMonospace =
    Value "ui-monospace"


{-| The `ui-rounded` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#values).

    fontFamily uiRounded

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
uiRounded : Value { provides | uiRounded : Supported }
uiRounded =
    Value "ui-rounded"


{-| The `math` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#values).

    fontFamily math

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
math : Value { provides | math : Supported }
math =
    Value "math"


{-| The `fangsong` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#values).

    fontFamily fangsong

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilyMany`](#fontFamilyMany).

-}
fangsong : Value { provides | fangsong : Supported }
fangsong =
    Value "fangsong"


{-| Define multiple [font families](https://css-tricks.com/almanac/properties/f/font-family/).

Per the CSS spec, a [generic name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#%3Cgeneric-name%3E) must always be at the end of this list. (The generic names are [`serif`](#serif), [`sansSerif`](#sansSerif), [`monospace`](#monospace), [`cursive`](#cursive) or [`fantasy`](#fantasy).)

    fontFamilyMany [ "Gill Sans Extrabold", "Helvetica", "Arial" ] sansSerif

This function will automatically wrap each font family in quotation marks unless it is one of the six [generic names]((https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#%3Cgeneric-name%3E)) (like `sans-serif`), which must never be quoted.

-}
fontFamilyMany :
    List String
    ->
        Value
            { serif : Supported
            , sansSerif : Supported
            , monospace : Supported
            , cursive : Supported
            , fantasy : Supported
            , systemUi : Supported
            , uiSerif : Supported
            , uiSansSerif : Supported
            , uiMonospace : Supported
            , uiRounded : Supported
            , emoji : Supported
            , math : Supported
            , fangsong : Supported
            }
    -> Style
fontFamilyMany list (Value genericFont) =
    case list of
        [] ->
            appendProperty ("font-family:" ++ genericFont)

        fonts ->
            appendProperty
                ("font-family:"
                    ++ String.join "," (List.map enquoteIfNotGeneric fonts)
                    ++ ("," ++ genericFont)
                )


enquoteIfNotGeneric : String -> String
enquoteIfNotGeneric fontName =
    case fontName of
        "serif" ->
            fontName

        "sans-serif" ->
            fontName

        "monospace" ->
            fontName

        "cursive" ->
            fontName

        "fantasy" ->
            fontName

        "system-ui" ->
            fontName

        _ ->
            enquoteString fontName

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------- FONT STYLE + WEIGHT -------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`font-style`](https://css-tricks.com/almanac/properties/f/font-style/)

    fontStyle italic

-}
fontStyle :
    BaseValue
        { normal : Supported
        , italic : Supported
        , oblique : Supported
        }
    -> Style
fontStyle (Value val) =
    appendProperty ("font-style:" ++ val)


{-| -}
italic : Value { provides | italic : Supported }
italic =
    Value "italic"


{-| -}
oblique : Value { provides | oblique : Supported }
oblique =
    Value "oblique"


{-| Sets [`font-weight`](https://css-tricks.com/almanac/properties/f/font-weight/)

    fontWeight bold

    fontWeight (int 300)

-}
fontWeight :
    BaseValue
        { normal : Supported
        , bold : Supported
        , bolder : Supported
        , lighter : Supported
        , int : Supported
        }
    -> Style
fontWeight (Value val) =
    appendProperty ("font-weight:" ++ val)


{-| -}
bold : Value { provides | bold : Supported }
bold =
    Value "bold"


{-| -}
lighter : Value { provides | lighter : Supported }
lighter =
    Value "lighter"


{-| -}
bolder : Value { provides | bolder : Supported }
bolder =
    Value "bolder"


{-| Sets [`font-stretch`](https://css-tricks.com/almanac/properties/f/font-stretch/)

    fontStretch ultraCondensed

    fontStretch extraCondensed

    fontStretch condensed

    fontStretch semiCondensed

    fontStretch normal

    fontStretch semiExpanded

    fontStretch expanded

    fontStretch extraExpanded

    fontStretch ultraExpanded

    fontStretch (pct 100)

-}
fontStretch :
    BaseValue
        { ultraCondensed : Supported
        , extraCondensed : Supported
        , condensed : Supported
        , semiCondensed : Supported
        , normal : Supported
        , semiExpanded : Supported
        , expanded : Supported
        , extraExpanded : Supported
        , ultraExpanded : Supported
        , pct : Supported
        }
    -> Style
fontStretch (Value val) =
    appendProperty ("font-stretch:" ++ val)


{-| Sets `ultra-condensed` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay ultraCondensed

-}
ultraCondensed : Value { provides | ultraCondensed : Supported }
ultraCondensed =
    Value "ultra-condensed"


{-| Sets `extra-condensed` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay extraCondensed

-}
extraCondensed : Value { provides | extraCondensed : Supported }
extraCondensed =
    Value "extra-condensed"


{-| Sets `condensed` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay Condensed

-}
condensed : Value { provides | condensed : Supported }
condensed =
    Value "condensed"


{-| Sets `semi-condensed` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay semiCondensed

-}
semiCondensed : Value { provides | semiCondensed : Supported }
semiCondensed =
    Value "semi-condensed"


{-| Sets `ultra-expanded` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay ultraExpanded

-}
ultraExpanded : Value { provides | ultraExpanded : Supported }
ultraExpanded =
    Value "ultra-expanded"


{-| Sets `extra-expanded` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay extraExpanded

-}
extraExpanded : Value { provides | extraExpanded : Supported }
extraExpanded =
    Value "extra-expanded"


{-| Sets `expanded` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay Expanded

-}
expanded : Value { provides | expanded : Supported }
expanded =
    Value "expanded"


{-| Sets `semi-expanded` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay semiExpanded

-}
semiExpanded : Value { provides | semiExpanded : Supported }
semiExpanded =
    Value "semi-expanded"


{-| The [`font-synthesis`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis) property.

    fontSynthesis none

    fontSynthesis smallCaps

    fontSynthesis2 smallCaps weight

    fontSynthesis3 weight style smallCaps

-}
fontSynthesis :
    BaseValue
        { none : Supported
        , weight : Supported
        , style : Supported
        , smallCaps : Supported
        }
    -> Style
fontSynthesis (Value val) =
    appendProperty ("font-synthesis:" ++ val)


{-| The [`font-synthesis`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis) property.

This is the two-argument variant, in which you can indicate
two different font properties to be synthesised by the browser.

    fontSynthesis2 smallCaps weight

-}
fontSynthesis2 :
    Value
        { weight : Supported
        , style : Supported
        , smallCaps : Supported
        }
    ->
        Value
            { weight : Supported
            , style : Supported
            , smallCaps : Supported
            }
    -> Style
fontSynthesis2 (Value val1) (Value val2) =
    appendProperty ("font-synthesis:" ++ val1 ++ " " ++ val2)


{-| The [`font-synthesis`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis) property.

This is the three-argument variant, in which you can indicate
all three different font properties to be synthesised by the browser.

    fontSynthesis3 weight style smallCaps

-}
fontSynthesis3 :
    Value
        { weight : Supported
        }
    ->
        Value
            { style : Supported
            }
    ->
        Value
            { smallCaps : Supported
            }
    -> Style
fontSynthesis3 (Value val1) (Value val2) (Value val3) =
    appendProperty ("font-synthesis:" ++ val1 ++ " " ++ val2 ++ " " ++ val3)


{-| The `weight` value for the [`fontSynthesis`](#fontSynthesis) property.

    fontSynthesis weight

-}
weight : Value { provides | weight : Supported }
weight =
    Value "weight"


{-| The 1-argument variant of the [`font-variation-settings`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variation-settings)
property.

This lets you control variable font axes directly by their tag.

Use [`fontVariationSettingsMany`](#fontVariationSettingsMany) to work with variable font tags.

    fontVariationSettings normal

    fontVariationSettings inherit

    fontVariationSettingsMany [ ("XHGT", 0.7) ]

**This is designed to let you set variable features where none exist already. If you've
got a variable axis already covered by a property (eg. [`fontWeight`](#fontWeight),
[`fontStyle`](#fontStyle)), you should use those instead.**
-}
fontVariationSettings :
    BaseValue
        { normal : Supported
        }
    -> Style
fontVariationSettings (Value val) =
    appendProperty ("font-variation-settings:" ++ val)


{-| The multi-argument variant of the [`font-variation-settings`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variation-settings)
property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

For using single keywords with this property, use [`fontVariationSettings`](#fontVariationSettings).

    fontVariationSettingsMany [ ("XHGT", 0.7) ]

    fontVariationSettingsMany [] -- font-variation-settings: unset;

**This is designed to let you set variable features where none exist already. If you've
got a variable axis already covered by a property (eg. [`fontWeight`](#fontWeight),
[`fontStyle`](#fontStyle)), you should use those instead.**
-}
fontVariationSettingsMany :
    List
        ( String
        , Float
        )
    -> Style
fontVariationSettingsMany list =
    appendProperty <| "font-variation-settings:" ++
        if List.length list == 0 then
            Value.unpack unset
        else
            ( list
            |> List.map
                (\(tagVal, numberVal) -> (enquoteString tagVal) ++ " " ++ (String.fromFloat numberVal)
                )
            |> String.join ", "
            )


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------- FONT FEATURES AND VARIANTS ---------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`font-feature-settings`](https://css-tricks.com/almanac/properties/f/font-feature-settings/)

    fontFeatureSettings normal

    fontFeatureSettings (featureTag "liga")

    fontFeatureSettings (featureTag2 "swsh" 2)

-}
fontFeatureSettings :
    BaseValue
        { featureTag : Supported
        , normal : Supported
        }
    -> Style
fontFeatureSettings (Value val) =
    appendProperty ("font-feature-settings:" ++ val)


{-| Sets [`font-feature-settings`](https://css-tricks.com/almanac/properties/f/font-feature-settings/)
in a way that lets you add a list of [`featureTag`](#featureTag)s.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    fontFeatureSettingsMany featureTag "liga" [ featureTag2 "swsh" 2 ]

    fontFeatureSettingsMany [] -- font-feature-settings: unset;

-}
fontFeatureSettingsMany :
    List (Value { featureTag : Supported })
    -> Style
fontFeatureSettingsMany values =
    appendProperty ("font-feature-settings:" ++ valueListToString "," values)


{-| Creates a [feature-tag-value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings#feature-tag-value)
for use with [`fontFeatureSettings`](#fontFeatureSettings)
and [`fontFeatureSettingsMany`](#fontFeatureSettingsMany)

    featureTag "smcp"

-}
featureTag : String -> Value { provides | featureTag : Supported }
featureTag =
    Value << enquoteString


{-| Creates a [feature-tag-value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings#feature-tag-value)
with an specific value
for use with [`fontFeatureSettings`](#fontFeatureSettings)
and [`fontFeatureSettingsMany`](#fontFeatureSettingsMany)

    featureTag2 "swsh" 2

-}
featureTag2 : String -> Int -> Value { provides | featureTag : Supported }
featureTag2 tag value =
    Value (enquoteString tag ++ " " ++ String.fromInt value)


-- FONT VARIANT CAPS --

{-| A type that encapsulates all special font variant keywords plus additional types.
-}
type alias AllFontVariantsSupported supported =
    FontVariantCapsSupported
        ( FontVariantEastAsianSupported
            ( FontVariantLigaturesSupported
                ( FontVariantNumericSupported
                    ( FontVariantEmojiSupported
                        ( FontVariantPositionSupported
                            supported
                        ) 
                    )
                )
            )
        )


{-| A type that encapsulates all special font variant keywords.
-}
type alias AllFontVariants =
    AllFontVariantsSupported {}


{-| The [`font-variant`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant)
CSS property.

This is a shorthand property, encapsulating the following:
- [`fontVariantCaps`](#fontVariantCaps)
- [`fontVariantEastAsian`](#fontVariantEastAsian)
- [`fontVariantLigatures`](#fontVariantLigatures)
- [`fontVariantNumeric`](#fontVariantNumeric)
- [`fontVariantEmoji`](#fontVariantEmoji)
- [`fontVariantPosition`](#fontVariantPosition)

```
fontVariant inherit

fontVariant normal

fontVariant jis83

fontVariant2 commonLigatures smallCaps

fontVariant2 noCommonLigatures slashedZero
```
-}
fontVariant :
    BaseValue
        ( AllFontVariantsSupported
            { none : Supported
            , normal : Supported
            }
        )
    -> Style
fontVariant (Value val) =
    appendProperty <| "font-variant:" ++ val


{-| The [`font-variant`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant)
CSS property.

This is a shorthand property, encapsulating the following:
- [`fontVariantCaps`](#fontVariantCaps)
- [`fontVariantEastAsian`](#fontVariantEastAsian)
- [`fontVariantLigatures`](#fontVariantLigatures)
- [`fontVariantNumeric`](#fontVariantNumeric)
- [`fontVariantEmoji`](#fontVariantEmoji)
- [`fontVariantPosition`](#fontVariantPosition)

```
fontVariant inherit

fontVariant normal

fontVariant jis83

fontVariant2 commonLigatures smallCaps

fontVariant2 noCommonLigatures slashedZero
```
-}
fontVariant2 :
    Value ( AllFontVariants )
    -> Value ( AllFontVariants )
    -> Style
fontVariant2 (Value val1) (Value val2) =
    appendProperty <| "font-variant:" ++ val1 ++ " " ++ val2


{-| A type that encapsulates all caps font variant keywords plus additional types.
-}
type alias FontVariantCapsSupported supported =
    { supported
        | smallCaps : Supported
        , allSmallCaps : Supported
        , petiteCaps : Supported
        , allPetiteCaps : Supported
        , unicase : Supported
        , titlingCaps : Supported
    }


{-| Sets [`font-variant-caps`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps).

    fontVariantCaps normal

    fontVariantCaps smallCaps

    fontVariantCaps allSmallCaps

    fontVariantCaps petiteCaps

    fontVariantCaps allPetiteCaps

    fontVariantCaps unicase

    fontVariantCaps titlingCaps

-}
fontVariantCaps :
    BaseValue
        ( FontVariantCapsSupported
            { normal : Supported
            }
        )
    -> Style
fontVariantCaps (Value str) =
    appendProperty ("font-variant-caps:" ++ str)


{-| The `small-caps` value used in

  - [`fontVariantCaps`](#fontVariantCaps)
  - [`fontSynthesis`](#fontSynthesis)

```
fontVariantCaps smallCaps

fontSynthesis2 smallCaps style
```

-}
smallCaps : Value { provides | smallCaps : Supported }
smallCaps =
    Value "small-caps"


{-| The `all-small-caps` [`font-variant-caps` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values).

    fontVariantCaps allSmallCaps

-}
allSmallCaps : Value { provides | allSmallCaps : Supported }
allSmallCaps =
    Value "all-small-caps"


{-| The `petite-caps` [`font-variant-caps` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values).

    fontVariantCaps petiteCaps

-}
petiteCaps : Value { provides | petiteCaps : Supported }
petiteCaps =
    Value "petite-caps"


{-| The `all-petite-caps` [`font-variant-caps` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values).

    fontVariantCaps allPetiteCaps

-}
allPetiteCaps : Value { provides | allPetiteCaps : Supported }
allPetiteCaps =
    Value "all-petite-caps"


{-| The `unicase` [`font-variant-caps` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values).

    fontVariantCaps unicase

-}
unicase : Value { provides | unicase : Supported }
unicase =
    Value "unicase"


{-| The `titling-caps` [`font-variant-caps` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values).

    fontVariantCaps titlingCaps

-}
titlingCaps : Value { provides | titlingCaps : Supported }
titlingCaps =
    Value "titling-caps"



-- FONT VARIANT EAST ASIAN --

{-| A type that encapsulates all east asian font variant keywords plus additional types.
-}
type alias FontVariantEastAsianSupported supported =
    { supported
        | ruby : Supported

        -- variant values
        , jis78 : Supported
        , jis83 : Supported
        , jis90 : Supported
        , jis04 : Supported
        , simplified : Supported
        , traditional : Supported

        -- width values
        , fullWidth : Supported
        , proportionalWidth : Supported
    }

{-| A type that encapsulates all east asian font variant keywords.
-}

type alias FontVariantEastAsian =
    FontVariantEastAsianSupported {}


{-| The [`font-variant-east-asian`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) property.

This property controls the use of alternative glyphs for East Asian scripts.

    fontVariantEastAsian normal

    fontVariantEastAsian2 ruby jis83

    fontVariantEastAsian3 ruby jis90 fullWidth

-}
fontVariantEastAsian :
    BaseValue
        ( FontVariantEastAsianSupported
            { normal : Supported
            }
        )
    -> Style
fontVariantEastAsian (Value val) =
    appendProperty ("font-variant-east-asian:" ++ val)


{-| The [`font-variant-east-asian`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) property.

This property controls the use of alternative glyphs for East Asian scripts.

    fontVariantEastAsian2 ruby jis83

-}
fontVariantEastAsian2 :
    Value (FontVariantEastAsian)
    -> Value (FontVariantEastAsian)
    -> Style
fontVariantEastAsian2 (Value val1) (Value val2) =
    appendProperty ("font-variant-east-asian:" ++ val1 ++ " " ++ val2)


{-| The [`font-variant-east-asian`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) property.

This property controls the use of alternative glyphs for East Asian scripts.

    fontVariantEastAsian3 ruby jis90 fullWidth

-}
fontVariantEastAsian3 :
    Value
        { ruby : Supported
        }
    ->
        Value
            { jis78 : Supported
            , jis83 : Supported
            , jis90 : Supported
            , jis04 : Supported
            , simplified : Supported
            , traditional : Supported
            }
    ->
        Value
            { fullWidth : Supported
            , proportionalWidth : Supported
            }
    -> Style
fontVariantEastAsian3 (Value rubyVal) (Value variantVal) (Value widthVal) =
    appendProperty ("font-variant-east-asian:" ++ rubyVal ++ " " ++ variantVal ++ " " ++ widthVal)


{-| Sets the [`jis78`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that the JIS X 0208:1978 standard for East Asian logographic glyphs
should be used.

    fontVariantEastAsian jis78

-}
jis78 : Value { provides | jis78 : Supported }
jis78 =
    Value "jis78"


{-| Sets the [`jis83`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that the JIS X 0208:1983 standard for East Asian logographic glyphs
should be used.

    fontVariantEastAsian jis83

-}
jis83 : Value { provides | jis83 : Supported }
jis83 =
    Value "jis83"


{-| Sets the [`jis90`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that the JIS X 0208:1990 standard for East Asian logographic glyphs
should be used.

    fontVariantEastAsian jis90

-}
jis90 : Value { provides | jis90 : Supported }
jis90 =
    Value "jis90"


{-| Sets the [`jis04`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that the JIS X 0208:2004 standard for East Asian logographic glyphs
should be used.

    fontVariantEastAsian jis04

-}
jis04 : Value { provides | jis04 : Supported }
jis04 =
    Value "jis04"


{-| Sets the [`simplified`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that no particular standard should be used for East Asian logographic glyphs
apart from them being simplified Chinese glyphs.

    fontVariantEastAsian simplified

-}
simplified : Value { provides | simplified : Supported }
simplified =
    Value "simplified"


{-| Sets the [`traditional`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that no particular standard should be used for East Asian logographic glyphs
apart from them being traditional Chinese glyphs.

    fontVariantEastAsian traditional

-}
traditional : Value { provides | traditional : Supported }
traditional =
    Value "traditional"


{-| Sets the [`proportional-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This activates the East Asian characters that vary in width.

(As opposed to [`fullWidth`](#fullWidth), which specifies that they should roughly be the same width.)

    fontVariantEastAsian proportionalWidth

-}
proportionalWidth : Value { provides | proportionalWidth : Supported }
proportionalWidth =
    Value "proportional-width"



-- FONT VARIANT LIGATURES --

{-| A type that encapsulates all ligature font variant keywords plus additional types.
-}
type alias FontVariantLigaturesSupported supported =
    { supported
        | commonLigatures : Supported
        , noCommonLigatures : Supported
        , discretionaryLigatures : Supported
        , noDiscretionaryLigatures : Supported
        , historicalLigatures : Supported
        , noHistoricalLigatures : Supported
        , contextual : Supported
        , noContextual : Supported
    }


{-| Sets [`font-variant-ligatures`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures).

    fontVariantLigatures discretionaryLigatures

    fontVariantLigatures none

-}
fontVariantLigatures :
    BaseValue
        ( FontVariantLigaturesSupported
            { normal : Supported
            , none : Supported
            }
        )
    -> Style
fontVariantLigatures (Value str) =
    appendProperty ("font-variant-ligatures:" ++ str)


{-| The `common-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures commonLigatures

-}
commonLigatures : Value { provides | commonLigatures : Supported }
commonLigatures =
    Value "common-ligatures"


{-| The `no-common-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures noCommonLigatures

-}
noCommonLigatures : Value { provides | noCommonLigatures : Supported }
noCommonLigatures =
    Value "no-common-ligatures"


{-| The `discretionary-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures discretionaryLigatures

-}
discretionaryLigatures : Value { provides | discretionaryLigatures : Supported }
discretionaryLigatures =
    Value "discretionary-ligatures"


{-| The `no-discretionary-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures noDiscretionaryLigatures

-}
noDiscretionaryLigatures : Value { provides | noDiscretionaryLigatures : Supported }
noDiscretionaryLigatures =
    Value "no-discretionary-ligatures"


{-| The `historical-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures historicalLigatures

-}
historicalLigatures : Value { provides | historicalLigatures : Supported }
historicalLigatures =
    Value "historical-ligatures"


{-| The `no-historical-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures noHistoricalLigatures

-}
noHistoricalLigatures : Value { provides | noHistoricalLigatures : Supported }
noHistoricalLigatures =
    Value "no-historical-ligatures"


{-| The `contextual` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures contextual

-}
contextual : Value { provides | contextual : Supported }
contextual =
    Value "contextual"


{-| The `no-contextual` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures noContextual

-}
noContextual : Value { provides | noContextual : Supported }
noContextual =
    Value "no-contextual"



-- FONT VARIANT NUMERIC --


{-| A type that encapsulates all numeric font variant keywords plus additional types.
-}
type alias FontVariantNumericSupported supported =
    { supported
        | ordinal : Supported
        , slashedZero : Supported
        , liningNums : Supported
        , oldstyleNums : Supported
        , proportionalNums : Supported
        , tabularNums : Supported
        , diagonalFractions : Supported
        , stackedFractions : Supported
    }


{-| A type that encapsulates all numeric font variant keywords.
-}
type alias FontVariantNumeric =
    FontVariantNumericSupported {}


{-| Sets [`font-variant-numeric`](https://css-tricks.com/almanac/properties/f/font-variant-numeric/).

    fontVariantNumeric ordinal

    fontVariantNumericMany [ slashedZero liningNums ]

-}
fontVariantNumeric :
    BaseValue
        ( FontVariantNumericSupported
            { normal : Supported
            }
        )
    -> Style
fontVariantNumeric (Value str) =
    appendProperty ("font-variant-numeric:" ++ str)


{-| Sets [`font-variant-numeric`](https://css-tricks.com/almanac/properties/f/font-variant-numeric/).

This one can be tricky to use because many of the options are mutually exclusive.
For example, `normal` cannot be used with any of the others, so the only way
to get it from this function is to pass `Nothing` for everything. The other
arguments are chosen such that you can choose between the mutually exclusive
values, or leave that value off.

    fontVariantNumeric ordinal

    fontVariantNumeric4 Nothing Nothing Nothing Nothing -- "normal"

    fontVariantNumeric4
        (Just ordinal)
        Nothing
        (Just tabularNums)
        Nothing
        -- "ordinal tabular-nums"

-}
fontVariantNumeric4 :
    Maybe (Value { ordinal : Supported, slashedZero : Supported })
    -> Maybe (Value { liningNums : Supported, oldstyleNums : Supported })
    -> Maybe (Value { proportionalNums : Supported, tabularNums : Supported })
    -> Maybe (Value { diagonalFractions : Supported, stackedFractions : Supported })
    -> Style
fontVariantNumeric4 val1 val2 val3 val4 =
    let
        maybeValToString val =
            Maybe.map (\ (Value v) -> v ) val

        valueStr =
            case
                [ maybeValToString val1
                , maybeValToString val2
                , maybeValToString val3
                , maybeValToString val4
                ]
                    |> List.filterMap identity
            of
                [] ->
                    "normal"

                strings ->
                    String.join " " strings
    in
    appendProperty <| "font-variant-numeric:" ++ valueStr


{-| The `ordinal` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric ordinal

-}
ordinal : Value { provides | ordinal : Supported }
ordinal =
    Value "ordinal"


{-| The `slashed-zero` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric slashedZero

-}
slashedZero : Value { provides | slashedZero : Supported }
slashedZero =
    Value "slashed-zero"


{-| The `lining-nums` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric liningNums

-}
liningNums : Value { provides | liningNums : Supported }
liningNums =
    Value "lining-nums"


{-| The `oldstyle-nums` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric oldstyleNums

-}
oldstyleNums : Value { provides | oldstyleNums : Supported }
oldstyleNums =
    Value "oldstyle-nums"


{-| The `proportional-nums` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric proportionalNums

-}
proportionalNums : Value { provides | proportionalNums : Supported }
proportionalNums =
    Value "proportional-nums"


{-| The `tabular-nums` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric tabularNums

-}
tabularNums : Value { provides | tabularNums : Supported }
tabularNums =
    Value "tabular-nums"


{-| The `diagonal-fractions` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric diagonalFractions

-}
diagonalFractions : Value { provides | diagonalFractions : Supported }
diagonalFractions =
    Value "diagonal-fractions"


{-| The `stacked-fractions` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric stackedFractions

-}
stackedFractions : Value { provides | stackedFractions : Supported }
stackedFractions =
    Value "stacked-fractions"


{-| A type that encapsulates all emoji font variant keywords plus additional types.
-}
type alias FontVariantEmojiSupported supported =
    { supported
        | text : Supported
        , emoji : Supported
        , unicode : Supported
    }


{-| The [`font-variant-emoji`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-emoji)
property.

    fontVariantEmoji unset

    fontVariantEmoji emoji

    fontVariantEmoji normal
-}
fontVariantEmoji :
    BaseValue
        ( FontVariantEmojiSupported
            { normal : Supported
            }
        )
    -> Style
fontVariantEmoji (Value val) =
    appendProperty <| "font-variant-emoji:" ++ val


{-| The `emoji` value used with [`fontFamily`](#fontFamily), [`fontFamilyMany`](#fontFamilyMany) and [`fontVariantEmoji`](#fontVariantEmoji).

    fontFamily emoji

    fontVariantEmoji emoji
-}
emoji : Value { provides | emoji : Supported }
emoji =
    Value "emoji"


{-| The `unicode` value used with [`fontVariantEmoji`](#fontVariantEmoji).

    fontVariantEmoji unicode
-}
unicode : Value { provides | unicode : Supported }
unicode =
    Value "unicode"


{-| A type that encapsulates all position font variant keywords plus additional types.
-}
type alias FontVariantPositionSupported supported =
    { supported
        | sub : Supported
        , super : Supported

    }

{-| The [`font-variant-position`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-position) property.

    fontVariantPosition sub

    fontVariantPosition normal

-}
fontVariantPosition :
    BaseValue
        ( FontVariantPositionSupported
            { normal : Supported
            }
        )
    -> Style
fontVariantPosition (Value val) =
    appendProperty ("font-variant-position:" ++ val)


{-| The [`font-kerning`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-kerning) property.

    fontKerning none

-}
fontKerning :
    BaseValue
        { none : Supported
        , auto : Supported
        , normal : Supported
        }
    -> Style
fontKerning (Value val) =
    appendProperty ("font-kerning:" ++ val)


{-| The [`font-language-override`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-language-override) property.

    fontLanguageOverride normal

    fontLanguageOverride (string "ENG")

-}
fontLanguageOverride :
    BaseValue
        { normal : Supported
        , string : Supported
        }
    -> Style
fontLanguageOverride (Value val) =
    appendProperty ("font-language-override:" ++ val)


{-| The [`font-optical-sizing`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-optical-sizing) property.

    fontOpticalSizing none

-}
fontOpticalSizing :
    BaseValue
        { none : Supported
        , auto : Supported
        }
    -> Style
fontOpticalSizing (Value val) =
    appendProperty ("font-optical-sizing:" ++ val)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------- TYPOGRAPHIC METRICS ----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`line-height`](https://css-tricks.com/almanac/properties/l/line-height/)

    lineHeight (pct 150)

    lineHeight (em 2)

    lineHeight (num 1.5)

    lineHeight normal

-}
lineHeight :
    BaseValue
        (LengthSupported
            { pct : Supported
            , normal : Supported
            , num : Supported
            }
        )
    -> Style
lineHeight (Value val) =
    appendProperty ("line-height:" ++ val)


{-| Sets [`letter-spacing`](https://css-tricks.com/almanac/properties/l/letter-spacing/)

    letterSpacing (pct 150)

    letterSpacing (em 2)

    letterSpacing (num 1.5)

    letterSpacing normal

-}
letterSpacing :
    BaseValue
        (LengthSupported
            { normal : Supported
            }
        )
    -> Style
letterSpacing (Value val) =
    appendProperty ("letter-spacing:" ++ val)


{-| The [`text-indent`](https://css-tricks.com/almanac/properties/t/text-indent/) property.

    textIndent (em 1.5)

-}
textIndent : BaseValue (LengthSupported { pct : Supported }) -> Style
textIndent (Value val) =
    appendProperty ("text-indent:" ++ val)


{-| The [`text-indent`](https://css-tricks.com/almanac/properties/t/text-indent/) property.

    textIndent2 (em 1.5) hanging

-}
textIndent2 :
    Value (LengthSupported { pct : Supported })
    ->
        Value
            { hanging : Supported
            , eachLine : Supported
            }
    -> Style
textIndent2 (Value lengthVal) (Value optionVal) =
    appendProperty ("text-indent:" ++ lengthVal ++ " " ++ optionVal)


{-| The [`text-indent`](https://css-tricks.com/almanac/properties/t/text-indent/) property.

    textIndent3 (em 1.5) hanging eachLine

-}
textIndent3 :
    Value (LengthSupported { pct : Supported })
    -> Value { hanging : Supported }
    -> Value { eachLine : Supported }
    -> Style
textIndent3 (Value lengthVal) (Value hangingVal) (Value eachLineVal) =
    appendProperty
        ("text-indent:"
            ++ lengthVal
            ++ " "
            ++ hangingVal
            ++ " "
            ++ eachLineVal
        )


{-| The `hanging` value used for properties such as [`textIdent2`](#textIdent2).

    textIdent2 (px 20) hanging

-}
hanging : Value { provides | hanging : Supported }
hanging =
    Value "hanging"


{-| The `each-line` value used for properties such as [`textIdent2`](#textIdent2).

    textIdent2 (px 20) eachLine

-}
eachLine : Value { provides | eachLine : Supported }
eachLine =
    Value "each-line"


{-| Sets [`word-spacing`](https://css-tricks.com/almanac/properties/w/word-spacing/).

    wordSpacing normal

    wordSpacing zero

    wordSpacing (px 5)

-}
wordSpacing :
    BaseValue
        (LengthSupported
            { normal : Supported
            , pct : Supported
            }
        )
    -> Style
wordSpacing (Value str) =
    appendProperty ("word-spacing:" ++ str)


{-| Sets [`tab-size`](https://css-tricks.com/almanac/properties/t/tab-size/)
**Note:** only positive integer values are allowed.

    tabSize (int 4)

-}
tabSize :
    BaseValue
        (LengthSupported
            { int : Supported
            }
        )
    -> Style
tabSize (Value val) =
    appendProperty ("tab-size:" ++ val)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
---------------- TEXT WRAPPING, OVERFLOW AND NEWLINES ------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------



{-| Sets [`word-break`](https://css-tricks.com/almanac/properties/w/word-break/)

**Note: `breakWord` has been deprecated.**

      wordBreak normal
      wordBreak breakAll
      wordBreak keepAll
      wordBreak breakWord

-}
wordBreak :
    BaseValue
        { normal : Supported
        , breakAll : Supported
        , keepAll : Supported
        , breakWord : Supported
        }
    -> Style
wordBreak (Value str) =
    appendProperty ("word-break:" ++ str)


{-| A `breakAll` value for the [`word-break`](https://css-tricks.com/almanac/properties/w/word-break/) property.

      wordBreak breakAll

-}
breakAll : Value { provides | breakAll : Supported }
breakAll =
    Value "break-all"


{-| A `keepAll` value for the [`word-break`](https://css-tricks.com/almanac/properties/w/word-break/) property.

      wordBreak keepAll

-}
keepAll : Value { provides | keepAll : Supported }
keepAll =
    Value "keep-all"


{-| Sets the [`lineBreak`](https://css-tricks.com/almanac/properties/l/line-break/) property.

    lineBreak auto

    lineBreak strict

-}
lineBreak :
    BaseValue
        { auto : Supported
        , loose : Supported
        , normal : Supported
        , strict : Supported
        , anywhere : Supported
        }
    -> Style
lineBreak (Value value) =
    appendProperty ("line-break:" ++ value)


{-| Sets `loose` value for usage with [`lineBreak`](#lineBreak).

    lineBreak loose

-}
loose : Value { provides | loose : Supported }
loose =
    Value "loose"


{-| Sets [`white-space`](https://css-tricks.com/almanac/properties/w/whitespace/)

    whiteSpace pre

    whiteSpace nowrap

    whiteSpace preWrap

    whiteSpace preLine

-}
whiteSpace :
    BaseValue
        { normal : Supported
        , nowrap : Supported
        , pre : Supported
        , preWrap : Supported
        , preLine : Supported
        , breakSpaces : Supported
        }
    -> Style
whiteSpace (Value str) =
    appendProperty ("white-space:" ++ str)


{-| A `pre` value for the [`white-space`](#whiteSpace) property.

    whiteSpace pre

-}
pre : Value { provides | pre : Supported }
pre =
    Value "pre"


{-| A `pre-wrap` value for the [`white-space`](#whiteSpace) property.

    whiteSpace preWrap

-}
preWrap : Value { provides | preWrap : Supported }
preWrap =
    Value "pre-wrap"


{-| A `pre-line` value for the [`white-space`](#whiteSpace) property.

    whiteSpace preLine

-}
preLine : Value { provides | preLine : Supported }
preLine =
    Value "pre-line"

{-| A `break-spaces` value for the [`white-space`](#whiteSpace) property.

    whiteSpace breakSpaces

-}
breakSpaces : Value { provides | breakSpaces : Supported }
breakSpaces =
    Value "break-spaces"


{-| Sets the [`text-overflow`](https://css-tricks.com/almanac/properties/t/text-overflow/) property.

`text-overflow` describes how text that gets cut off is signalled to users.

When the one-argument version is used, it sets the end of text (right end for LTR users) that is cut off.

    textOverflow ellipsis

When the two-argument version is used, it specifies how the
text cut-off is displayed at the start (left in LTR) and
the end (right in LTR) of the text.

    textOverflow2 ellipsis ellipsis

-}
textOverflow :
    BaseValue
        { clip : Supported
        , ellipsis : Supported
        }
    -> Style
textOverflow (Value value) =
    appendProperty ("text-overflow:" ++ value)


{-| Sets the [`text-overflow`](https://css-tricks.com/almanac/properties/t/text-overflow/) property.

`text-overflow` describes how text that gets cut off is signalled to users.

This version specifies how the text cut-off is displayed at the start
(left in LTR) and at the end (right in LTR) of the text.

    textOverflow2 ellipsis ellipsis

-}
textOverflow2 :
    Value
        { clip : Supported
        , ellipsis : Supported
        }
    ->
        Value
            { clip : Supported
            , ellipsis : Supported
            }
    -> Style
textOverflow2 (Value startValue) (Value endValue) =
    appendProperty ("text-overflow:" ++ startValue ++ " " ++ endValue)


{-| Sets `ellipsis` value for usage with [`textOverflow`](#textOverflow).

    textOverflow ellipsis

-}
ellipsis : Value { provides | ellipsis : Supported }
ellipsis =
    Value "ellipsis"


{-| Sets [`hyphens`](https://css-tricks.com/almanac/properties/h/hyphens/)

    hyphens none

    hyphens manual

    hyphens auto

-}
hyphens :
    BaseValue
        { none : Supported
        , manual : Supported
        , auto : Supported
        }
    -> Style
hyphens (Value val) =
    appendProperty ("hyphens:" ++ val)


{-| Sets `manual` value for usage with [`hyphens`](#hyphens).

    hyphens manual

-}
manual : Value { provides | manual : Supported }
manual =
    Value "manual"


{-| Sets [`hanging-punctuation`](https://css-tricks.com/almanac/properties/h/hanging-punctuation/)

    hangingPunctuation none

    hangingPunctuation first_

    hangingPunctuation2 first_ forceEnd

    hangingPunctuation3 first_ allowEnd last

-}
hangingPunctuation :
    BaseValue
        { none : Supported
        , first_ : Supported
        , forceEnd : Supported
        , allowEnd : Supported
        , last : Supported
        }
    -> Style
hangingPunctuation (Value val) =
    appendProperty ("hanging-punctuation:" ++ val)


{-| Sets [`hanging-punctuation`](https://css-tricks.com/almanac/properties/h/hanging-punctuation/)

`first_ first_`, `last first` and `last last` are invalid combinations.

    hangingPunctuation2 first_ forceEnd

-}
hangingPunctuation2 :
    Value
        { first_ : Supported
        , last : Supported
        }
    ->
        Value
            { first_ : Supported
            , forceEnd : Supported
            , allowEnd : Supported
            , last : Supported
            }
    -> Style
hangingPunctuation2 (Value val1) (Value val2) =
    appendProperty ("hanging-punctuation:" ++ val1 ++ " " ++ val2)


{-| Sets [`hanging-punctuation`](https://css-tricks.com/almanac/properties/h/hanging-punctuation/)

    hangingPunctuation3 first_ allowEnd last

-}
hangingPunctuation3 :
    Value
        { first_ : Supported
        }
    ->
        Value
            { forceEnd : Supported
            , allowEnd : Supported
            }
    ->
        Value
            { last : Supported
            }
    -> Style
hangingPunctuation3 (Value val1) (Value val2) (Value val3) =
    appendProperty ("hanging-punctuation:" ++ val1 ++ " " ++ val2 ++ " " ++ val3)


{-| Sets `first` value for usage with [`hangingPunctuation`](#hangingPunctuation).

      hangingPunctuation first_


This is called `first_` instead of `first` because
[`first` is already a pseudo-class function](#first).

-}
first_ : Value { provides | first_ : Supported }
first_ =
    Value "first"


{-| Sets `last` value for usage with [`hangingPunctuation`](#hangingPunctuation).

      hangingPunctuation last

-}
last : Value { provides | last : Supported }
last =
    Value "last"


{-| Sets `force-end` value for usage with [`hangingPunctuation`](#hangingPunctuation).

      hangingPunctuation forceEnd

-}
forceEnd : Value { provides | forceEnd : Supported }
forceEnd =
    Value "force-end"


{-| Sets `allow-end` value for usage with [`hangingPunctuation`](#hangingPunctuation).

      hangingPunctuation allowEnd

-}
allowEnd : Value { provides | allowEnd : Supported }
allowEnd =
    Value "allow-end"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------- TEXT TRANSFORM + DECORATION ----------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`text-decoration`][text-decoration] shorthand property.

    textDecoration underline

[text-decoration]: https://css-tricks.com/almanac/properties/t/text-decoration/

-}
textDecoration :
    BaseValue
        (ColorSupported
            { none : Supported
            , underline : Supported
            , overline : Supported
            , lineThrough : Supported
            , solid : Supported
            , double : Supported
            , dotted : Supported
            , dashed : Supported
            , wavy : Supported
            }
        )
    -> Style
textDecoration (Value line) =
    appendProperty ("text-decoration:" ++ line)


{-| Sets [`text-decoration`][text-decoration] property.

    textDecoration2 underline dotted

[text-decoration]: https://css-tricks.com/almanac/properties/t/text-decoration/

-}
textDecoration2 :
    Value
        { none : Supported
        , underline : Supported
        , overline : Supported
        , lineThrough : Supported
        }
    ->
        Value
            { solid : Supported
            , double : Supported
            , dotted : Supported
            , dashed : Supported
            , wavy : Supported
            }
    -> Style
textDecoration2 (Value line) (Value styleVal) =
    appendProperty ("text-decoration:" ++ line ++ " " ++ styleVal)


{-| Sets [`text-decoration`][text-decoration] property.

    textDecoration3 underline dotted (hex "#cf0")

[text-decoration]: https://css-tricks.com/almanac/properties/t/text-decoration/

-}
textDecoration3 :
    Value
        { none : Supported
        , underline : Supported
        , overline : Supported
        , lineThrough : Supported
        }
    ->
        Value
            { solid : Supported
            , double : Supported
            , dotted : Supported
            , dashed : Supported
            , wavy : Supported
            }
    -> Value Color
    -> Style
textDecoration3 (Value line) (Value styleVal) (Value colorVal) =
    appendProperty ("text-decoration:" ++ line ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`text-decoration-line`][text-decoration-line] property.

    textDecorationLine underline

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/

-}
textDecorationLine :
    BaseValue
        { none : Supported
        , underline : Supported
        , overline : Supported
        , lineThrough : Supported
        }
    -> Style
textDecorationLine (Value line) =
    appendProperty ("text-decoration-line:" ++ line)


{-| Sets [`text-decoration-line`][text-decoration-line] property.

    textDecorationLine2 underline overline

**Note:** The first and second argument **MUST NOT** be the same.

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/

-}
textDecorationLine2 :
    Value
        { underline : Supported
        , overline : Supported
        , lineThrough : Supported
        }
    ->
        Value
            { underline : Supported
            , overline : Supported
            , lineThrough : Supported
            }
    -> Style
textDecorationLine2 (Value line1) (Value line2) =
    appendProperty ("text-decoration-line:" ++ line1 ++ " " ++ line2)


{-| Sets [`text-decoration-line`][text-decoration-line] property.

    textDecorationLine3 underline overline lineThrough

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/

-}
textDecorationLine3 :
    Value { underline : Supported }
    -> Value { overline : Supported }
    -> Value { lineThrough : Supported }
    -> Style
textDecorationLine3 (Value line1) (Value line2) (Value line3) =
    appendProperty ("text-decoration-line:" ++ line1 ++ " " ++ line2 ++ " " ++ line3)


{-| Sets [`text-decoration-style`][text-decoration-style] property.

    textDecorationStyle wavy

[text-decoration-style]: https://css-tricks.com/almanac/properties/t/text-decoration-style/

-}
textDecorationStyle :
    BaseValue
        { solid : Supported
        , double : Supported
        , dotted : Supported
        , dashed : Supported
        , wavy : Supported
        }
    -> Style
textDecorationStyle (Value styleVal) =
    appendProperty ("text-decoration-style:" ++ styleVal)


{-| The `wavy` [`text-decoration-style`][text-decoration-style] value.

    textDecorationStyle wavy

[text-decoration-style]: https://css-tricks.com/almanac/properties/t/text-decoration-style/#article-header-id-0

-}
wavy : Value { provides | wavy : Supported }
wavy =
    Value "wavy"


{-| The `underline` [`text-decoration-line`][text-decoration-line] value.

    textDecorationLine underline

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/#article-header-id-0

-}
underline : Value { provides | underline : Supported }
underline =
    Value "underline"


{-| The `overline` [`text-decoration-line`][text-decoration-line] value.

    textDecorationLine overline

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/#article-header-id-0

-}
overline : Value { provides | overline : Supported }
overline =
    Value "overline"


{-| The `line-through` [`text-decoration-line`][text-decoration-line] value.

    textDecorationLine lineThrough

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/#article-header-id-0

-}
lineThrough : Value { provides | lineThrough : Supported }
lineThrough =
    Value "line-through"


{-| Sets [`text-decoration-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-color) property.

    textDecorationColor (hex "#0cf")

-}
textDecorationColor :
    BaseValue
        ( ColorSupported
            { transparent : Supported
            }
        )
    -> Style
textDecorationColor (Value colorVal) =
    appendProperty ("text-decoration-color:" ++ colorVal)


{-| Sets the `transparent` value for usage with [`textDecorationColor`](#textDecorationColor).

    textDecorationColor transparent

-}
transparent : Value { provides | transparent : Supported }
transparent =
    Value "transparent"


{-| Sets the [`text-decoration-thickness`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-thickness) property.

    textDecorationThickness (pct 10)

-}
textDecorationThickness :
    BaseValue
        ( LengthSupported
            { pct : Supported
            , auto : Supported
            , fromFont : Supported
            }
        )
    -> Style
textDecorationThickness (Value value) =
    appendProperty ("text-decoration-thickness:" ++ value)


{-| Sets the `from-font` value for usage with [`textDecorationThickness`](#textDecorationThickness).

    textDecorationThickness fromFont

-}
fromFont : Value { provides | fromFont : Supported }
fromFont =
    Value "from-font"


{-| Sets [`text-decoration-skip-ink`](https://css-tricks.com/almanac/properties/t/text-decoration-skip-ink/) property.

    textDecorationSkipInk auto

    textDecorationSkipInk all_

    textDecorationSkipInk none

-}
textDecorationSkipInk :
    BaseValue
        { auto : Supported
        , all_ : Supported
        , none : Supported
        }
    -> Style
textDecorationSkipInk (Value val) =
    appendProperty ("text-decoration-skip-ink:" ++ val)


{-| Sets [`text-underline-position`](https://css-tricks.com/almanac/properties/t/text-underline-position/)

    textUnderlinePosition auto

    textUnderlinePosition under

    textUnderlinePosition left_

    textUnderlinePosition right_

-}
textUnderlinePosition :
    BaseValue
        { auto : Supported
        , under : Supported
        , left_ : Supported
        , right_ : Supported
        }
    -> Style
textUnderlinePosition (Value val) =
    appendProperty ("text-underline-position:" ++ val)


{-| Sets [`text-underline-position`](https://css-tricks.com/almanac/properties/t/text-underline-position/)

    textUnderlinePosition2 under left_

    textUnderlinePosition2 under right_

-}
textUnderlinePosition2 :
    Value { under : Supported }
    ->
        Value
            { left_ : Supported
            , right_ : Supported
            }
    -> Style
textUnderlinePosition2 (Value underVal) (Value val) =
    appendProperty ("text-underline-position:" ++ underVal ++ " " ++ val)


{-| Sets the [text-underline-offset](https://css-tricks.com/almanac/properties/t/text-underline-offset/) property.

    textUnderlineOffset (pct 5)
-}
textUnderlineOffset :
    BaseValue
        ( LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
textUnderlineOffset (Value value) =
    appendProperty ("text-underline-offset:" ++ value)


{-| Sets the [`text-emphasis`](https://css-tricks.com/almanac/properties/t/text-emphasis/) property.

This is for drawing attention towards textual elements in a way that is commonly
used in East Asian languages.

String values should only be one character in length.

    textEmphasis (hex "ff0000")

    textEmphasis sesame

    textEmphasis2 triangle (hex "00ff00")

    textEmphasis3 filled dot (hex "ff0000")

-}
textEmphasis :
    BaseValue
        (ColorSupported
            { none : Supported
            , filled : Supported
            , open : Supported
            , dot : Supported
            , circle_ : Supported
            , doubleCircle : Supported
            , triangle : Supported
            , sesame : Supported
            , string : Supported
            }
        )
    -> Style
textEmphasis (Value value) =
    appendProperty ("text-emphasis:" ++ value)


{-| Sets the [`text-emphasis`](https://css-tricks.com/almanac/properties/t/text-emphasis/) property.

This 2-argument form sets [`textEmphasisStyle`](#textEmphasisStyle) and [`textEmphasisColor`](#textEmphasisColor) in a single declaration.

String values should only be one character in length.

    textEmphasis (hex "ff0000")

    textEmphasis sesame

    textEmphasis2 triangle (hex "00ff00")

    textEmphasis3 filled dot (hex "ff0000")
-}
textEmphasis2 :
    Value
        { none : Supported
        , filled : Supported
        , open : Supported
        , dot : Supported
        , circle_ : Supported
        , doubleCircle : Supported
        , triangle : Supported
        , sesame : Supported
        , string : Supported
        }
    ->
        Value
            (Color)
    -> Style
textEmphasis2 (Value value1) (Value value2) =
    appendProperty
        ("text-emphasis:"
            ++ value1
            ++ " "
            ++ value2
        )

{-| Sets the [`text-emphasis`](https://css-tricks.com/almanac/properties/t/text-emphasis/) property.

This 3-argument form sets [`textEmphasisStyle2`](#textEmphasisStyle2) and a [`textEmphasisColor`](#textEmphasisColor) in a single declaration.

    textEmphasis (hex "ff0000")

    textEmphasis sesame

    textEmphasis2 triangle (hex "00ff00")

    textEmphasis3 filled dot (hex "ff0000")

-}
textEmphasis3 :
    BaseValue
        { filled : Supported
        , open : Supported
        }
    -> BaseValue
        { dot : Supported
        , circle_ : Supported
        , doubleCircle : Supported
        , triangle : Supported
        , sesame : Supported
        }
    ->
        Value
            (Color)
    -> Style
textEmphasis3 (Value value1) (Value value2) (Value value3) =
    appendProperty
        ("text-emphasis:"
            ++ value1
            ++ " "
            ++ value2
            ++ " "
            ++ value3
        )


{-| Sets the [`text-emphasis-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-emphasis-style) property.

String values should only be one character in length.

    textEmphasisStyle none

    textEmphasisStyle open

    textEmphasisStyle (string "🐯")
-}
textEmphasisStyle :
    BaseValue
        { none : Supported
        , filled : Supported
        , open : Supported
        , dot : Supported
        , circle_ : Supported
        , doubleCircle : Supported
        , triangle : Supported
        , sesame : Supported
        , string : Supported
        }
    -> Style
textEmphasisStyle (Value value) =
    appendProperty ("text-emphasis-style:" ++ value)


{-| Sets the [`text-emphasis-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-emphasis-style) property when you want to use two arguments - one for `filled` or `open`, and one for the shape style.

    textEmphasisStyle filled sesame

    textEmphasisStyle open dot
-}
textEmphasisStyle2 :
    Value
        { filled : Supported
        , open : Supported
        }
    -> Value
        { dot : Supported
        , circle_ : Supported
        , doubleCircle : Supported
        , triangle : Supported
        , sesame : Supported
        }
    -> Style
textEmphasisStyle2 (Value val1) (Value val2) =
    appendProperty
        ("text-emphasis-style:"
        ++ val1
        ++ " "
        ++ val2
        )


{-| Sets the [`text-emphasis-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-emphasis-color) property.

    textEmphasisColor currentcolor

    textEmphasisColor (hex "0000ff")

    textEmphasisColor transparent
-}
textEmphasisColor :
    BaseValue
        ( ColorSupported
            { transparent : Supported }
        )
    -> Style
textEmphasisColor (Value value) =
    appendProperty ("text-emphasis-color:" ++ value)


{-| Sets the [`text-emphasis-position`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-emphasis-position) property.

This is the one argument version, which is limited to setting global values.

If you want to specify the positions of the text-emphasis, you must use the [2-argument form](#textEmphasisPosition2).

    textEmphasisPosition inherit

    textEmphasisPosition revert

    textEmphasisPosition2 over left_

    textEmphasisPosition2 under right_

-}
textEmphasisPosition :
    BaseValue a
    -> Style
textEmphasisPosition (Value value) =
    appendProperty ("text-emphasis-position:" ++ value)


{-| Sets the the [`text-emphasis-position`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-emphasis-position) property.

This is the 2-argument form that lets you specify the positions of the emphasis.

if you want to apply global values, you must use the [1-argument form](#textEmphasisPosition).

    textEmphasisPosition inherit

    textEmphasisPosition revert

    textEmphasisPosition2 over left_

    textEmphasisPosition2 under right_

-}
textEmphasisPosition2 :
    BaseValue
        { over : Supported
        , under : Supported
        }
    -> BaseValue
        { left_ : Supported
        , right_ : Supported
        }
    -> Style
textEmphasisPosition2 (Value val1) (Value val2) =
    appendProperty
        ("text-emphasis-position:"
        ++ val1
        ++ " "
        ++ val2
        )


{-| The `filled` value used in [`textEmphasis`](#textEmphasis).

    textEmphasis filled

-}
filled : Value { provides | filled : Supported }
filled =
    Value "filled"


{-| The `open` value used in [`textEmphasis`](#textEmphasis).

    textEmphasis open

-}
open : Value { provides | open : Supported }
open =
    Value "open"


{-| The `dot` value used in [`textEmphasis`](#textEmphasis).

    textEmphasis dot

-}
dot : Value { provides | dot : Supported }
dot =
    Value "dot"


{-| The `doubleCircle` value used in [`textEmphasis`](#textEmphasis).

    textEmphasis doubleCircle

-}
doubleCircle : Value { provides | doubleCircle : Supported }
doubleCircle =
    Value "double-circle"


{-| The `triangle` value used in [`textEmphasis`](#textEmphasis).

    textEmphasis triangle

-}
triangle : Value { provides | triangle : Supported }
triangle =
    Value "triangle"


{-| The `sesame` value used in [`textEmphasis`](#textEmphasis).

    textEmphasis sesame

-}
sesame : Value { provides | sesame : Supported }
sesame =
    Value "sesame"


{-| The `over` value used in [`textEmphasisPosition2`](#textEmphasisPosition2).

    textEmphasisPosition2 over left_

-}
over : Value { provides | over : Supported }
over =
    Value "over"


{-| Sets [`text-transform`](https://css-tricks.com/almanac/properties/t/text-transform/).

    textTransform capitalize

    textTransform uppercase

-}
textTransform :
    BaseValue
        { capitalize : Supported
        , uppercase : Supported
        , lowercase : Supported
        , fullWidth : Supported
        , fullSizeKana : Supported
        , none : Supported
        }
    -> Style
textTransform (Value str) =
    appendProperty ("text-transform:" ++ str)


{-| A `capitalize` value for the [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Syntax) property.

    textTransform capitalize

-}
capitalize : Value { provides | capitalize : Supported }
capitalize =
    Value "capitalize"


{-| An `uppercase` value for the [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Syntax) property.

    textTransform uppercase

-}
uppercase : Value { provides | uppercase : Supported }
uppercase =
    Value "uppercase"


{-| A `lowercase` value for the [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Syntax) property.

    textTransform lowercase

-}
lowercase : Value { provides | lowercase : Supported }
lowercase =
    Value "lowercase"


{-| The `full-size-kana` value used by [`textTransform`](#textTransform)

textTransform fullSizeKana

-}
fullSizeKana : Value { provedes | fullSizeKana : Supported }
fullSizeKana =
    Value "full-size-kana"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------ TEXT ALIGNMENT AND JUSTIFICATION --------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`text-align`](https://css-tricks.com/almanac/properties/t/text-align/)

    textAlign left_

    textAlign justfy

-}
textAlign :
    BaseValue
        { left_ : Supported
        , right_ : Supported
        , center : Supported
        , justify : Supported
        , start : Supported
        , end : Supported
        , matchParent : Supported
        }
    -> Style
textAlign (Value str) =
    appendProperty ("text-align:" ++ str)


{-| A `justify` value for the [`text-align`](https://css-tricks.com/almanac/properties/t/text-align/)

    textAlign justify

-}
justify : Value { provides | justify : Supported }
justify =
    Value "justify"



{-| Sets [`text-justify`](https://css-tricks.com/almanac/properties/t/text-justify/)

    textJustify interWord

    textJustify interCharacter

    textJustify auto

    textJustify none

-}
textJustify :
    BaseValue
        { interWord : Supported
        , interCharacter : Supported
        , auto : Supported
        , none : Supported
        }
    -> Style
textJustify (Value val) =
    appendProperty ("text-justify:" ++ val)


{-| A `inter-word` value for the [`textJustify`](#textJustify) property.

    textJustify interWord

-}
interWord : Value { provides | interWord : Supported }
interWord =
    Value "inter-word"


{-| A `inter-character` value for the [`textJustify`](#textJustify) property.

    textJustify interCharacter

-}
interCharacter : Value { provides | interCharacter : Supported }
interCharacter =
    Value "inter-character"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
---------------------------- SCRIPT HANDLING ---------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`direction`](https://css-tricks.com/almanac/properties/d/direction/)

    direction ltr

    direction rtl

-}
direction :
    BaseValue
        { rtl : Supported
        , ltr : Supported
        }
    -> Style
direction (Value str) =
    appendProperty ("direction:" ++ str)


{-| A `ltr` value for the [`direction`](https://css-tricks.com/almanac/properties/d/direction/) property.

    direction ltr

-}
ltr : Value { provides | ltr : Supported }
ltr =
    Value "ltr"


{-| A `rtl` value for the [`direction`](https://css-tricks.com/almanac/properties/d/direction/) property.

    direction rtl

-}
rtl : Value { provides | rtl : Supported }
rtl =
    Value "rtl"


{-| Sets [`writing-mode`](https://css-tricks.com/almanac/properties/w/writing-mode/).

    writingMode horizontalTb

    writingMode verticalRl

    writingMode verticalLr

-}
writingMode :
    BaseValue
        { horizontalTb : Supported
        , verticalRl : Supported
        , verticalLr : Supported
        }
    -> Style
writingMode (Value str) =
    appendProperty ("writing-mode:" ++ str)


{-| Sets `horizontal-tb` value for usage with [`writingMode`](#writingMode).

    writingMode horizontalTb

-}
horizontalTb : Value { provides | horizontalTb : Supported }
horizontalTb =
    Value "horizontal-tb"


{-| Sets `vertical-lr` value for usage with [`writingMode`](#writingMode).

    writingMode verticalLr

-}
verticalLr : Value { provides | verticalLr : Supported }
verticalLr =
    Value "vertical-lr"


{-| Sets `vertical-rl` value for usage with [`writingMode`](#writingMode).

    writingMode verticalRl

-}
verticalRl : Value { provides | verticalRl : Supported }
verticalRl =
    Value "vertical-rl"


{-| Sets [`unicode-bidi`](https://css-tricks.com/almanac/properties/u/unicode-bidi/)

    unicodeBidi normal

    unicodeBidi embed

    unicodeBidi isolate

    unicodeBidi bidiOverride

    unicodeBidi isolateOverride

    unicodeBidi plaintext

-}
unicodeBidi :
    BaseValue
        { normal : Supported
        , embed : Supported
        , isolate : Supported
        , bidiOverride : Supported
        , isolateOverride : Supported
        , plaintext : Supported
        }
    -> Style
unicodeBidi (Value val) =
    appendProperty ("unicode-bidi:" ++ val)


{-| Sets `embed` value for usage with [`unicodeBidi`](#unicodeBidi).

    unicodeBidi embed

-}
embed : Value { provides | embed : Supported }
embed =
    Value "embed"


{-| Sets `plaintext` value for usage with [`unicodeBidi`](#unicodeBidi).

    unicodeBidi plaintext

-}
plaintext : Value { provides | plaintext : Supported }
plaintext =
    Value "plaintext"


{-| Sets `bidi-override` value for usage with [`unicodeBidi`](#unicodeBidi).

    unicodeBidi bidiOverride

-}
bidiOverride : Value { provides | bidiOverride : Supported }
bidiOverride =
    Value "bidi-override"


{-| Sets `isolate-override` value for usage with [`unicodeBidi`](#unicodeBidi).

    unicodeBidi isolateOverride

-}
isolateOverride : Value { provides | isolateOverride : Supported }
isolateOverride =
    Value "isolate-override"


{-| Sets [`text-orientation`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientation).

    textOrientation sideways

    textOrientation upright

-}
textOrientation :
    BaseValue
        { mixed : Supported
        , sideways : Supported
        , sidewaysRight : Supported
        , upright : Supported
        , useGlyphOrientation : Supported
        }
    -> Style
textOrientation (Value str) =
    appendProperty ("text-orientation:" ++ str)


{-| A `mixed` value for the
[`textOrientation`](#textOrientation) property.

    textOrientation mixed

-}
mixed : Value { provides | mixed : Supported }
mixed =
    Value "mixed"


{-| A `sideways` value for the
[`textOrientation`](#textOrientation) property.

    textOrientation sideways

-}
sideways : Value { provides | sideways : Supported }
sideways =
    Value "sideways"


{-| A `sideways-right` value for the
[`textOrientation`](#textOrientation) property.

    textOrientation sidewaysRight

-}
sidewaysRight : Value { provides | sidewaysRight : Supported }
sidewaysRight =
    Value "sideways-right"


{-| A `upright` value for the
[`textOrientation`](#textOrientation) property.

    textOrientation upright

-}
upright : Value { provides | upright : Supported }
upright =
    Value "upright"


{-| A `use-glyph-orientation` value for the
[`textOrientation`](#textOrientation) property.

    textOrientation useGlyphOrientation

-}
useGlyphOrientation : Value { provides | useGlyphOrientation : Supported }
useGlyphOrientation =
    Value "use-glyph-orientation"


{-| Sets the [`quotes`](https://css-tricks.com/almanac/properties/q/quotes/) property.

This one-argument version can only use keyword or global values.

    quotes none

    quotes inherit

    quotes2 (string "\"") (string "\"")

    quotes4 (string "\"") (string "\"") (string "'") (string "'")

-}
quotes :
    BaseValue
        { none : Supported
        , auto : Supported
        }
    -> Style
quotes (Value val) =
    appendProperty ("quotes:" ++ val)


{-| Sets the [`quotes`](https://css-tricks.com/almanac/properties/q/quotes/) property.

This 2-argument version sets the starting and closing quotation marks for
a top-level quote (a quote that is not nested within another quote). It only accepts
string values.

    quotes auto

    quotes2 (string "\"") (string "\"") -- "Hey, this is a first-level quote."

    quotes2 (string "'") (string "'") -- 'Hey, this is a first-level quote.'

    quotes2 (string "«") (string "»") -- «Hey, this is a first-level quote.»

-}
quotes2 :
    Value
        { string : Supported
        }
    ->
        Value
            { string : Supported
            }
    -> Style
quotes2 (Value lv1StartQuote) (Value lv1EndQuote) =
    appendProperty ("quotes:" ++ lv1StartQuote ++ " " ++ lv1EndQuote)


{-| Sets the [`quotes`](https://css-tricks.com/almanac/properties/q/quotes/) property.

This 4-argument version sets the starting and closing quotation marks for both
a top-level quote and a nested quote. It only accepts
string values.

    quotes auto

    quotes2 (string "\"") (string "\"")

    -- "Hey, this is a first-level quote."


    quotes4 (string "\"") (string "\"") (string "\'") (string "\'")

    {- "Hey, this is a first-level quote.
    'And this is someone else I made up for
    a second-level quote!' Yeah, I did that!"
    -}

    quotes4 (string "«") (string "»") (string "👏") (string "🤔")

    {- «Hey, this is a first-level quote.
    👏And this is something else I made up for
    a second-level quote!🤔 Yeah, I did that!»
    -}

-}
quotes4 :
    Value
        { string : Supported
        }
    ->
        Value
            { string : Supported
            }
    ->
        Value
            { string : Supported
            }
    ->
        Value
            { string : Supported
            }
    -> Style
quotes4 (Value lv1StartQuote) (Value lv1EndQuote) (Value lv2StartQuote) (Value lv2EndQuote) =
    appendProperty ("quotes:" ++ lv1StartQuote ++ " " ++ lv1EndQuote ++ " " ++ lv2StartQuote ++ " " ++ lv2EndQuote)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------------- TEXT RENDERING -----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`text-rendering`](https://css-tricks.com/almanac/properties/t/text-rendering/).

    textRendering geometricPrecision

    textRendering optimizeSpeed

-}
textRendering :
    BaseValue
        { auto : Supported
        , geometricPrecision : Supported
        , optimizeLegibility : Supported
        , optimizeSpeed : Supported
        }
    -> Style
textRendering (Value str) =
    appendProperty ("text-rendering:" ++ str)


{-| A `geometricPrecision` value for the [`text-rendering`](https://css-tricks.com/almanac/properties/t/text-rendering/) property.

    textRendering geometricPrecision

-}
geometricPrecision : Value { provides | geometricPrecision : Supported }
geometricPrecision =
    Value "geometricPrecision"


{-| An `optimizeLegibility` value for the [`text-rendering`](https://css-tricks.com/almanac/properties/t/text-rendering/) property.

    textRendering optimizeLegibility

-}
optimizeLegibility : Value { provides | optimizeLegibility : Supported }
optimizeLegibility =
    Value "optimizeLegibility"


{-| An `optimizeSpeed` value for the [`text-rendering`](https://css-tricks.com/almanac/properties/t/text-rendering/) property.

    textRendering optimizeSpeed

-}
optimizeSpeed : Value { provides | optimizeSpeed : Supported }
optimizeSpeed =
    Value "optimizeSpeed"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------------- USER-SELECT ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`user-select`](https://css-tricks.com/almanac/properties/u/user-select/)

    userSelect none

    userSelect auto

    userSelect text

    userSelect contain_

    userSelect all_

-}
userSelect :
    BaseValue
        { none : Supported
        , auto : Supported
        , text : Supported
        , contain_ : Supported
        , all_ : Supported
        }
    -> Style
userSelect (Value val) =
    appendProperty ("user-select:" ++ val)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------ ACCESSIBILITY ---------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`speak`](https://css-tricks.com/almanac/properties/s/speak/)

    speak none

    speak normal

    speak spellOut

-}
speak :
    BaseValue
        { none : Supported
        , normal : Supported
        , spellOut : Supported
        }
    -> Style
speak (Value val) =
    appendProperty ("speak:" ++ val)


{-| Sets `spellOut` value for usage with [`speak`](#speak).

    speak spellOut

-}
spellOut : Value { provides | spellOut : Supported }
spellOut =
    Value "spell-out"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------ LIST STYLE ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A type alias used to accept a [list-style-type](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type)
among other values.

**Note:** The [`symbols()`](https://developer.mozilla.org/en-US/docs/Web/CSS/symbols()) function is not supported.
Use [`property`](#property) instead.

-}
type alias ListStyleTypeSupported supported =
    { supported
        | customIdent : Supported
        , string : Supported
        , none : Supported
        , arabicIndic : Supported
        , armenian : Supported
        , bengali : Supported
        , cambodian : Supported
        , circle_ : Supported
        , cjkDecimal : Supported
        , cjkEarthlyBranch : Supported
        , cjkHeavenlyStem : Supported
        , cjkIdeographic : Supported
        , decimal : Supported
        , decimalLeadingZero : Supported
        , devanagari : Supported
        , disc : Supported
        , disclosureClosed : Supported
        , disclosureOpen : Supported
        , ethiopicNumeric : Supported
        , georgian : Supported
        , gujarati : Supported
        , gurmukhi : Supported
        , hebrew : Supported
        , hiragana : Supported
        , hiraganaIroha : Supported
        , japaneseFormal : Supported
        , japaneseInformal : Supported
        , kannada : Supported
        , katakana : Supported
        , katakanaIroha : Supported
        , khmer : Supported
        , koreanHangulFormal : Supported
        , koreanHanjaFormal : Supported
        , koreanHanjaInformal : Supported
        , lao : Supported
        , lowerAlpha : Supported
        , lowerArmenian : Supported
        , lowerGreek : Supported
        , lowerLatin : Supported
        , lowerRoman : Supported
        , malayalam : Supported
        , monogolian : Supported
        , myanmar : Supported
        , oriya : Supported
        , persian : Supported
        , simpChineseFormal : Supported
        , simpChineseInformal : Supported
        , square : Supported
        , tamil : Supported
        , telugu : Supported
        , thai : Supported
        , tibetan : Supported
        , tradChineseFormal : Supported
        , tradChineseInformal : Supported
        , upperAlpha : Supported
        , upperArmenian : Supported
        , upperLatin : Supported
        , upperRoman : Supported
    }


{-| A type alias used to accept a [list-style-type](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type)
-}
type alias ListStyleType =
    ListStyleTypeSupported {}


{-| The [`list-style`](https://css-tricks.com/almanac/properties/l/list-style/) shorthand property.

    listStyle lowerAlpha

    listStyle outside

    listStyle (url "https://example.com")

-}
listStyle :
    BaseValue
        (ListStyleTypeSupported
            (ImageSupported { inside : Supported, outside : Supported })
        )
    -> Style
listStyle (Value val) =
    appendProperty ("list-style:" ++ val)


{-| The [`list-style`](https://css-tricks.com/almanac/properties/l/list-style/) shorthand property.

    listStlye2 lowerAlpha inside

For other combinations of two values please use the dedicated functions:
[`listStyleType`](#listStyleType),
[`listStlyePosition`](#listStlyePosition),
and [`listStyleImage`](#listStyleImage)

-}
listStyle2 :
    Value ListStyleType
    -> Value { inside : Supported, outside : Supported }
    -> Style
listStyle2 (Value typeVal) (Value positionVal) =
    appendProperty ("list-style:" ++ typeVal ++ " " ++ positionVal)


{-| The [`list-style`](https://css-tricks.com/almanac/properties/l/list-style/) shorthand property.

    listStyle3 arabic outside (url "https://example.com")

-}
listStyle3 :
    Value ListStyleType
    ->
        Value
            { inside : Supported
            , outside : Supported
            }
    -> Value (ImageSupported { none : Supported })
    -> Style
listStyle3 (Value typeVal) (Value positionVal) (Value imageVal) =
    appendProperty ("list-style:" ++ typeVal ++ " " ++ positionVal ++ " " ++ imageVal)


{-| The [`list-style-position`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-position) property

    listStylePosition inside

    listStylePosition outside

-}
listStylePosition :
    BaseValue
        { inside : Supported
        , outside : Supported
        }
    -> Style
listStylePosition (Value pos) =
    appendProperty ("list-style-position:" ++ pos)


{-| The `inside` value used for properties such as [`list-style-position`](#listStylePosition),
and [`listStyle`](#listStyle).

    listStylePosition inside

-}
inside : Value { provides | inside : Supported }
inside =
    Value "inside"


{-| The `inside` value used for properties such as [`list-style-position`](#listStylePosition),
and [`listStyle`](#listStyle).

    listStylePosition outside

-}
outside : Value { provides | outside : Supported }
outside =
    Value "outside"


{-| The [`list-style-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type) property.

    listStyleType decimalLeadingZero

-}
listStyleType : BaseValue ListStyleType -> Style
listStyleType (Value val) =
    appendProperty ("list-style-type:" ++ val)




{-| The [`list-style-image`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-image) property.

    listStyleImage (url "https://example.com")

-}
listStyleImage : BaseValue (ImageSupported { none : Supported }) -> Style
listStyleImage (Value val) =
    appendProperty ("list-style-image:" ++ val)



-- LIST STYLE TYPE --


{-| The `arabic-indic` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType arabicIndic

-}
arabicIndic : Value { provides | arabicIndic : Supported }
arabicIndic =
    Value "arabic-indic"


{-| The `armenian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType armenian

-}
armenian : Value { provides | armenian : Supported }
armenian =
    Value "armenian"


{-| The `bengali` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType bengali

-}
bengali : Value { provides | bengali : Supported }
bengali =
    Value "bengali"


{-| The `cambodian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType cambodian

-}
cambodian : Value { provides | cambodian : Supported }
cambodian =
    Value "cambodian"


{-| The `cjk-decimal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType cjkDecimal

-}
cjkDecimal : Value { provides | cjkDecimal : Supported }
cjkDecimal =
    Value "cjk-decimal"


{-| The `cjk-earthly-branch` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType cjkEarthlyBranch

-}
cjkEarthlyBranch : Value { provides | cjkEarthlyBranch : Supported }
cjkEarthlyBranch =
    Value "cjk-earthly-branch"


{-| The `cjk-heavenly-stem` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType cjkHeavenlyStem

-}
cjkHeavenlyStem : Value { provides | cjkHeavenlyStem : Supported }
cjkHeavenlyStem =
    Value "cjk-heavenly-stem"


{-| The `cjk-ideographic` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType cjkIdeographic

-}
cjkIdeographic : Value { provides | cjkIdeographic : Supported }
cjkIdeographic =
    Value "cjk-ideographic"


{-| The `decimal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType decimal

-}
decimal : Value { provides | decimal : Supported }
decimal =
    Value "decimal"


{-| The `decimal-leading-zero` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType decimalLeadingZero

-}
decimalLeadingZero : Value { provides | decimalLeadingZero : Supported }
decimalLeadingZero =
    Value "decimal-leading-zero"


{-| The `devanagari` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType devanagari

-}
devanagari : Value { provides | devanagari : Supported }
devanagari =
    Value "devanagari"


{-| The `disc` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType disc

-}
disc : Value { provides | disc : Supported }
disc =
    Value "disc"


{-| The `disclosure-closed` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType disclosureClosed

-}
disclosureClosed : Value { provides | disclosureClosed : Supported }
disclosureClosed =
    Value "disclosure-closed"


{-| The `disclosure-open` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType disclosureOpen

-}
disclosureOpen : Value { provides | disclosureOpen : Supported }
disclosureOpen =
    Value "disclosure-open"


{-| The `ethiopic-numeric` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType ethiopicNumeric

-}
ethiopicNumeric : Value { provides | ethiopicNumeric : Supported }
ethiopicNumeric =
    Value "ethiopic-numeric"


{-| The `georgian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType georgian

-}
georgian : Value { provides | georgian : Supported }
georgian =
    Value "georgian"


{-| The `gujarati` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType gujarati

-}
gujarati : Value { provides | gujarati : Supported }
gujarati =
    Value "gujarati"


{-| The `gurmukhi` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType gurmukhi

-}
gurmukhi : Value { provides | gurmukhi : Supported }
gurmukhi =
    Value "gurmukhi"


{-| The `hebrew` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType hebrew

-}
hebrew : Value { provides | hebrew : Supported }
hebrew =
    Value "hebrew"


{-| The `hiragana` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType hiragana

-}
hiragana : Value { provides | hiragana : Supported }
hiragana =
    Value "hiragana"


{-| The `hiragana-iroha` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType hiraganaIroha

-}
hiraganaIroha : Value { provides | hiraganaIroha : Supported }
hiraganaIroha =
    Value "hiragana-iroha"


{-| The `japanese-formal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType japaneseFormal

-}
japaneseFormal : Value { provides | japaneseFormal : Supported }
japaneseFormal =
    Value "japanese-formal"


{-| The `japanese-informal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType japaneseInformal

-}
japaneseInformal : Value { provides | japaneseInformal : Supported }
japaneseInformal =
    Value "japanese-informal"


{-| The `kannada` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType kannada

-}
kannada : Value { provides | kannada : Supported }
kannada =
    Value "kannada"


{-| The `katakana` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType katakana

-}
katakana : Value { provides | katakana : Supported }
katakana =
    Value "katakana"


{-| The `katakana-iroha` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType katakanaIroha

-}
katakanaIroha : Value { provides | katakanaIroha : Supported }
katakanaIroha =
    Value "katakana-iroha"


{-| The `khmer` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType khmer

-}
khmer : Value { provides | khmer : Supported }
khmer =
    Value "khmer"


{-| The `korean-hangul-formal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType koreanHangulFormal

-}
koreanHangulFormal : Value { provides | koreanHangulFormal : Supported }
koreanHangulFormal =
    Value "korean-hangul-formal"


{-| The `korean-hanja-formal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType koreanHanjaFormal

-}
koreanHanjaFormal : Value { provides | koreanHanjaFormal : Supported }
koreanHanjaFormal =
    Value "korean-hanja-formal"


{-| The `korean-hanja-informal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType koreanHanjaInformal

-}
koreanHanjaInformal : Value { provides | koreanHanjaInformal : Supported }
koreanHanjaInformal =
    Value "korean-hanja-informal"


{-| The `lao` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lao

-}
lao : Value { provides | lao : Supported }
lao =
    Value "lao"


{-| The `lower-alpha` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lowerAlpha

-}
lowerAlpha : Value { provides | lowerAlpha : Supported }
lowerAlpha =
    Value "lower-alpha"


{-| The `lower-armenian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lowerArmenian

-}
lowerArmenian : Value { provides | lowerArmenian : Supported }
lowerArmenian =
    Value "lower-armenian"


{-| The `lower-greek` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lowerGreek

-}
lowerGreek : Value { provides | lowerGreek : Supported }
lowerGreek =
    Value "lower-greek"


{-| The `lower-latin` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lowerLatin

-}
lowerLatin : Value { provides | lowerLatin : Supported }
lowerLatin =
    Value "lower-latin"


{-| The `lower-roman` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lowerRoman

-}
lowerRoman : Value { provides | lowerRoman : Supported }
lowerRoman =
    Value "lower-roman"


{-| The `malayalam` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType malayalam

-}
malayalam : Value { provides | malayalam : Supported }
malayalam =
    Value "malayalam"


{-| The `monogolian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType monogolian

-}
monogolian : Value { provides | monogolian : Supported }
monogolian =
    Value "monogolian"


{-| The `myanmar` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType myanmar

-}
myanmar : Value { provides | myanmar : Supported }
myanmar =
    Value "myanmar"


{-| The `oriya` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType oriya

-}
oriya : Value { provides | oriya : Supported }
oriya =
    Value "oriya"


{-| The `persian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType persian

-}
persian : Value { provides | persian : Supported }
persian =
    Value "persian"


{-| The `simp-chinese-formal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType simpChineseFormal

-}
simpChineseFormal : Value { provides | simpChineseFormal : Supported }
simpChineseFormal =
    Value "simp-chinese-formal"


{-| The `simp-chinese-informal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType simpChineseInformal

-}
simpChineseInformal : Value { provides | simpChineseInformal : Supported }
simpChineseInformal =
    Value "simp-chinese-informal"


{-| The `tamil` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType tamil

-}
tamil : Value { provides | tamil : Supported }
tamil =
    Value "tamil"


{-| The `telugu` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType telugu

-}
telugu : Value { provides | telugu : Supported }
telugu =
    Value "telugu"


{-| The `thai` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType thai

-}
thai : Value { provides | thai : Supported }
thai =
    Value "thai"


{-| The `tibetan` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType tibetan

-}
tibetan : Value { provides | tibetan : Supported }
tibetan =
    Value "tibetan"


{-| The `trad-chinese-formal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType tradChineseFormal

-}
tradChineseFormal : Value { provides | tradChineseFormal : Supported }
tradChineseFormal =
    Value "trad-chinese-formal"


{-| The `trad-chinese-informal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType tradChineseInformal

-}
tradChineseInformal : Value { provides | tradChineseInformal : Supported }
tradChineseInformal =
    Value "trad-chinese-informal"


{-| The `upper-alpha` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType upperAlpha

-}
upperAlpha : Value { provides | upperAlpha : Supported }
upperAlpha =
    Value "upper-alpha"


{-| The `upper-armenian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType upperArmenian

-}
upperArmenian : Value { provides | upperArmenian : Supported }
upperArmenian =
    Value "upper-armenian"


{-| The `upper-latin` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType upperLatin

-}
upperLatin : Value { provides | upperLatin : Supported }
upperLatin =
    Value "upper-latin"


{-| The `upper-roman` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType upperRoman

-}
upperRoman : Value { provides | upperRoman : Supported }
upperRoman =
    Value "upper-roman"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------ COLUMNS ---------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`columns`](https://css-tricks.com/almanac/properties/c/columns/)

    columns (px 300)

    columns (num 2)

    columns2 (px 300) (num 2)

-}
columns :
    BaseValue
        (LengthSupported
            { auto : Supported
            , num : Supported
            }
        )
    -> Style
columns (Value widthVal) =
    appendProperty ("columns:" ++ widthVal)


{-| Sets [`columns`](https://css-tricks.com/almanac/properties/c/columns/)

    columns (px 300)

    columns (num 2)

    columns2 (px 300) (num 2)

-}
columns2 :
    Value
        (LengthSupported
            { auto : Supported
            }
        )
    ->
        Value
            { auto : Supported
            , num : Supported
            }
    -> Style
columns2 (Value widthVal) (Value count) =
    appendProperty ("columns:" ++ widthVal ++ " " ++ count)


{-| Sets [`column-width`](https://css-tricks.com/almanac/properties/c/column-width/)

    columnWidth auto

    columnWidth (px 200)

-}
columnWidth :
    BaseValue
        (LengthSupported
            { auto : Supported
            }
        )
    -> Style
columnWidth (Value widthVal) =
    appendProperty ("column-width:" ++ widthVal)


{-| Sets [`column-count`](https://css-tricks.com/almanac/properties/c/column-count/)

    columnCount auto

    columnCount (num 3)

-}
columnCount :
    BaseValue
        { auto : Supported
        , int : Supported
        }
    -> Style
columnCount (Value count) =
    appendProperty ("column-count:" ++ count)


{-| Sets [`column-fill`](https://css-tricks.com/almanac/properties/c/column-fill/)

    columnFill auto

    columnFill balance

    columnFill balanceAll

-}
columnFill :
    BaseValue
        { auto : Supported
        , balance : Supported
        , balanceAll : Supported
        }
    -> Style
columnFill (Value val) =
    appendProperty ("column-fill:" ++ val)


{-| A `balance` value used in properties such as [`columnFill`](#columnFill)

    columnFill balance

-}
balance : Value { provides | balance : Supported }
balance =
    Value "balance"


{-| A `balance-all` value used in properties such as [`columnFill`](#columnFill)

    columnFill balanceAll

-}
balanceAll : Value { provides | balanceAll : Supported }
balanceAll =
    Value "balance-all"


{-| Sets [`column-span`](https://css-tricks.com/almanac/properties/c/column-span/)

    columnSpan all_

    columnSpan none

-}
columnSpan :
    BaseValue
        { none : Supported
        , all_ : Supported
        }
    -> Style
columnSpan (Value spanVal) =
    appendProperty ("column-span:" ++ spanVal)


{-| Sets [`column-rule`](https://css-tricks.com/almanac/properties/c/column-rule/).
This is a shorthand for the [`columnRuleWidth`](#columnRuleWidth),
[`columnRuleStyle`](#columnRuleStyle), and [`columnRuleColor`](#columnRuleColor)
properties.

    columnRule thin

    columnRule2 thin solid

    columnRule3 thin solid (hex "#000000")

-}
columnRule :
    BaseValue LineWidth -> Style
columnRule (Value widthVal) =
    appendProperty ("column-rule:" ++ widthVal)


{-| Sets [`column-rule`](https://css-tricks.com/almanac/properties/c/column-rule/).
This is a shorthand for the [`columnRuleWidth`](#columnRuleWidth),
[`columnRuleStyle`](#columnRuleStyle), and [`columnRuleColor`](#columnRuleColor)
properties.

    columnRule thin

    columnRule2 thin solid

    columnRule3 thin solid (hex "#000000")

-}
columnRule2 : Value LineWidth -> Value LineStyle -> Style
columnRule2 (Value widthVal) (Value styleVal) =
    appendProperty ("column-rule:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`column-rule`](https://css-tricks.com/almanac/properties/c/column-rule/).
This is a shorthand for the [`columnRuleWidth`](#columnRuleWidth),
[`columnRuleStyle`](#columnRuleStyle), and [`columnRuleColor`](#columnRuleColor)
properties.

    columnRule thin

    columnRule2 thin solid

    columnRule3 thin solid (hex "#000000")

-}
columnRule3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
columnRule3 (Value widthVal) (Value styleVal) (Value colorVal) =
    appendProperty ("column-rule:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`column-rule-width`](https://www.w3.org/TR/css-multicol-1/#propdef-column-rule-width)

    columnRuleWidth thin

    columnRuleWidth (px 2)

-}
columnRuleWidth : BaseValue LineWidth -> Style
columnRuleWidth (Value widthVal) =
    appendProperty ("column-rule-width:" ++ widthVal)


{-| Sets [`column-rule-style`](https://www.w3.org/TR/css-multicol-1/#propdef-column-rule-style)

    columnRuleStyle solid

    columnRuleStyle dotted

    columnRuleStyle dashed

-}
columnRuleStyle : BaseValue LineStyle -> Style
columnRuleStyle (Value styleVal) =
    appendProperty ("column-rule-style:" ++ styleVal)


{-| Sets [`column-rule-color`](https://www.w3.org/TR/css-multicol-1/#propdef-column-rule-color)

    columnRuleColor (rgb 0 0 0)

    columnRuleColor (hex "#fff")

-}
columnRuleColor : BaseValue Color -> Style
columnRuleColor (Value colorVal) =
    appendProperty ("column-rule-color:" ++ colorVal)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- TABLES ---------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`border-collapse`](https://css-tricks.com/almanac/properties/b/border-collapse/).

    borderCollapse collapse

    borderCollapse separate

-}
borderCollapse :
    BaseValue
        { collapse : Supported
        , separate : Supported
        }
    -> Style
borderCollapse (Value str) =
    appendProperty ("border-collapse:" ++ str)


{-| A `collapse` value for the [`border-collapse`](https://css-tricks.com/almanac/properties/b/border-collapse/) and
[`visibility`](https://css-tricks.com/almanac/properties/v/visibility/) property.

    borderCollapse collapse

    visibility collapse

-}
collapse : Value { provides | collapse : Supported }
collapse =
    Value "collapse"


{-| A `separate` value for the [`border-separate`](https://css-tricks.com/almanac/properties/b/border-collapse/) property.

    borderCollapse separate

-}
separate : Value { provides | separate : Supported }
separate =
    Value "separate"


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing).

    borderSpacing zero

    borderSpacing (px 5)

-}
borderSpacing : BaseValue Length -> Style
borderSpacing (Value str) =
    appendProperty ("border-spacing:" ++ str)


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing), defining horizontal and vertical spacing separately.

    borderSpacing2 (cm 1) (em 2)

-}
borderSpacing2 : Value Length -> Value Length -> Style
borderSpacing2 (Value valHorizontal) (Value valVertical) =
    appendProperty ("border-spacing:" ++ valHorizontal ++ " " ++ valVertical)


{-| Sets [`caption-side`](https://css-tricks.com/almanac/properties/c/caption-side/).

    captionSide top_

    captionSide bottom_

    captionSide blockStart

    captionSide inlineEnd

-}
captionSide :
    BaseValue
        { top_ : Supported
        , bottom_ : Supported
        , blockStart : Supported
        , blockEnd : Supported
        , inlineStart : Supported
        , inlineEnd : Supported
        }
    -> Style
captionSide (Value str) =
    appendProperty ("caption-side:" ++ str)


{-| Sets [`empty-cells`](https://css-tricks.com/almanac/properties/e/empty-cells/).

    emptyCells show

    emptyCells hide

-}
emptyCells :
    BaseValue
        { show : Supported
        , hide : Supported
        }
    -> Style
emptyCells (Value str) =
    appendProperty ("empty-cells:" ++ str)


{-| A `show` value for the [`empty-cells`](https://css-tricks.com/almanac/properties/e/empty-cells/) property.

    emptyCells show

-}
show : Value { provides | show : Supported }
show =
    Value "show"


{-| A `hide` value for the [`empty-cells`](https://css-tricks.com/almanac/properties/e/empty-cells/) property.

    emptyCells hide

-}
hide : Value { provides | hide : Supported }
hide =
    Value "hide"


{-| Sets [`table-layout`](https://css-tricks.com/almanac/properties/t/table-layout/).

    tableLayout auto

    tableLayout fixed

-}
tableLayout :
    BaseValue
        { auto : Supported
        , fixed : Supported
        }
    -> Style
tableLayout (Value str) =
    appendProperty ("table-layout:" ++ str)



------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------- CONTENT FRAGMENTATION --------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`break-before`](https://css-tricks.com/almanac/properties/b/break-before/).

    breakBefore auto
-}
breakBefore :
    BaseValue
        { auto : Supported
        , avoid : Supported
        , avoidPage : Supported
        , page : Supported
        , left_ : Supported
        , right_ : Supported
        , avoidColumn : Supported
        , column : Supported
        }
    -> Style
breakBefore (Value val) =
    appendProperty ("break-before:" ++ val)


{-| Sets [`break-after`](https://css-tricks.com/almanac/properties/b/break-after/).

    breakAfter auto
-}
breakAfter :
    BaseValue
        { auto : Supported
        , avoid : Supported
        , avoidPage : Supported
        , page : Supported
        , left_ : Supported
        , right_ : Supported
        , avoidColumn : Supported
        , column : Supported
        }
    -> Style
breakAfter (Value val) =
    appendProperty ("break-after:" ++ val)


{-| Sets [`break-inside`](https://css-tricks.com/almanac/properties/b/break-inside/)

    breakInside auto

    breakInside avoid

    breakInside avoidPage

    breakInside avoidColumn

-}
breakInside :
    BaseValue
        { auto : Supported
        , avoid : Supported
        , avoidPage : Supported
        , avoidColumn : Supported
        }
    -> Style
breakInside (Value val) =
    appendProperty ("break-inside:" ++ val)



{-| Sets `avoid` value for usage with [`breakAfter`](#breakAfter),
[`breakBefore`](#breakBefore) and [`breakInside`](#breakInside).

    breakBefore avoid

    breakAfter avoid

    breakInside avoid

-}
avoid : Value { provides | avoid : Supported }
avoid =
    Value "avoid"


{-| Sets `avoid-page` value for usage with [`breakAfter`](#breakAfter),
[`breakBefore`](#breakBefore) and [`breakInside`](#breakInside).

    breakBefore avoidPage

    breakAfter avoidPage

    breakInside avoidPage

-}
avoidPage : Value { provides | avoidPage : Supported }
avoidPage =
    Value "avoid-page"


{-| Sets `avoid-column` value for usage with [`breakAfter`](#breakAfter),
[`breakBefore`](#breakBefore) and [`breakInside`](#breakInside).

    breakBefore avoidColumn

    breakAfter avoidColumn

    breakInside avoidColumn

-}
avoidColumn : Value { provides | avoidColumn : Supported }
avoidColumn =
    Value "avoid-column"



{-| Sets `page` value for usage with [`breakAfter`](#breakAfter) and
[`breakBefore`](#breakBefore).

    breakBefore page

    breakAfter page

-}
page : Value { provides | page : Supported }
page =
    Value "page"


{-| Sets [`page-break-before`](https://css-tricks.com/almanac/properties/p/page-break/)

**This property has been deprecated and replaced with
[`breakBefore`](#breakBefore), but is still included for backwards
compatibility.**

    pageBreakBefore auto

    pageBreakBefore always

    pageBreakBefore avoid

    pageBreakBefore left_

    pageBreakBefore right_

-}
pageBreakBefore :
    BaseValue
        { auto : Supported
        , always : Supported
        , avoid : Supported
        , left_ : Supported
        , right_ : Supported
        }
    -> Style
pageBreakBefore (Value val) =
    appendProperty ("page-break-before:" ++ val)


{-| Sets [`page-break-after`](https://css-tricks.com/almanac/properties/p/page-break/)

**This property has been deprecated and replaced with
[`breakAfter`](#breakAfter), but is still included for backwards
compatibility.**

    pageBreakAfter auto

    pageBreakAfter always

    pageBreakAfter avoid

    pageBreakAfter left_

    pageBreakAfter right_

-}
pageBreakAfter :
    BaseValue
        { auto : Supported
        , always : Supported
        , avoid : Supported
        , left_ : Supported
        , right_ : Supported
        }
    -> Style
pageBreakAfter (Value val) =
    appendProperty ("page-break-after:" ++ val)


{-| Sets [`page-break-inside`](https://css-tricks.com/almanac/properties/p/page-break/)

    pageBreakInside auto

    pageBreakInside avoid

-}
pageBreakInside :
    BaseValue
        { auto : Supported
        , avoid : Supported
        }
    -> Style
pageBreakInside (Value val) =
    appendProperty ("page-break-inside:" ++ val)


{-| Sets [`orphans`](https://css-tricks.com/almanac/properties/o/orphans/)
**Note:** This function accepts only positive integers.

    orphans (int 2)

-}
orphans :
    BaseValue
        { int : Supported
        }
    -> Style
orphans (Value val) =
    appendProperty ("orphans:" ++ val)


{-| Sets [`widows`](https://css-tricks.com/almanac/properties/w/widows/)
**Note:** This function accepts only positive integers.

    widows (int 2)

-}
widows :
    BaseValue
        { int : Supported
        }
    -> Style
widows (Value val) =
    appendProperty ("widows:" ++ val)


{-| Sets [`box-decoration-break`](https://css-tricks.com/almanac/properties/b/box-decoration-break/)

    boxDecorationBreak slice

    boxDecorationBreak clone

-}
boxDecorationBreak :
    BaseValue
        { slice : Supported
        , clone : Supported
        }
    -> Style
boxDecorationBreak (Value val) =
    appendProperty ("box-decoration-break:" ++ val)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------- ARRANGING BLOCK/INLINE STUFF ---------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`float`](https://css-tricks.com/almanac/properties/f/float/).

    float none

    float left_

    float right_

    float inlineStart

-}
float :
    BaseValue
        { none : Supported
        , left_ : Supported
        , right_ : Supported
        , inlineStart : Supported
        , inlineEnd : Supported
        }
    -> Style
float (Value str) =
    appendProperty ("float:" ++ str)


{-| Sets [`clear`](https://css-tricks.com/almanac/properties/c/clear/) property.

    clear none

    clear both

    clear left_

    clear right_

    clear inlineStart

    clear inlineEnd

-}
clear :
    BaseValue
        { none : Supported
        , left_ : Supported
        , right_ : Supported
        , both : Supported
        , inlineStart : Supported
        , inlineEnd : Supported
        }
    -> Style
clear (Value val) =
    appendProperty ("clear:" ++ val)


{-| Sets [`vertical-align`](https://css-tricks.com/almanac/properties/v/vertical-align/).

    verticalAlign textBottom

    verticalAlign (em 1)

-}
verticalAlign :
    BaseValue
        (LengthSupported
            { baseline : Supported
            , sub : Supported
            , super : Supported
            , textTop : Supported
            , textBottom : Supported
            , middle : Supported
            , top_ : Supported
            , bottom_ : Supported
            , pct : Supported
            }
        )
    -> Style
verticalAlign (Value str) =
    appendProperty ("vertical-align:" ++ str)


{-| A `textTop` value for the [`vertical-align`](https://css-tricks.com/almanac/properties/v/vertical-align/) property.

    verticalAlign textTop

-}
textTop : Value { provides | textTop : Supported }
textTop =
    Value "text-top"


{-| A `textBottom` value for the [`vertical-align`](https://css-tricks.com/almanac/properties/v/vertical-align/) property.

    verticalAlign textBottom

-}
textBottom : Value { provides | textBottom : Supported }
textBottom =
    Value "text-bottom"


{-| A `middle` value for the [`vertical-align`](https://css-tricks.com/almanac/properties/v/vertical-align/) property.

    verticalAlign middle

-}
middle : Value { provides | middle : Supported }
middle =
    Value "middle"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------ REPLACED ELEMENTS -----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`object-fit`](https://css-tricks.com/almanac/properties/o/object-fit/)

    objectFit fill_

    objectFit contain_

    objectFit cover

    objectFit scaleDown

    objectFit none

-}
objectFit :
    BaseValue
        { fill_ : Supported
        , contain_ : Supported
        , cover : Supported
        , none : Supported
        , scaleDown : Supported
        }
    -> Style
objectFit (Value val) =
    appendProperty ("object-fit:" ++ val)


{-| Sets `scale-down` value for usage with [`objectFit`](#objectFit).

    objectFit scaleDown

-}
scaleDown : Value { provides | scaleDown : Supported }
scaleDown =
    Value "scale-down"


{-| Sets [`object-position`](https://css-tricks.com/almanac/properties/o/object-position/).

    objectPosition left_

    objectPosition (px 45)

`objectPosition` sets the horizontal direction. If you need the vertical
direction instead, use [`objectPosition2`](#objectPosition2) like this:

    objectPosition zero (px 45)

If you need to set the offsets from the right or bottom, use
[`objectPosition4`](#objectPosition4) like this:

    objectPosition4 right_ (px 20) bottom_ (pct 25)

-}
objectPosition :
    BaseValue
        (LengthSupported
            { left_ : Supported
            , right_ : Supported
            , top_ : Supported
            , bottom_ : Supported
            , center : Supported
            }
        )
    -> Style
objectPosition (Value horiz) =
    appendProperty ("object-position:" ++ horiz)


{-| Sets [`object-position`](https://css-tricks.com/almanac/properties/o/object-position/).

    objectPosition2 left_ top_

    objectPosition2 (px 45) (pct 50)

`objectPosition2` sets both the horizontal and vertical directions (in that
order, same as CSS.) If you need only the horizontal, you can use
[`objectPosition`](#objectPosition) instead:

    objectPosition left_

If you need to set the offsets from the right or bottom, use
[`objectPosition4`](#objectPosition4) like this:

    objectPosition4 right_ (px 20) bottom_ (pct 25)

-}
objectPosition2 :
    Value
        (LengthSupported
            { left_ : Supported
            , right_ : Supported
            , center : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { top_ : Supported
                , bottom_ : Supported
                , center : Supported
                , pct : Supported
                }
            )
    -> Style
objectPosition2 (Value horiz) (Value vert) =
    appendProperty ("object-position:" ++ horiz ++ " " ++ vert)


{-| Sets [`object-position`](https://css-tricks.com/almanac/properties/o/object-position/).

    objectPosition4 right_ (px 20) bottom_ (pct 30)

The four-argument form of object position alternates sides and offets. So the
example above would position the object image 20px from the right, and 30%
from the bottom.

See also [`objectPosition`](#objectPosition) for horizontal alignment and
[`objectPosition2`](#objectPosition2) for horizontal (from left) and
vertical (from top) alignment.

-}
objectPosition4 :
    Value
        { left_ : Supported
        , right_ : Supported
        }
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            { top_ : Supported
            , bottom_ : Supported
            }
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
objectPosition4 (Value horiz) (Value horizAmount) (Value vert) (Value vertAmount) =
    appendProperty
        ("object-position:"
            ++ horiz
            ++ " "
            ++ horizAmount
            ++ " "
            ++ vert
            ++ " "
            ++ vertAmount
        )



------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
---------------------------- POINTER-EVENTS-----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`pointer-events`](https://css-tricks.com/almanac/properties/b/pointer-events/)

    pointerEvents none

    pointerEvents auto

-}
pointerEvents :
    BaseValue
        { auto : Supported
        , none : Supported
        , visiblePainted : Supported
        , visibleFill : Supported
        , visibleStroke : Supported
        , visible : Supported
        , painted : Supported
        , fill_ : Supported
        , stroke : Supported
        , all_ : Supported
        }
    -> Style
pointerEvents (Value val) =
    appendProperty ("pointer-events:" ++ val)


{-| The `visiblePainted` value used by [`pointerEvents`](#pointerEvents).

    pointerEvents visiblePainted

-}
visiblePainted : Value { provides | visiblePainted : Supported }
visiblePainted =
    Value "visiblePainted"


{-| The `visibleFill` value used by [`pointerEvents`](#pointerEvents).

    pointerEvents visibleFill

-}
visibleFill : Value { provides | visibleFill : Supported }
visibleFill =
    Value "visibleFill"


{-| The `visibleStroke` value used by [`pointerEvents`](#pointerEvents).

    pointerEvents visibleStroke

-}
visibleStroke : Value { provides | visibleStroke : Supported }
visibleStroke =
    Value "visibleStroke"


{-| The `painted` value used by [`pointerEvents`](#pointerEvents).

    pointerEvents painted

-}
painted : Value { provides | painted : Supported }
painted =
    Value "painted"

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
---------------------------- POINTER-EVENTS-----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`touch-action`](https://css-tricks.com/almanac/properties/t/touch-action/)
property.

    touchAction auto

    touchAction panY

    touchAction pinchZoom
-}
touchAction :
    BaseValue
        { auto : Supported
        , none : Supported
        , panX : Supported
        , panY : Supported
        , pinchZoom : Supported
        , manipulation : Supported
        }
    -> Style
touchAction (Value val) =
    appendProperty <| "touch-action:" ++ val


{-| The `pan-x` value used by [`touch-action`](#touchAction).

    touchAction panX

-}
panX : Value { provides | panX : Supported }
panX =
    Value "pan-x"


{-| The `pan-y` value used by [`touch-action`](#touchAction).

    touchAction panY

-}
panY : Value { provides | panY : Supported }
panY =
    Value "pan-y"


{-| The `pinch-zoom` value used by [`touch-action`](#touchAction).

    touchAction pinchZoom

-}
pinchZoom : Value { provides | pinchZoom : Supported }
pinchZoom =
    Value "pinch-zoom"


{-| The `manipulation` value used by [`touch-action`](#touchAction).

    touchAction manipulation

-}
manipulation : Value { provides | manipulation : Supported }
manipulation =
    Value "manipulation"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------- SCROLLBAR CUSTOMISATION ------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------



{-| Sets the
[`scrollbar-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/scrollbar-color) property.

    scrollbarColor auto

    scrollbarColor (hex "f35d93")
-}
scrollbarColor :
    BaseValue
        ( ColorSupported
            { auto : Supported
            }
        )
    -> Style
scrollbarColor (Value val) =
    appendProperty ("scrollbar-color:" ++ val)


{-| Sets the [`scrollbar-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/scrollbar-width) property.

    scrollbarWidth auto

    scrollbarWidth thin
-}
scrollbarWidth :
    BaseValue
        { auto : Supported
        , thin : Supported
        , none : Supported
        }
    -> Style
scrollbarWidth (Value val) =
    appendProperty ("scrollbar-width:" ++ val)


{-| The [`scrollbar-gutter`](https://css-tricks.com/almanac/properties/s/scrollbar-gutter/)
property.

This 1-argument variant can accept global values and some keywords.

    scrollbarGutter auto

    scrollbarGutter inherit
    
    scrollbarGutter2 stable bothEdges
-}
scrollbarGutter :
    BaseValue
        { auto : Supported
        , stable : Supported
        }
    -> Style
scrollbarGutter (Value val) =
    appendProperty ("scrollbar-gutter:" ++ val)


{-| The [`scrollbar-gutter`](https://css-tricks.com/almanac/properties/s/scrollbar-gutter/)
property.

This 2-argument variant can only accept the keywords `stable` and `bothEdges`.

    scrollbarGutter auto

    scrollbarGutter inherit

    scrollbarGutter2 stable bothEdges
-}
scrollbarGutter2 :
    Value { stable : Supported }
    -> Value { bothEdges : Supported }
    -> Style
scrollbarGutter2 (Value val1) (Value val2) =
    appendProperty ("scrollbar-gutter:" ++ val1 ++ " " ++ val2)


{-| The `stable` value used by [`scrollbarGutter`](#scrollbarGutter).

    scrollbarGutter stable

-}
stable : Value { provides | stable : Supported }
stable =
    Value "stable"


{-| The `both-edges` value used by [`scrollbarGutter`](#scrollbarGutter).

    scrollbarGutter2 stable bothEdges

-}
bothEdges : Value { provides | bothEdges : Supported }
bothEdges =
    Value "both-edges"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------- SCROLLING BEHAVIOR --------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`scroll-behavior`](https://css-tricks.com/almanac/properties/s/scroll-behavior/)

    scrollBehavior auto

    scrollBehavior smooth

-}
scrollBehavior :
    BaseValue
        { auto : Supported
        , smooth : Supported
        }
    -> Style
scrollBehavior (Value val) =
    appendProperty ("scroll-behavior:" ++ val)


{-| Sets `smooth` value for usage with [`scrollBehavior`](#scrollBehavior).

    scrollBehavior smooth

-}
smooth : Value { provides | smooth : Supported }
smooth =
    Value "smooth"


{-| Sets the [`overscroll-behavior`](https://css-tricks.com/almanac/properties/o/overscroll-behavior/) property.

This property is a shorthand for setting both `overscroll-behavior-x` and `overscroll-behavior-y`.

    overscrollBehavior auto -- sets both X and Y to auto

    overscrollBehavior2 auto contain -- X = auto, Y = contain.

-}
overscrollBehavior :
    BaseValue
        { auto : Supported
        , contain_ : Supported
        , none : Supported
        }
    -> Style
overscrollBehavior (Value value) =
    appendProperty ("overscroll-behavior:" ++ value)


{-| Sets the [`overscroll-behavior`](https://css-tricks.com/almanac/properties/o/overscroll-behavior/) property.

This property is a shorthand for setting both `overscroll-behavior-x` and `overscroll-behavior-y`.

    overscrollBehavior2 auto contain_ -- X = auto, Y = contain.

-}
overscrollBehavior2 :
    Value
        { auto : Supported
        , contain_ : Supported
        , none : Supported
        }
    ->
        Value
            { auto : Supported
            , contain_ : Supported
            , none : Supported
            }
    -> Style
overscrollBehavior2 (Value xValue) (Value yValue) =
    appendProperty ("overscroll-behavior:" ++ xValue ++ " " ++ yValue)


{-| Sets the [`overscroll-behavior-x`](https://css-tricks.com/almanac/properties/o/overscroll-behavior/) property.

    overscrollBehaviorX auto

    overscrollBehaviorX contain_

-}
overscrollBehaviorX :
    BaseValue
        { auto : Supported
        , contain_ : Supported
        , none : Supported
        }
    -> Style
overscrollBehaviorX (Value value) =
    appendProperty ("overscroll-behavior-x:" ++ value)


{-| Sets the [`overscroll-behavior-y`](https://css-tricks.com/almanac/properties/o/overscroll-behavior/) property.

    overscrollBehaviorY auto

    overscrollBehaviorY contain_

-}
overscrollBehaviorY :
    BaseValue
        { auto : Supported
        , contain_ : Supported
        , none : Supported
        }
    -> Style
overscrollBehaviorY (Value value) =
    appendProperty ("overscroll-behavior-y:" ++ value)


{-| Sets the [`overscroll-behavior-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/overscroll-behavior-block) property.

    overscrollBehaviorBlock auto

    overscrollBehaviorBlock contain_

-}
overscrollBehaviorBlock :
    BaseValue
        { auto : Supported
        , contain_ : Supported
        , none : Supported
        }
    -> Style
overscrollBehaviorBlock (Value value) =
    appendProperty ("overscroll-behavior-block:" ++ value)


{-| Sets the [`overscroll-behavior-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/overscroll-behavior-inline) property.

    overscrollBehaviorInline auto

    overscrollBehaviorInline contain_

-}
overscrollBehaviorInline :
    BaseValue
        { auto : Supported
        , contain_ : Supported
        , none : Supported
        }
    -> Style
overscrollBehaviorInline (Value value) =
    appendProperty ("overscroll-behavior-inline:" ++ value)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------- SCROLL SNAPPING -----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`scroll-snap-type`](https://css-tricks.com/almanac/properties/s/scroll-snap-type/)

    scrollSnapType none

-}
scrollSnapType :
    BaseValue
        { none : Supported
        , x : Supported
        , y : Supported
        , block : Supported
        , inline : Supported
        , both : Supported
        }
    -> Style
scrollSnapType (Value val) =
    appendProperty ("scroll-snap-type:" ++ val)


{-| Sets [`scroll-snap-type`](https://css-tricks.com/almanac/properties/s/scroll-snap-type/)

    scrollSnapType2 x mandatory

    scrollSnapType2 both proximity

-}
scrollSnapType2 :
    Value
        { x : Supported
        , y : Supported
        , block : Supported
        , inline : Supported
        , both : Supported
        }
    ->
        Value
            { mandatory : Supported
            , proximity : Supported
            }
    -> Style
scrollSnapType2 (Value val1) (Value val2) =
    appendProperty ("scroll-snap-type:" ++ val1 ++ " " ++ val2)


{-| Sets [`scroll-snap-align`](https://css-tricks.com/almanac/properties/s/scroll-snap-align/)

    scrollSnapAlign none

    scrollSnapAlign start

    scrollSnapAlign center

    scrollSnapAlign end

-}
scrollSnapAlign :
    BaseValue
        { none : Supported
        , start : Supported
        , center : Supported
        , end : Supported
        }
    -> Style
scrollSnapAlign (Value val) =
    appendProperty ("scroll-snap-align:" ++ val)


{-| Sets [`scroll-snap-stop`](https://css-tricks.com/almanac/properties/s/scroll-snap-stop/)

    scrollSnapStop normal

    scrollSnapStop always

-}
scrollSnapStop :
    BaseValue
        { normal : Supported
        , always : Supported
        }
    -> Style
scrollSnapStop (Value val) =
    appendProperty ("scroll-snap-stop:" ++ val)


{-| Sets `mandatory` value for usage with [`scrollSnapType2`](#scrollSnapType2).

    scrollSnapType2 x mandatory

-}
mandatory : Value { provides | mandatory : Supported }
mandatory =
    Value "mandatory"


{-| Sets `proximity` value for usage with [`scrollSnapType2`](#scrollSnapType2).

    scrollSnapType2 x proximity

-}
proximity : Value { provides | proximity : Supported }
proximity =
    Value "proximity"


{-| Sets [`scroll-margin`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.
The `scrollMargin` property is a shorthand property for setting
`scroll-margin-top`, `scroll-margin-right`, `scroll-margin-bottom`,
and `scroll-margin-left` in a single declaration.

If there is only one argument value, it applies to all sides. If there are two
values, the top and bottom margins are set to the first value and the right and
left margins are set to the second. If there are three values, the top is set
to the first value, the left and right are set to the second, and the bottom is
set to the third. If there are four values they apply to the top, right,
bottom, and left, respectively.

    scrollMargin (em 4) -- set all margins to 4em

    scrollMargin2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

    scrollMargin3 (em 4) (px 2) (pt 5) -- top = 4em, right = 2px, bottom = 5pt, left = 2px

    scrollMargin4 (em 4) (px 2) (pt 5) (px 3) -- top = 4em, right = 2px, bottom = 5pt, left = 3px

-}
scrollMargin :
    BaseValue
        Length
    -> Style
scrollMargin (Value value) =
    appendProperty ("scroll-margin:" ++ value)


{-| Sets [`scroll-margin`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.
The `scrollMargin2` property is a shorthand property for setting
`scroll-margin-top`, `scroll-margin-right`, `scroll-margin-bottom`,
and `scroll-margin-left` in a single declaration.

The top and bottom margins are set to the first value and the right and left
margins are set to the second.

    scrollMargin2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

-}
scrollMargin2 :
    Value
        Length
    ->
        Value
            Length
    -> Style
scrollMargin2 (Value valueTopBottom) (Value valueRightLeft) =
    appendProperty ("scroll-margin:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`scroll-margin`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.
The `scrollMargin3` property is a shorthand property for setting
`scroll-margin-top`, `scroll-margin-right`, `scroll-margin-bottom`,
and `scroll-margin-left` in a single declaration.

The top margin is set to the first value, the left and right are set to the
second, and the bottom is set to the third.

    scrollMargin3 (em 4) (px 2) (pt 5) -- top = 4em, right = 2px, bottom = 5pt, left = 2px

-}
scrollMargin3 :
    Value
        Length
    ->
        Value
            Length
    ->
        Value
            Length
    -> Style
scrollMargin3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    appendProperty ("scroll-margin:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`scroll-margin`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.
The `scrollMargin4` property is a shorthand property for setting
`scroll-margin-top`, `scroll-margin-right`, `scroll-margin-bottom`,
and `scroll-margin-left` in a single declaration.

The four values apply to the top, right, bottom, and left margins.

    scrollMargin4 (em 4) (px 2) (pt 5) (px 3) -- top = 4em, right = 2px, bottom = 5pt, left = 3px

-}
scrollMargin4 :
    Value
        Length
    ->
        Value
            Length
    ->
        Value
            Length
    ->
        Value
            Length
    -> Style
scrollMargin4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    appendProperty ("scroll-margin:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`scroll-margin-top`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginTop (px 4)

-}
scrollMarginTop :
    BaseValue
        Length
    -> Style
scrollMarginTop (Value value) =
    appendProperty ("scroll-margin-top:" ++ value)


{-| Sets [`scroll-margin-right`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginRight (px 4)

-}
scrollMarginRight :
    BaseValue
        Length
    -> Style
scrollMarginRight (Value value) =
    appendProperty ("scroll-margin-right:" ++ value)


{-| Sets [`scroll-margin-bottom`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginBottom (px 4)

-}
scrollMarginBottom :
    BaseValue
        Length
    -> Style
scrollMarginBottom (Value value) =
    appendProperty ("scroll-margin-bottom:" ++ value)


{-| Sets [`scroll-margin-left`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginLeft (px 4)

-}
scrollMarginLeft :
    BaseValue
        Length
    -> Style
scrollMarginLeft (Value value) =
    appendProperty ("scroll-margin-left:" ++ value)


{-| Sets [`scroll-margin-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-block) property.
The `scrollMarginBlock` property is a shorthand property for setting
`scroll-margin-block-start` and `scroll-margin-block-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the block start margin is set to the first value and the block end margin is
set to the second.

    scrollMarginBlock (em 4) -- set both block margins to 4em

    scrollMarginBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
scrollMarginBlock :
    BaseValue
        Length
    -> Style
scrollMarginBlock (Value value) =
    appendProperty ("scroll-margin-block:" ++ value)


{-| Sets [`scroll-margin-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-block) property.
The `scrollMarginBlock2` property is a shorthand property for setting
`scroll-margin-block-start` and `scroll-margin-block-end` in a single declaration.

The block start margin is set to the first value and the block end margin is
set to the second.

    scrollMarginBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
scrollMarginBlock2 :
    Value
        Length
    ->
        Value
            Length
    -> Style
scrollMarginBlock2 (Value valueStart) (Value valueEnd) =
    appendProperty ("scroll-margin-block:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`scroll-margin-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-inline) property.
The `scrollMarginInline` property is a shorthand property for setting
`scroll-margin-inline-start` and `scroll-margin-inline-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the inline start margin is set to the first value and the inline end margin is
set to the second.

    scrollMarginInline (em 4) -- set both inline margins to 4em

    scrollMarginInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
scrollMarginInline :
    BaseValue
        Length
    -> Style
scrollMarginInline (Value value) =
    appendProperty ("scroll-margin-inline:" ++ value)


{-| Sets [`scroll-margin-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-inline) property.
The `scrollMarginInline2` property is a shorthand property for setting
`scroll-margin-inline-start` and `scroll-margin-inline-end` in a single declaration.

The inline start margin is set to the first value and the inline end margin is
set to the second.

    scrollMarginInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
scrollMarginInline2 :
    Value
        Length
    ->
        Value
            Length
    -> Style
scrollMarginInline2 (Value valueStart) (Value valueEnd) =
    appendProperty ("scroll-margin-inline:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`scroll-margin-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-block-start) property.

    scrollMarginBlockStart (px 4)

-}
scrollMarginBlockStart :
    BaseValue
        Length
    -> Style
scrollMarginBlockStart (Value value) =
    appendProperty ("scroll-margin-block-start:" ++ value)


{-| Sets [`scroll-margin-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-block-end) property.

    scrollMarginBlockEnd (px 4)

-}
scrollMarginBlockEnd :
    BaseValue
        Length
    -> Style
scrollMarginBlockEnd (Value value) =
    appendProperty ("scroll-margin-block-end:" ++ value)


{-| Sets [`scroll-margin-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-inline-start) property.

    scrollMarginInlineStart (px 4)

-}
scrollMarginInlineStart :
    BaseValue
        Length
    -> Style
scrollMarginInlineStart (Value value) =
    appendProperty ("scroll-margin-inline-start:" ++ value)


{-| Sets [`scroll-margin-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-inline-end) property.

    scrollMarginInlineEnd (px 4)

-}
scrollMarginInlineEnd :
    BaseValue
        Length
    -> Style
scrollMarginInlineEnd (Value value) =
    appendProperty ("scroll-margin-inline-end:" ++ value)


{-| Sets [`scroll-padding`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.
The `scrollPadding` property is a shorthand property for setting
`scroll-padding-top`, `scroll-padding-right`, `scroll-padding-bottom`,
and `scroll-padding-left` in a single declaration.

If there is only one argument value, it applies to all sides. If there are two
values, the top and bottom paddings are set to the first value and the right and
left paddings are set to the second. If there are three values, the top is set
to the first value, the left and right are set to the second, and the bottom is
set to the third. If there are four values they apply to the top, right,
bottom, and left, respectively.

    scrollPadding (em 4) -- set all paddings to 4em

    scrollPadding2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

    scrollPadding3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

    scrollPadding4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

-}
scrollPadding :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPadding (Value value) =
    appendProperty ("scroll-padding:" ++ value)


{-| Sets [`scroll-padding`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.
The `scrollPadding2` property is a shorthand property for setting
`scroll-padding-top`, `scroll-padding-right`, `scroll-padding-bottom`,
and `scroll-padding-left` in a single declaration.

The top and bottom margins are set to the first value and the right and left
margins are set to the second.

    scrollPadding2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

-}
scrollPadding2 :
    Value
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    -> Style
scrollPadding2 (Value valueTopBottom) (Value valueRightLeft) =
    appendProperty ("scroll-padding:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`scroll-padding`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.
The `scrollPadding3` property is a shorthand property for setting
`scroll-padding-top`, `scroll-padding-right`, `scroll-padding-bottom`,
and `scroll-padding-left` in a single declaration.

The top padding is set to the first value, the left and right are set to the
second, and the bottom is set to the third.

    scrollPadding3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

-}
scrollPadding3 :
    Value
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    -> Style
scrollPadding3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    appendProperty ("scroll-padding:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`scroll-padding`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.
The `scrollPadding4` property is a shorthand property for setting
`scroll-padding-top`, `scroll-padding-right`, `scroll-padding-bottom`,
and `scroll-padding-left` in a single declaration.

The four values apply to the top, right, bottom, and left paddings.

    scrollPadding4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

-}
scrollPadding4 :
    Value
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    -> Style
scrollPadding4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    appendProperty ("scroll-padding:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`scroll-padding-top`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingTop (px 4)

-}
scrollPaddingTop :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingTop (Value value) =
    appendProperty ("scroll-padding-top:" ++ value)


{-| Sets [`scroll-padding-right`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingRight (px 4)

-}
scrollPaddingRight :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingRight (Value value) =
    appendProperty ("scroll-padding-right:" ++ value)


{-| Sets [`scroll-padding-bottom`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingBottom (px 4)

-}
scrollPaddingBottom :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingBottom (Value value) =
    appendProperty ("scroll-padding-bottom:" ++ value)


{-| Sets [`scroll-padding-left`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingLeft (px 4)

-}
scrollPaddingLeft :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingLeft (Value value) =
    appendProperty ("scroll-padding-left:" ++ value)


{-| Sets [`scroll-padding-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-block) property.
The `scroll-padding-block` property is a shorthand property for setting
`scroll-padding-block-start` and `scroll-padding-block-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the block start padding is set to the first value and the block end padding
is set to the second.

    scrollPaddingBlock (em 4) -- set both block paddings to 4em

    scrollPaddingBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
scrollPaddingBlock :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingBlock (Value value) =
    appendProperty ("scroll-padding-block:" ++ value)


{-| Sets [`scroll-padding-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-block) property.
The `scroll-padding-block` property is a shorthand property for setting
`scroll-padding-block-start` and `scroll-padding-block-end` in a single declaration.

The block start padding is set to the first value and the block end padding
is set to the second.

    scrollPaddingBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
scrollPaddingBlock2 :
    Value
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    -> Style
scrollPaddingBlock2 (Value valueStart) (Value valueEnd) =
    appendProperty ("scroll-padding-block:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`scroll-padding-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-inline) property.
The `scroll-padding-inline` property is a shorthand property for setting
`scroll-padding-inline-start` and `scroll-padding-inline-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the inline start padding is set to the first value and the inline end padding
is set to the second.

    scrollPaddingInline (em 4) -- set both inline paddings to 4em

    scrollPaddingInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
scrollPaddingInline :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingInline (Value value) =
    appendProperty ("scroll-padding-inline:" ++ value)


{-| Sets [`scroll-padding-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-inline) property.
The `scroll-padding-inline` property is a shorthand property for setting
`scroll-padding-inline-start` and `scroll-padding-inline-end` in a single declaration.

The inline start padding is set to the first value and the inline end padding
is set to the second.

    scrollPaddingInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
scrollPaddingInline2 :
    Value
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    -> Style
scrollPaddingInline2 (Value valueStart) (Value valueEnd) =
    appendProperty ("scroll-padding-inline:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`scroll-padding-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-block-start) property.

    scrollPaddingBlockStart (px 4)

-}
scrollPaddingBlockStart :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingBlockStart (Value value) =
    appendProperty ("scroll-padding-block-start:" ++ value)


{-| Sets [`scroll-padding-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-block-end) property.

    scrollPaddingBlockEnd (px 4)

-}
scrollPaddingBlockEnd :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingBlockEnd (Value value) =
    appendProperty ("scroll-padding-block-end:" ++ value)


{-| Sets [`scroll-padding-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-inline-start) property.

    scrollPaddingInlineStart (px 4)

-}
scrollPaddingInlineStart :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingInlineStart (Value value) =
    appendProperty ("scroll-padding-inline-start:" ++ value)


{-| Sets [`scroll-padding-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-inline-end) property.

    scrollPaddingInlineEnd (px 4)

-}
scrollPaddingInlineEnd :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingInlineEnd (Value value) =
    appendProperty ("scroll-padding-inline-end:" ++ value)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------------- CURSORS -------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A type alias used for the various [`cursor`](#cursor) properties
-}
type alias CursorKeyword =
    { pointer : Supported
    , auto : Supported
    , default_ : Supported
    , none : Supported
    , contextMenu : Supported
    , help : Supported
    , progress : Supported
    , wait : Supported
    , cell : Supported
    , crosshair : Supported
    , text : Supported
    , verticalText : Supported
    , alias : Supported
    , copy : Supported
    , move : Supported
    , noDrop : Supported
    , notAllowed : Supported
    , allScroll : Supported
    , colResize : Supported
    , rowResize : Supported
    , nResize : Supported
    , eResize : Supported
    , sResize : Supported
    , wResize : Supported
    , neResize : Supported
    , nwResize : Supported
    , seResize : Supported
    , swResize : Supported
    , ewResize : Supported
    , nsResize : Supported
    , neswResize : Supported
    , nwseResize : Supported
    , zoomIn : Supported
    , zoomOut : Supported
    , grab : Supported
    , grabbing : Supported
    }


{-| The [`cursor`](https://css-tricks.com/almanac/properties/c/cursor/)
property.

    cursor notAllowed

-}
cursor : BaseValue CursorKeyword -> Style
cursor (Value val) =
    appendProperty ("cursor:" ++ val)


{-| The [`cursor`](https://css-tricks.com/almanac/properties/c/cursor/)
property.

    cursor2 (url "https://example.com") move

-}
cursor2 : Value { url : Supported } -> Value CursorKeyword -> Style
cursor2 (Value urlVal) (Value fallbackVal) =
    appendProperty ("cursor:" ++ urlVal ++ "," ++ fallbackVal)


{-| The [`cursor`](https://css-tricks.com/almanac/properties/c/cursor/)
property.

    cursor4 (url "https://example.com") (num 34) zero move

-}
cursor4 :
    Value { url : Supported }
    ->
        Value
            { num : Supported
            , zero : Supported
            , default_ : Supported
            }
    ->
        Value
            { num : Supported
            , zero : Supported
            }
    -> Value CursorKeyword
    -> Style
cursor4 (Value urlVal) (Value xVal) (Value yVal) (Value fallbackVal) =
    appendProperty
        ("cursor:"
            ++ urlVal
            ++ " "
            ++ xVal
            ++ " "
            ++ yVal
            ++ ","
            ++ fallbackVal
        )


{-| The `pointer` value for the [`cursor`](#cursor) property.
-}
pointer : Value { provides | pointer : Supported }
pointer =
    Value "pointer"


{-| The `default` value for the [`cursor`](#cursor) property.

This value is called `default_` instead of `default` because
[`default` is already a pseudo-class function](#default).
-}
default_ : Value { provides | default_ : Supported }
default_ =
    Value "default"


{-| The `context-menu` value for the [`cursor`](#cursor) property.
-}
contextMenu : Value { provides | contextMenu : Supported }
contextMenu =
    Value "context-menu"


{-| The `help` value for the [`cursor`](#cursor) property.
-}
help : Value { provides | help : Supported }
help =
    Value "help"


{-| The `progress` value for the [`cursor`](#cursor) property.
-}
progress : Value { provides | progress : Supported }
progress =
    Value "progress"


{-| The `wait` value for the [`cursor`](#cursor) property.
-}
wait : Value { provides | wait : Supported }
wait =
    Value "wait"


{-| The `cell` value for the [`cursor`](#cursor) property.
-}
cell : Value { provides | cell : Supported }
cell =
    Value "cell"


{-| The `crosshair` value for the [`cursor`](#cursor) property.
-}
crosshair : Value { provides | crosshair : Supported }
crosshair =
    Value "crosshair"


{-| The `vertical-text` value for the [`cursor`](#cursor) property.
-}
verticalText : Value { provides | verticalText : Supported }
verticalText =
    Value "vertical-text"


{-| The `alias` value for the [`cursor`](#cursor) property.
-}
alias : Value { provides | alias : Supported }
alias =
    Value "alias"


{-| The `copy` value for the [`cursor`](#cursor) property.
-}
copy : Value { provides | copy : Supported }
copy =
    Value "copy"


{-| The `move` value for the [`cursor`](#cursor) property.
-}
move : Value { provides | move : Supported }
move =
    Value "move"


{-| The `no-drop` value for the [`cursor`](#cursor) property.
-}
noDrop : Value { provides | noDrop : Supported }
noDrop =
    Value "no-drop"


{-| The `notAllowed` value for the [`cursor`](#cursor) property.
-}
notAllowed : Value { provides | notAllowed : Supported }
notAllowed =
    Value "not-allowed"


{-| The `all-scroll` value for the [`cursor`](#cursor) property.
-}
allScroll : Value { provides | allScroll : Supported }
allScroll =
    Value "all-scroll"


{-| The `col-resize` value for the [`cursor`](#cursor) property.
-}
colResize : Value { provides | colResize : Supported }
colResize =
    Value "col-resize"


{-| The `row-resize` value for the [`cursor`](#cursor) property.
-}
rowResize : Value { provides | rowResize : Supported }
rowResize =
    Value "row-resize"


{-| The `n-resize` value for the [`cursor`](#cursor) property.
-}
nResize : Value { provides | nResize : Supported }
nResize =
    Value "n-resize"


{-| The `e-resize` value for the [`cursor`](#cursor) property.
-}
eResize : Value { provides | eResize : Supported }
eResize =
    Value "e-resize"


{-| The `s-resize` value for the [`cursor`](#cursor) property.
-}
sResize : Value { provides | sResize : Supported }
sResize =
    Value "s-resize"


{-| The `w-resize` value for the [`cursor`](#cursor) property.
-}
wResize : Value { provides | wResize : Supported }
wResize =
    Value "w-resize"


{-| The `ne-resize` value for the [`cursor`](#cursor) property.
-}
neResize : Value { provides | neResize : Supported }
neResize =
    Value "ne-resize"


{-| The `nw-resize` value for the [`cursor`](#cursor) property.
-}
nwResize : Value { provides | nwResize : Supported }
nwResize =
    Value "nw-resize"


{-| The `se-resize` value for the [`cursor`](#cursor) property.
-}
seResize : Value { provides | seResize : Supported }
seResize =
    Value "se-resize"


{-| The `sw-resize` value for the [`cursor`](#cursor) property.
-}
swResize : Value { provides | swResize : Supported }
swResize =
    Value "sw-resize"


{-| The `ew-resize` value for the [`cursor`](#cursor) property.
-}
ewResize : Value { provides | ewResize : Supported }
ewResize =
    Value "ew-resize"


{-| The `ns-resize` value for the [`cursor`](#cursor) property.
-}
nsResize : Value { provides | nsResize : Supported }
nsResize =
    Value "ns-resize"


{-| The `nesw-resize` value for the [`cursor`](#cursor) property.
-}
neswResize : Value { provides | neswResize : Supported }
neswResize =
    Value "nesw-resize"


{-| The `nwse-resize` value for the [`cursor`](#cursor) property.
-}
nwseResize : Value { provides | nwseResize : Supported }
nwseResize =
    Value "nwse-resize"


{-| The `zoom-in` value for the [`cursor`](#cursor) property.
-}
zoomIn : Value { provides | zoomIn : Supported }
zoomIn =
    Value "zoom-in"


{-| The `zoom-out` value for the [`cursor`](#cursor) property.
-}
zoomOut : Value { provides | zoomOut : Supported }
zoomOut =
    Value "zoom-out"


{-| The `grab` value for the [`cursor`](#cursor) property.
-}
grab : Value { provides | grab : Supported }
grab =
    Value "grab"


{-| The `grabbing` value for the [`cursor`](#cursor) property.
-}
grabbing : Value { provides | grabbing : Supported }
grabbing =
    Value "grabbing"


{-| Sets [`caret-color`](https://css-tricks.com/almanac/properties/c/caret-color/)

    caretColor (hex "#60b5cc")

    caretColor (rgb 96 181 204)

    caretColor (rgba 96 181 204 0.5)

-}
caretColor :
    BaseValue
        (ColorSupported
            { auto : Supported
            , transparent : Supported
            }
        )
    -> Style
caretColor (Value val) =
    appendProperty ("caret-color:" ++ val)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------ GRADIENTS -------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Produces [`linear-gradient()`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient())
values used by properties such as [`backgroundImage`](#backgroundImage),
and [`listStyleImage`](#listStyleImage)

    linearGradient (stop red) (stop blue) []

    linearGradient (stop red) (stop blue) [ stop green ]

-}
linearGradient :
    Value { colorStop : Supported }
    -> Value { colorStop : Supported }
    -> List (Value { colorStop : Supported })
    -> Value { provides | linearGradient : Supported }
linearGradient (Value firstStop) (Value secondStop) moreStops =
    let
        peeledStops =
            List.map Value.unpack moreStops

        stops =
            String.join "," (firstStop :: secondStop :: peeledStops)
    in
    Value ("linear-gradient(" ++ stops ++ ")")


{-| Produces [`linear-gradient()`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient())
values used by properties such as [`backgroundImage`](#backgroundImage),
and [`listStyleImage`](#listStyleImage)

    linearGradient2 toTop (stop red) (stop blue) []

    linearGradient2 toTop (stop red) (stop blue) [ stop green ]

-}
linearGradient2 :
    Value
        (AngleSupported
            { toBottom : Supported
            , toBottomLeft : Supported
            , toBottomRight : Supported
            , toLeft : Supported
            , toRight : Supported
            , toTop : Supported
            , toTopLeft : Supported
            , toTopRight : Supported
            }
        )
    -> Value { colorStop : Supported }
    -> Value { colorStop : Supported }
    -> List (Value { colorStop : Supported })
    -> Value { provides | linearGradient : Supported }
linearGradient2 (Value angle) (Value firstStop) (Value secondStop) moreStops =
    let
        peeledStops =
            List.map Value.unpack moreStops

        stops =
            String.join "," (firstStop :: secondStop :: peeledStops)
    in
    Value ("linear-gradient(" ++ angle ++ "," ++ stops ++ ")")


{-| Provides a stop for a [gradient](https://css-tricks.com/snippets/css/css-linear-gradient/).

    linearGradient toTop (stop red) (stop blue) []

See also [`stop2`](#stop2) for controlling stop positioning.

-}
stop : Value Color -> Value { provides | colorStop : Supported }
stop (Value colorVal) =
    Value colorVal


{-| Provides a stop for a [gradient](https://css-tricks.com/snippets/css/css-linear-gradient/).

    linearGradient toTop (stop2 red (px 20)) (stop blue) []

See also [`stop`](#stop) if you don't need to control the stop position.

-}
stop2 :
    Value Color
    -> Value (LengthSupported { pct : Supported })
    -> Value { provides | colorStop : Supported }
stop2 (Value colorVal) (Value positionVal) =
    Value (colorVal ++ " " ++ positionVal)


{-| Provides a stop for a [gradient](https://css-tricks.com/snippets/css/css-linear-gradient/).

    linearGradient (stop3 (hex "111") zero (pt 1)) (stop3 (hex "6454") (pt 2) (pct 45))

-}
stop3 :
    Value Color
    -> Value (LengthSupported { pct : Supported })
    -> Value (LengthSupported { pct : Supported })
    -> Value { provides | colorStop : Supported }
stop3 (Value colorVal) (Value positionStart) (Value positionEnd) =
    Value (colorVal ++ " " ++ positionStart ++ "," ++ positionEnd)


{-| Provides the [`to bottom` side angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toBottom (stop red) (stop blue) []

If you want your gradient to go to a corner, use [`toBottomLeft`](#toBottomLeft) or [`toBottomRight`](#toBottomRight):

    linearGradient toBottomLeft (stop red) (stop blue) []

    linearGradient toBottomRight (stop red) (stop blue) []

-}
toBottom : Value { provides | toBottom : Supported }
toBottom =
    Value "to bottom"


{-| Provides the [`to bottom left` corner angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toBottomLeft (stop red) (stop blue) []

If you want your gradient to go to a side, use [`toBottom`](#toBottom) or [`toLeft`](#toLeft) instead:

    linearGradient toBottom (stop red) (stop blue) []

    linearGradient toLeft (stop red) (stop blue) []

-}
toBottomLeft : Value { provides | toBottomLeft : Supported }
toBottomLeft =
    Value "to bottom left"


{-| Provides the [`to bottom right` corner angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toBottomRight (stop red) (stop blue) []

If you want your gradient to go to a side, use [`toBottom`](#toBottom) or [`toRight`](#toRight) instead:

    linearGradient toBottom (stop red) (stop blue) []

    linearGradient toRight (stop red) (stop blue) []

-}
toBottomRight : Value { provides | toBottomRight : Supported }
toBottomRight =
    Value "to bottom right"


{-| Provides the [`to left` side angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toLeft (stop red) (stop blue) []

If you want your gradient to go to a corner, use [`toTopLeft`](#toTopLeft) or [`toBottomLeft`](#toBottomLeft):

    linearGradient toTopLeft (stop red) (stop blue) []

    linearGradient toBottomLeft (stop red) (stop blue) []

-}
toLeft : Value { provides | toLeft : Supported }
toLeft =
    Value "to left"


{-| Provides the [`to right` side angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toRight (stop red) (stop blue) []

If you want your gradient to go to a corner, use [`toTopRight`](#toTopRight) or [`toBottomRight`](#toBottomRight):

    linearGradient toTopRight (stop red) (stop blue) []

    linearGradient toBottomRight (stop red) (stop blue) []

-}
toRight : Value { provides | toRight : Supported }
toRight =
    Value "to right"


{-| Provides the [`to top` side angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toTop (stop red) (stop blue) []

If you want your gradient to go to a corner, use [`toTopLeft`](#toTopLeft) or [`toTopRight`](#toTopRight):

    linearGradient toTopLeft (stop red) (stop blue) []

    linearGradient toTopRight (stop red) (stop blue) []

-}
toTop : Value { provides | toTop : Supported }
toTop =
    Value "to top"


{-| Provides the [`to top left` corner angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toTopLeft (stop red) (stop blue) []

If you want your gradient to go to a side, use [`toTop`](#toTop) or [`toLeft`](#toLeft) instead:

    linearGradient toTop (stop red) (stop blue) []

    linearGradient toLeft (stop red) (stop blue) []

-}
toTopLeft : Value { provides | toTopLeft : Supported }
toTopLeft =
    Value "to top left"


{-| Provides the [`to top right` corner angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toTopRight (stop red) (stop blue) []

If you want your gradient to go to a side, use [`toTop`](#toTop) or [`toRight`](#toRight) instead:

    linearGradient toTop (stop red) (stop blue) []

    linearGradient toRight (stop red) (stop blue) []

-}
toTopRight : Value { provides | toTopRight : Supported }
toTopRight =
    Value "to top right"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------------- SHADOWS -------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Configuration for [`boxShadow`](#boxShadow).
-}
type alias BoxShadowConfig =
    { offsetX :
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    , offsetY :
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    , blurRadius :
        Maybe
            (Value
                (LengthSupported
                    { pct : Supported
                    }
                )
            )
    , spreadRadius :
        Maybe
            (Value
                (LengthSupported
                    { pct : Supported
                    }
                )
            )
    , color :
        Maybe (Value Color)
    , inset : Bool
    }


{-| Default [`boxShadow`](#boxShadow) configuration.

It is equivalent to the following CSS:

    box-shadow: 0 0;

-}
defaultBoxShadow : BoxShadowConfig
defaultBoxShadow =
    { offsetX = zero
    , offsetY = zero
    , blurRadius = Nothing
    , spreadRadius = Nothing
    , color = Nothing
    , inset = False
    }


{-| The [`box-shadow`](https://css-tricks.com/almanac/properties/b/box-shadow/) property.

    boxShadow initial

    boxShadow none

For defining shadows look at [`boxShadowsMany`](#boxShadowsMany).

-}
boxShadow : BaseValue { none : Supported } -> Style
boxShadow (Value val) =
    appendProperty ("box-shadow:" ++ val)


{-| Sets [`box-shadow`](https://css-tricks.com/almanac/properties/b/box-shadow/).

If you give an empty list, the value will be `none`. This is to make it impossible for it
to have no values in the output.

    boxShadowMany [] -- "box-shadow: none"

    -- "box-shadow: 3px 5px #aabbcc"
    button
        [ css
            [ boxShadowMany
                [ { defaultBoxShadow
                    | offsetX = px 3
                    , offsetY = px 5
                    , color = Just (hex "#aabbcc")
                  }
                ]
            ]
        ]
        [ text "Zap!" ]

-}
boxShadowMany : List BoxShadowConfig -> Style
boxShadowMany configs =
    let
        value =
            case configs of
                [] ->
                    "none"

                _ ->
                    configs
                        |> List.map boxShadowConfigToString
                        |> String.join ", "
    in
    appendProperty ("box-shadow:" ++ value)


boxShadowConfigToString : BoxShadowConfig -> String
boxShadowConfigToString config =
    let
        (Value offsetX) =
            config.offsetX

        (Value offsetY) =
            config.offsetY

        blurRadius =
            case config.blurRadius of
                Just (Value value) ->
                    " " ++ value

                Nothing ->
                    case config.spreadRadius of
                        Just _ ->
                            " 0"

                        Nothing ->
                            ""

        spreadRadius =
            case config.spreadRadius of
                Just (Value value) ->
                    " " ++ value

                Nothing ->
                    ""

        insetStr =
            if config.inset then
                "inset "

            else
                ""

        colorVal =
            config.color
                |> Maybe.map (Value.unpack >> (++) " ")
                |> Maybe.withDefault ""
    in
    insetStr ++ offsetX ++ " " ++ offsetY ++ blurRadius ++ spreadRadius ++ colorVal


{-| Configuration for [`textShadow`](#textShadow).
-}
type alias TextShadowConfig =
    { offsetX :
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    , offsetY :
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    , blurRadius :
        Maybe
            (Value
                (LengthSupported
                    { pct : Supported
                    }
                )
            )
    , color : Maybe (Value Color)
    }


{-| Default [`textShadow`](#textShadow) configuration.

It is equivalent to the following CSS:

    text-shadow: 0 0;

-}
defaultTextShadow : TextShadowConfig
defaultTextShadow =
    { offsetX = zero
    , offsetY = zero
    , blurRadius = Nothing
    , color = Nothing
    }

{-| The [`text-shadow`](https://css-tricks.com/almanac/properties/b/text-shadow/) property.

    boxShadow initial

    boxShadow none

This 1-argument variant is for single keyword values only. 
For defining shadows look at [`textShadowMany`](#textShadowMany).

-}

textShadow : BaseValue { none : Supported } -> Style
textShadow (Value val) =
    appendProperty ("text-shadow:" ++ val)


{-| Sets [`text-shadow`](https://css-tricks.com/almanac/properties/t/text-shadow/).

This multi-argument variant is for defining shadows only.
For single keyword values, look at [`textShadow`](#textShadow).


    textShadowMany [] -- "text-shadow: unset"

    -- "text-shadow: 3px 5px #aabbcc"
    span
        [ css
            [ textShadow
                [ { defaultTextShadow
                    | offsetX = px 3
                    , offsetY = px 5
                    , color = Just (hex "#aabbcc")
                  }
                ]
            ]
        ]
        [ text "Zap!" ]

-}
textShadowMany : List TextShadowConfig -> Style
textShadowMany configs =
    let
        values =
            case configs of
                [] ->
                    "unset"

                _ ->
                    configs
                        |> List.map textShadowConfigToString
                        |> String.join ","
    in
    appendProperty ("text-shadow:" ++ values)


textShadowConfigToString : TextShadowConfig -> String
textShadowConfigToString config =
    let
        offsetX =
            Value.unpack config.offsetX

        offsetY =
            Value.unpack config.offsetY

        blurRadius =
            config.blurRadius
                |> Maybe.map (Value.unpack >> (++) " ")
                |> Maybe.withDefault ""

        colorSetting =
            config.color
                |> Maybe.map (Value.unpack >> (++) " ")
                |> Maybe.withDefault ""
    in
    offsetX ++ " " ++ offsetY ++ blurRadius ++ colorSetting


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------------- TRANSFORM --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A type alias used to accept a [transform-function](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function).
-}
type alias TransformFunction =
    TransformFunctionSupported {}



{-| A type alias used to accept a [transform-function](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function)
among other values.
-}
type alias TransformFunctionSupported supported =
    { supported
        | matrix : Supported
        , matrix3d : Supported
        , translate : Supported
        , translate2 : Supported
        , translateX : Supported
        , translateY : Supported
        , translateZ : Supported
        , translate3d : Supported
        , scale_ : Supported
        , scale2_ : Supported
        , scaleX : Supported
        , scaleY : Supported
        , scaleZ : Supported
        , scale3d : Supported
        , skew : Supported
        , skew2 : Supported
        , skewX : Supported
        , skewY : Supported
        , rotate_ : Supported
        , rotateX : Supported
        , rotateY : Supported
        , rotateZ : Supported
        , rotate3d : Supported
        , perspective_ : Supported
    }


{-| The [`transform`](https://css-tricks.com/almanac/properties/t/transform/) property.

    transform <| matrix 1.0 2.0 3.0 4.0 5.0 6.0
    transform <| matrix3d 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1
    transform <| translate (px 12)
    transform <| translate2 (px 12) (pct 50)
    transform <| translateX (em 2)
    transform <| translateY (inch 3)
    transform <| translateZ (px 2)
    transform <| translate3d (px 12) (pct 50) (em 3)
    transform <| scale_ 2
    transform <| scale2_ 2 0.5
    transform <| scaleX 2
    transform <| scaleY 0.5
    transform <| scaleZ 0.3
    transform <| scale3d 2.5 1.2 0.3
    transform <| skew (deg 20)
    transform <| skew2 (deg 30)
    transform <| skewX (deg 30)
    transform <| skewY (rad 1.07)
    transform <| rotate_ (turn 0.5)
    transform <| rotateX (deg 10)
    transform <| rotateY (deg 10)
    transform <| rotateZ (deg 10)
    transform <| rotate3d 1 2.0 3.0 (deg 10)
    transform <| perspective_ (px 17)

-}
transform : BaseValue (TransformFunctionSupported { none : Supported }) -> Style
transform (Value val) =
    appendProperty ("transform:" ++ val)


{-| Sets [`transform`](https://css-tricks.com/almanac/properties/t/transform/)
with a series of transform-functions.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    transformMany [ translate (px 12), scale_ 2, skew (deg 20) ]

    transformMany [] -- transform: unset;

-}
transformMany :
    List (Value TransformFunction)
    -> Style
transformMany values =
    appendProperty ("transform:" ++ valueListToString " " values)


{-| Sets [`transform-origin`](https://css-tricks.com/almanac/properties/t/transform-origin/).

This is the 1-argument variant, which lets you set certain
keywords and single lengths or percentages.

    transformOrigin top_

    transformOrigin center

    transformOrigin bottom

    transformOrigin (px 30)

    transformOrigin (pct 50)

    transformOrigin2 left_ top_

    transformOrigin2 right_ center 

    transformOrigin2 right_ bottom_

    transformOrigin2 (pct 50) (pct 50)

    transformOrigin3 (pct 10) (px 2) (px 10)

    transformOrigin3 left_ (px 5) (px -4)

    transformOrigin3 right_ bottom_ (rem 2)

-}
transformOrigin :
    BaseValue
        ( LengthSupported 
            { top_ : Supported
            , center : Supported
            , bottom_ : Supported
            , left_ : Supported
            , right_ : Supported
            , pct : Supported
            }
        )
    -> Style
transformOrigin (Value vert) =
    appendProperty ("transform-origin:" ++ vert)


{-| Sets [`transform-origin`](https://css-tricks.com/almanac/properties/t/transform-origin/).

This 2-argument variant lets you set x and y offsets in a single declaration.


    transformOrigin2 left_ top_

    transformOrigin2 right_ center 

    transformOrigin2 right_ bottom_

    transformOrigin2 (pct 50) (pct 50)

-}
transformOrigin2 :
    Value ( LengthSupported
            { left_ : Supported
            , right_ : Supported
            , center : Supported
            , pct : Supported
            }
        )
    ->
        Value ( LengthSupported
                { top_ : Supported
                , bottom_ : Supported
                , center : Supported
                , pct : Supported
                }
            )
    -> Style
transformOrigin2 (Value horiz) (Value vert) =
    appendProperty ("transform-origin:" ++ horiz ++ " " ++ vert)


{-| Sets [`transform-origin`](https://css-tricks.com/almanac/properties/t/transform-origin/).

This 3-argument variant lets you set x, y and z offsets in a single declaration.

    transformOrigin3 (pct 10) (px 2) (px 10)

    transformOrigin3 left_ (px 5) (px -4)

    transformOrigin3 right_ bottom_ (rem 2)


-}
transformOrigin3 :
    Value ( LengthSupported
            { left_ : Supported
            , right_ : Supported
            , center : Supported
            , pct : Supported
            }
        )
    ->
        Value ( LengthSupported
                { top_ : Supported
                , bottom_ : Supported
                , center : Supported
                , pct : Supported
                }
            )
    -> Value ( Length )
    -> Style
transformOrigin3 (Value xVal) (Value yVal) (Value zVal ) =
    appendProperty ("transform-origin:" ++ xVal ++ " " ++ yVal ++ " " ++ zVal)


{-| Sets the [`transform-box`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box) property.

    transformBox contentBox

    transformBox fillBox
-}
transformBox :
    BaseValue
        { contentBox : Supported
        , borderBox : Supported
        , fillBox : Supported
        , strokeBox : Supported
        , viewBox : Supported
        }
    -> Style
transformBox (Value val) =
    appendProperty ("transform-box:" ++ val)


{-| Sets the [`transform-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style) property.

    transformStyle flat

    transformStyle inherit
-}
transformStyle :
    BaseValue
        { flat : Supported
        , preserve3d : Supported
        }
    -> Style
transformStyle (Value val) =
    appendProperty <| "transform-style:" ++ val


{-| The `flat` value used in the [`transformStyle`](#transformStyle) property.

    transformStyle flat

-}
flat : Value { provides | flat : Supported }
flat =
    Value "flat"


{-| The `preserve-3d` value used in the [`transformStyle`](#transformStyle) property.

    transformStyle preserve3d

-}
preserve3d : Value { provides | preserve3d : Supported }
preserve3d =
    Value "preserve-3d"


{-| Sets `matrix` value for usage with [`transform`](#transform).
The first four numeric values describe the linear transformation.
The last two numeric values describe the translation to apply.

        transform (matrix 1 2 -1 1 80 80)

-}
matrix :
    Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Value { provides | matrix : Supported }
matrix a b c d tx ty =
    Value
        ("matrix("
            ++ String.fromFloat a
            ++ ","
            ++ String.fromFloat b
            ++ ","
            ++ String.fromFloat c
            ++ ","
            ++ String.fromFloat d
            ++ ","
            ++ String.fromFloat tx
            ++ ","
            ++ String.fromFloat ty
            ++ ")"
        )


{-| Sets `matrix3d` value for usage with [`transform`](#transform).
Every fourth number describes the translation to apply. All other describe the
linear tranformation.

        transform (matrix3d 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1)

-}
matrix3d :
    Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Value { provides | matrix3d : Supported }
matrix3d a1 b1 c1 d1 a2 b2 c2 d2 a3 b3 c3 d3 a4 b4 c4 d4 =
    Value
        ("matrix3d("
            ++ String.fromFloat a1
            ++ ","
            ++ String.fromFloat b1
            ++ ","
            ++ String.fromFloat c1
            ++ ","
            ++ String.fromFloat d1
            ++ ","
            ++ String.fromFloat a2
            ++ ","
            ++ String.fromFloat b2
            ++ ","
            ++ String.fromFloat c2
            ++ ","
            ++ String.fromFloat d2
            ++ ","
            ++ String.fromFloat a3
            ++ ","
            ++ String.fromFloat b3
            ++ ","
            ++ String.fromFloat c3
            ++ ","
            ++ String.fromFloat d3
            ++ ","
            ++ String.fromFloat a4
            ++ ","
            ++ String.fromFloat b4
            ++ ","
            ++ String.fromFloat c4
            ++ ","
            ++ String.fromFloat d4
            ++ ")"
        )



-- TRANSLATION (moving)


{-| Sets `translate` value for usage with [`transform`](#transform).

    transform (translate (px 10))

-}
translate :
    Value ( LengthSupported { pct : Supported } )
    -> Value { provides | translate : Supported }
translate (Value valX) =
    Value ("translate(" ++ valX ++ ")")


{-| Sets `translate` value for usage with [`transform`](#transform).

    transform (translate (px 10) (px 20))

-}
translate2 :
    Value ( LengthSupported { pct : Supported } )
    -> Value ( LengthSupported { pct : Supported } )
    -> Value { provides | translate2 : Supported }
translate2 (Value valX) (Value valY) =
    Value ("translate(" ++ valX ++ "," ++ valY ++ ")")


{-| Sets `translateX` value for usage with [`transform`](#transform).

    transform (translateX (px 10))

-}
translateX :
    Value ( LengthSupported { pct : Supported } )
    -> Value { provides | translateX : Supported }
translateX (Value valX) =
    Value ("translateX(" ++ valX ++ ")")


{-| Sets `translateY` value for usage with [`transform`](#transform).

    transform (translateY (px 10))

-}
translateY :
    Value ( LengthSupported { pct : Supported } )
    -> Value { provides | translateY : Supported }
translateY (Value valY) =
    Value ("translateY(" ++ valY ++ ")")


{-| Sets `translateZ` value for usage with [`transform`](#transform).

    transform (translateZ (px 10))

-}
translateZ :
    Value Length
    -> Value { provides | translateZ : Supported }
translateZ (Value valZ) =
    Value ("translateZ(" ++ valZ ++ ")")


{-| Sets `translate3d` value for usage with [`transform`](#transform).

    transform (translate3d (px 12) (pct 50) (em 3))

-}
translate3d :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Value Length
    -> Value { provides | translate3d : Supported }
translate3d (Value valX) (Value valY) (Value valZ) =
    Value ("translate3d(" ++ valX ++ "," ++ valY ++ "," ++ valZ ++ ")")



-- SCALING (resizing)


{-| The [`scale`](https://css-tricks.com/almanac/properties/s/scale) property.

This one-argument version lets you set a global value, `none` or
a `num` that will scale the element by both X and Y axes
(equivalent to [`scale_`](#scale_)).

    scale none

    scale (num 3)

    scale2 (num 1) (num 3)

    scale3 (num 1) (num 3) (num 4)

-}
scale :
    BaseValue
        { num : Supported
        , none : Supported
        }
    -> Style
scale (Value val) =
    appendProperty ("scale:" ++ val)


{-| The [`scale`](https://css-tricks.com/almanac/properties/s/scale) property.

This two-argument version lets you specify scaling in X and Y axes
(equivalent to [`scale2_`](#scale2_)).

    scale2 (num 1) (num 3)

-}
scale2 :
    Value
        { num : Supported
        }
    ->
        Value
            { num : Supported
            }
    -> Style
scale2 (Value xVal) (Value yVal) =
    appendProperty ("scale:" ++ xVal ++ " " ++ yVal)


{-| The [`scale`](https://css-tricks.com/almanac/properties/s/scale) property.

This three-argument version lets you specify scaling in X, Y and Z axes
(equivalent to [`scale3d`](#scale3d)).

    scale3 (num 1) (num 3) (num 4)

-}
scale3 :
    Value
        { num : Supported
        }
    ->
        Value
            { num : Supported
            }
    ->
        Value
            { num : Supported
            }
    -> Style
scale3 (Value xVal) (Value yVal) (Value zVal) =
    appendProperty ("scale:" ++ xVal ++ " " ++ yVal ++ " " ++ zVal)


{-| Sets `scale` value for usage with [`transform`](#transform).

    transform (scale_ 0.7)

This is called `scale_` instead of `scale` because [`scale` is already a property function](#scale).

-}
scale_ : Float -> Value { provides | scale_ : Supported }
scale_ val =
    Value ("scale(" ++ String.fromFloat val ++ ")")


{-| Sets `scale` value for usage with [`transform`](#transform).

    transform (scale2_ 0.7 0.7)

This is called `scale2_` instead of `scale2` because [`scale2` is already a property function](#scale2).

-}
scale2_ : Float -> Float -> Value { provides | scale2_ : Supported }
scale2_ valX valY =
    Value ("scale(" ++ String.fromFloat valX ++ "," ++ String.fromFloat valY ++ ")")


{-| Sets `scaleX` value for usage with [`transform`](#transform).

    transform (scaleX 0.7)

-}
scaleX : Float -> Value { provides | scaleX : Supported }
scaleX valX =
    Value ("scaleX(" ++ String.fromFloat valX ++ ")")


{-| Sets `scaleY` value for usage with [`transform`](#transform).

    transform (scaleY 0.7)

-}
scaleY : Float -> Value { provides | scaleY : Supported }
scaleY valY =
    Value ("scaleY(" ++ String.fromFloat valY ++ ")")


{-| Sets `scaleZ` value for usage with [`transform`](#transform).

    transform (scaleZ 0.7)

-}
scaleZ : Float -> Value { provides | scaleZ : Supported }
scaleZ valZ =
    Value ("scaleZ(" ++ String.fromFloat valZ ++ ")")


{-| Sets `scale3d` value for usage with [`transform`](#transform).

    transform (scale3d 2 0.7 0.2)

-}
scale3d :
    Float
    -> Float
    -> Float
    -> Value { provides | scale3d : Supported }
scale3d valX valY valZ =
    Value ("scale3d(" ++ String.fromFloat valX ++ "," ++ String.fromFloat valY ++ "," ++ String.fromFloat valZ ++ ")")


-- ROTATION


{-| The [`rotate`](https://css-tricks.com/almanac/properties/r/rotate/) property.

This one-argument version lets you set a global variable, `none`, or angle.

    rotate none

    rotate inherit

    rotate (deg 60)

    rotate2 x (deg 50)

    rotate2 y (deg 100)

    rotate4 1 1 1 (deg 90)

-}
rotate :
    BaseValue
        (AngleSupported
            { none : Supported
            }
        )
    -> Style
rotate (Value value) =
    appendProperty ("rotate:" ++ value)


{-| The [`rotate`](https://css-tricks.com/almanac/properties/r/rotate/) property.

This 2-argument version lets you set an axis, then an angle value.

    rotate2 x (deg 50)

    rotate2 y (deg 100)


-}
rotate2 :
    Value
        { x : Supported
        , y : Supported
        , z : Supported
        }
    -> Value Angle
    -> Style
rotate2 (Value axisVal) (Value angleVal) =
    appendProperty ("rotate:" ++ axisVal ++ " " ++ angleVal)


{-| The [`rotate`](https://css-tricks.com/almanac/properties/r/rotate/) property.

This 4-argument version lets you set a 3D vector, than an angle value.

    rotate4 1 1 1 (deg 90)
-}
rotate4 :
    Float
    -> Float
    -> Float
    -> Value Angle
    -> Style
rotate4 xVec yVec zVec (Value angleVal) =
    appendProperty<| "rotate:"
        ++ String.fromFloat xVec
        ++ " "
        ++ String.fromFloat yVec
        ++ " "
        ++ String.fromFloat zVec
        ++ " "
        ++ angleVal

{-| Sets `rotate` value for usage with [`transform`](#transform).

    transform (rotate_ (deg 30))

This is called `rotate_` instead of `rotate` because [`rotate` is already a property function](#rotate).

-}
rotate_ :
    Value Angle
    -> Value { provides | rotate_ : Supported }
rotate_ (Value angle) =
    Value ("rotate(" ++ angle ++ ")")


{-| Sets `rotateX` value for usage with [`transform`](#transform).

    transform (rotateX (deg 30))

-}
rotateX :
    Value Angle
    -> Value { provides | rotateX : Supported }
rotateX (Value angle) =
    Value ("rotateX(" ++ angle ++ ")")


{-| Sets `rotateY` value for usage with [`transform`](#transform).

    transform (rotateY (deg 30))

-}
rotateY :
    Value Angle
    -> Value { provides | rotateY : Supported }
rotateY (Value angle) =
    Value ("rotateY(" ++ angle ++ ")")


{-| Sets `rotateZ` value for usage with [`transform`](#transform).

    transform (rotateZ (deg 30))

-}
rotateZ :
    Value Angle
    -> Value { provides | rotateZ : Supported }
rotateZ (Value angle) =
    Value ("rotateZ(" ++ angle ++ ")")


{-| Sets `rotate3d` value for usage with [`transform`](#transform).

    transform (rotate3d 0 1 0 (deg 30))

-}
rotate3d :
    Float
    -> Float
    -> Float
    -> Value Angle
    -> Value { provides | rotate3d : Supported }
rotate3d valX valY valZ (Value angle) =
    Value
        ("rotate3d("
            ++ String.fromFloat valX
            ++ ","
            ++ String.fromFloat valY
            ++ ","
            ++ String.fromFloat valZ
            ++ ","
            ++ angle
            ++ ")"
        )


-- SKEWING (distortion)


{-| Sets `skew` value for usage with [`transform`](#transform).

    transform (skew (deg 30))

-}
skew :
    Value Angle
    -> Value { provides | skew : Supported }
skew (Value angle) =
    Value ("skew(" ++ angle ++ ")")


{-| Sets `skew` value for usage with [`transform`](#transform).

    transform (skew2 (deg 30) (deg 10))

-}
skew2 :
    Value Angle
    -> Value Angle
    -> Value { provides | skew2 : Supported }
skew2 (Value angle1) (Value angle2) =
    Value ("skew(" ++ angle1 ++ "," ++ angle2 ++ ")")


{-| Sets `skewX` value for usage with [`transform`](#transform).

    transform (skewX (deg 30))

-}
skewX :
    Value Angle
    -> Value { provides | skewX : Supported }
skewX (Value angle) =
    Value ("skewX(" ++ angle ++ ")")


{-| Sets `skewY` value for usage with [`transform`](#transform).

    transform (skewY (deg 30))

-}
skewY :
    Value Angle
    -> Value { provides | skewY : Supported }
skewY (Value angle) =
    Value ("skewY(" ++ angle ++ ")")


-- PERSPECTIVE


{-| The [`perspective`](https://css-tricks.com/almanac/properties/p/perspective/) property.

Negative values are not supported and any value smaller than 1px is clamped to 1px.

    perspective none

    perspective (px 100)

    perspective (rem 50)

-}
perspective :
    BaseValue
        (LengthSupported
            { none : Supported
            }
        )
    -> Style
perspective (Value val) =
    appendProperty ("perspective:" ++ val)


{-| The [`perspective-origin`](https://css-tricks.com/almanac/properties/p/perspective-origin/) property.

This one-argument version either supports a global value or the x-position.

    perspectiveOrigin inherit

    perspectiveOrigin left_

    perspectiveOrigin (pct 50)

    perspectiveOrigin2 left_ center

    perspectiveOrigin2 (rem 50) (pct 20)

-}
perspectiveOrigin :
    BaseValue
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , center : Supported
            , right_ : Supported
            , top_ : Supported
            , bottom_ : Supported
            }
        )
    -> Style
perspectiveOrigin (Value val) =
    appendProperty ("perspective-origin:" ++ val)


{-| The [`perspective-origin`](https://css-tricks.com/almanac/properties/p/perspective-origin/) property.

This two-argument version takes an X position and then a Y position.

    pperspectiveOrigin2 left_ center

    perspectiveOrigin2 (rem 50) (pct 20)

-}
perspectiveOrigin2 :
    Value
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , center : Supported
            , right_ : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , top_ : Supported
                , center : Supported
                , bottom_ : Supported
                }
            )
    -> Style
perspectiveOrigin2 (Value xVal) (Value yVal) =
    appendProperty ("perspective-origin:" ++ xVal ++ " " ++ yVal)


{-| Sets `perspective` value for usage with [`transform`](#transform).

    transform (perspective_ (px 17))

The value is called `perspective_` instead of `perspective` because
[`perspective`](#perspective) is already a property function.

-}
perspective_ :
    Value Length
    -> Value { provides | perspective_ : Supported }
perspective_ (Value length) =
    Value ("perspective(" ++ length ++ ")")


{-| Sets [`backface-visibility`](https://css-tricks.com/almanac/properties/b/backface-visibility/)

    backfaceVisibility visible

    backfaceVisibility hidden

-}
backfaceVisibility :
    BaseValue
        { visible : Supported
        , hidden : Supported
        }
    -> Style
backfaceVisibility (Value val) =
    appendProperty ("backface-visibility:" ++ val)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- ANIMATION ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`animation-name`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name) property.

    animationName (customIdent "pulse") []

-}
animationName :
    BaseValue
        { none : Supported
        , string : Supported
        , customIdent : Supported
        }
    -> Style
animationName (Value val) =
    appendProperty ("animation-name:" ++ val)


{-| The [`animation-name`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name) property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    animationNameMany [customIdent "pulse"]

    animationNameMany [] -- animation-name: unset;
-}
animationNameMany :
    List
        (Value
            { none : Supported
            , string : Supported
            , customIdent : Supported
            }
        )
    -> Style
animationNameMany values =
    appendProperty ("animation-name:" ++ valueListToString "," values)


{-| The [`animation-duration`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-duration) property.

    animationDuration (s 1)

-}
animationDuration : BaseValue Time -> Style
animationDuration (Value val) =
    appendProperty ("animation-duration:" ++ val)


{-| The [`animation-duration`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-duration) property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    animationDurationMany [ s 1, ms 300, s 4.5 ]

    animationDurationMany [] -- animation-duration: unset;

-}
animationDurationMany : List (Value Time) -> Style
animationDurationMany values =
    appendProperty ("animation-duration:" ++ valueListToString "," values)


{-| The [`animation-timing-function`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-timing-function) property.

    animationTimingFunction linear

-}
animationTimingFunction : BaseValue EasingFunction -> Style
animationTimingFunction (Value val) =
    appendProperty ("animation-timing-function:" ++ val)


{-| The [`animation-timing-function`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-timing-function) property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    animationTimingFunctionMany linear [ cubicBezier 0.42 0 0.38 1, stepEnd ]

    animationTimingFunctionMany [] -- animation-timing-function: unset;
-}
animationTimingFunctionMany : List (Value EasingFunction) -> Style
animationTimingFunctionMany values =
    appendProperty ("animation-timing-function:" ++ valueListToString "," values)


{-| The [`animation-iteration-count`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-iteration-count) property.

    animationIterationCount (num 3.5)

    animationIterationCount infinite

-}
animationIterationCount :
    BaseValue
        { infinite : Supported
        , num : Supported
        , zero : Supported
        , calc : Supported
        }
    -> Style
animationIterationCount (Value val) =
    appendProperty ("animation-iteration-count:" ++ val)


{-| The [`animation-iteration-count`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-iteration-count) property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    animationIterationCountMany [num 3.5, infinte, zero ]

    animationIterationCountMany [] -- animation-iteration-count: unset;
-}
animationIterationCountMany :
    List
        (Value
            { infinite : Supported
            , num : Supported
            , zero : Supported
            , calc : Supported
            }
        )
    -> Style
animationIterationCountMany values =
    appendProperty ("animation-iteration-count:" ++ valueListToString "," values)


{-| The [`animation-direction`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-direction) property.

    animationDirection reverse

-}
animationDirection :
    BaseValue
        { normal : Supported
        , reverse : Supported
        , alternate : Supported
        , alternateReverse : Supported
        }
    -> Style
animationDirection (Value val) =
    appendProperty ("animation-direction:" ++ val)


{-| The [`animation-direction`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-direction) property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    animationDirectionMany [ reverse, normal, alternate, alternateReverse ]

    animationDirectionMany [] -- animation-direction: unset;
-}
animationDirectionMany :
    List
        (Value
            { normal : Supported
            , reverse : Supported
            , alternate : Supported
            , alternateReverse : Supported
            }
        )
    -> Style
animationDirectionMany values =
    appendProperty ("animation-direction:" ++ valueListToString "," values)


{-| The [`animation-play-state`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-play-state) property.

    animationPlayState running

-}
animationPlayState :
    BaseValue
        { running : Supported
        , paused : Supported
        }
    -> Style
animationPlayState (Value val) =
    appendProperty ("animation-play-state:" ++ val)


{-| The [`animation-play-state`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-play-state) property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    animationPlayStateMany [ running, paused ]

    animationPlayStateMany [] -- animation-play-state: unset;
-}
animationPlayStateMany :
    List
        (Value
            { running : Supported
            , paused : Supported
            }
        )
    -> Style
animationPlayStateMany values =
    appendProperty ("animation-play-state:" ++ valueListToString "," values)


{-| The [`animation-delay`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-delay) property.

    animationDelay (s 1)

-}
animationDelay : BaseValue Time -> Style
animationDelay (Value val) =
    appendProperty ("animation-delay:" ++ val)


{-| The [`animation-delay`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-delay) property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    animationDelayMany (s 1) [ ms 300, s 4.5 ]

    animationDelayMany [] -- animation-delay: unset;
-}
animationDelayMany : List (Value Time) -> Style
animationDelayMany values =
    appendProperty ("animation-delay:" ++ valueListToString "," values)


{-| The [`animation-fill-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-fill-mode) property.

    animationFillMode forwards

-}
animationFillMode :
    BaseValue
        { none : Supported
        , forwards : Supported
        , backwards : Supported
        , both : Supported
        }
    -> Style
animationFillMode (Value val) =
    appendProperty ("animation-fill-mode:" ++ val)


{-| The [`animation-fill-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-fill-mode) property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    animationFillModeMany [ forwards, none, both, backwards ]

    animationFillModeMany [] -- animation-fill-mode: unset;
-}
animationFillModeMany :
    List
        (Value
            { none : Supported
            , forwards : Supported
            , backwards : Supported
            , both : Supported
            }
        )
    -> Style
animationFillModeMany values =
    appendProperty ("animation-fill-mode:" ++ valueListToString "," values)



-- ANIMATION VALUES --


{-| A type alias used to accept an [easing-function](https://www.w3.org/TR/css-easing-1/#typedef-easing-function)
among other values.
-}
type alias EasingFunctionSupported supported =
    { supported
        | linear : Supported
        , ease : Supported
        , easeIn : Supported
        , easeOut : Supported
        , easeInOut : Supported
        , cubicBezier : Supported
        , stepStart : Supported
        , stepEnd : Supported
        , steps : Supported
    }


{-| A type alias used to accept an [easing-function](https://www.w3.org/TR/css-easing-1/#typedef-easing-function).
-}
type alias EasingFunction =
    EasingFunctionSupported {}


{-| The `linear` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction linear

-}
linear : Value { provides | linear : Supported }
linear =
    Value "linear"


{-| The `ease` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction ease

-}
ease : Value { provides | ease : Supported }
ease =
    Value "ease"


{-| The `ease-in` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction easeIn

-}
easeIn : Value { provides | easeIn : Supported }
easeIn =
    Value "ease-in"


{-| The `ease-out` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction easeOut

-}
easeOut : Value { provides | easeOut : Supported }
easeOut =
    Value "ease-out"


{-| The `ease-in-out` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction easeInOut

-}
easeInOut : Value { provides | easeInOut : Supported }
easeInOut =
    Value "ease-in-out"


{-| Produces the `cubic-bezier()` value used for properties such as [`animationTimingFunction`](#animationTimingFunction)

    animationTimingFunction (cubicBezier 0.2 0 0.5 1)

-}
cubicBezier : Float -> Float -> Float -> Float -> Value { provides | cubicBezier : Supported }
cubicBezier x1 y1 x2 y2 =
    Value
        ("cubic-bezier("
            ++ String.fromFloat x1
            ++ ","
            ++ String.fromFloat y1
            ++ ","
            ++ String.fromFloat x2
            ++ ","
            ++ String.fromFloat y2
            ++ ")"
        )


{-| The `step-start` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction stepStart

-}
stepStart : Value { provides | stepStart : Supported }
stepStart =
    Value "step-start"


{-| The `step-end` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction stepEnd

-}
stepEnd : Value { provides | stepEnd : Supported }
stepEnd =
    Value "step-end"


{-| Produces the `steps()` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction (steps 3)

-}
steps : Int -> Value { provides | steps : Supported }
steps value =
    Value ("steps(" ++ String.fromInt value ++ ")")


{-| Produces the `steps()` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction (steps2 3 jumpStart)

-}
steps2 :
    Int
    ->
        Value
            { jumpStart : Supported
            , jumpEnd : Supported
            , jumpNone : Supported
            , jumpBoth : Supported
            , start : Supported
            , end : Supported
            }
    -> Value { provides | steps : Supported }
steps2 value (Value stepPosition) =
    Value ("steps(" ++ String.fromInt value ++ "," ++ stepPosition ++ ")")


{-| The `jump-start` value used for functions like [`step2`](#step2)

    steps2 3 jumpStart

-}
jumpStart : Value { provides | jumpStart : Supported }
jumpStart =
    Value "jump-start"


{-| The `jump-end` value used for functions like [`step2`](#step2)

    steps2 3 jumpEnd

-}
jumpEnd : Value { provides | jumpEnd : Supported }
jumpEnd =
    Value "jump-end"


{-| The `jump-none` value used for functions like [`step2`](#step2)

    steps2 3 jumpNone

-}
jumpNone : Value { provides | jumpNone : Supported }
jumpNone =
    Value "jump-none"


{-| The `jump-both` value used for functions like [`step2`](#step2)

    steps2 3 jumpBoth

-}
jumpBoth : Value { provides | jumpBoth : Supported }
jumpBoth =
    Value "jump-both"


{-| The `infinite` value used for functions like [`animationIterationCount`](#animationIterationCount)

    animationIterationCount infinite

-}
infinite : Value { provides | infinite : Supported }
infinite =
    Value "infinite"


{-| The `reverse` value used for functions like [`animationDirection`](#animationDirection)

    animationDirection reverse

-}
reverse : Value { provides | reverse : Supported }
reverse =
    Value "reverse"


{-| The `alternate` value used for functions like [`animationDirection`](#animationDirection)

    animationDirection alternate

-}
alternate : Value { provides | alternate : Supported }
alternate =
    Value "alternate"


{-| The `alternate-reverse` value used for functions like [`animationDirection`](#animationDirection)

    animationDirection alternateReverse

-}
alternateReverse : Value { provides | alternateReverse : Supported }
alternateReverse =
    Value "alternate-reverse"


{-| The `running` value used for functions like [`animationPlayState`](#animationPlayState)

    animationPlayState running

-}
running : Value { provides | running : Supported }
running =
    Value "running"


{-| The `paused` value used for functions like [`animationPlayState`](#animationPlayState)

    animationPlayState paused

-}
paused : Value { provides | paused : Supported }
paused =
    Value "paused"


{-| The `forwards` value used for functions like [`animationFillMode`](#animationFillMode)

    animationFillMode forwards

-}
forwards : Value { provides | forwards : Supported }
forwards =
    Value "forwards"


{-| The `backwards` value used for functions like [`animationFillMode`](#animationFillMode)

    animationFillMode backwards

-}
backwards : Value { provides | backwards : Supported }
backwards =
    Value "backwards"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------------- VISUAL STUFF? ----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`opacity`](https://css-tricks.com/almanac/properties/o/opacity/)

    opacity (num 0.5)

    opacity (num 1.0)

    opacity zero

-}
opacity :
    BaseValue
        { num : Supported
        , zero : Supported
        , calc : Supported
        , pct : Supported
        }
    -> Style
opacity (Value val) =
    appendProperty ("opacity:" ++ val)


{-| Sets [`visibility`](https://css-tricks.com/almanac/properties/v/visibility/)

      visibility visible
      visibility hidden
      visibility collapse

-}
visibility :
    BaseValue
        { visible : Supported
        , hidden : Supported
        , collapse : Supported
        }
    -> Style
visibility (Value str) =
    appendProperty ("visibility:" ++ str)


{-| Sets [`mix-blend-mode`](https://css-tricks.com/almanac/properties/m/mix-blend-mode/)

    mixBlendMode multiply

    mixBlendMode saturation

-}
mixBlendMode :
    BaseValue BlendMode
    -> Style
mixBlendMode (Value val) =
    appendProperty ("mix-blend-mode:" ++ val)


{-| Sets [`image-rendering`](https://css-tricks.com/almanac/properties/i/image-rendering/)

    imageRendering auto

    imageRendering crispEdges

    imageRendering pixelated

-}
imageRendering :
    BaseValue
        { auto : Supported
        , crispEdges : Supported
        , pixelated : Supported
        }
    -> Style
imageRendering (Value val) =
    appendProperty ("image-rendering:" ++ val)


{-| Sets `pixelated` value for usage with [`imageRendering`](#imageRendering).

    imageRendering pixelated

-}
pixelated : Value { provides | pixelated : Supported }
pixelated =
    Value "pixelated"


{-| Sets `crisp-edges` value for usage with [`imageRendering`](#imageRendering).

    imageRendering crispEdges

-}
crispEdges : Value { provides | crispEdges : Supported }
crispEdges =
    Value "crisp-edges"


{-| The 1-argument variant of the
[`clip-path`](https://css-tricks.com/almanac/properties/c/clip-path/) property.

    clipPath marginBox

    clipPath inherit

    clipPath (circle (pct 2))

    clipPath (url "test-img.svg")

    clipPath2 marginBox (circleAt2 farthestSide left top)
    
-}
clipPath :
    BaseValue
        (BasicShapeSupported
            { none : Supported
            , url : Supported
            , marginBox : Supported
            , borderBox : Supported
            , paddingBox : Supported
            , contentBox : Supported
            , fillBox : Supported
            , strokeBox : Supported
            , viewBox : Supported
            }
        )
    -> Style
clipPath (Value val) =
    appendProperty ("clip-path:" ++ val)


{-| The 2-argument variant of the
[`clip-path`](https://css-tricks.com/almanac/properties/c/clip-path/) property.

    clipPath2 marginBox (circleAt2 farthestSide left top)
-}
clipPath2 :
    Value
        { marginBox : Supported
        , borderBox : Supported
        , paddingBox : Supported
        , contentBox : Supported
        , fillBox : Supported
        , strokeBox : Supported
        , viewBox : Supported
        }
    -> Value (BasicShape)
    -> Style
clipPath2 (Value val1) (Value val2) =
    appendProperty ("clip-path:" ++ val1 ++ " " ++ val2)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------------- MASKS ---------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets the [`mask-border-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-mode)
property.

    maskBorderMode inherit

    maskBorderMode luminance
-}
maskBorderMode :
    BaseValue
        { luminance : Supported
        , alpha : Supported
        }
    -> Style
maskBorderMode (Value val) =
    appendProperty <| "mask-border-mode:" ++ val



{-| Sets the 1-argument variant of the [`mask-border-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-repeat)
property.

    maskBorderRepeat stretch

    maskBorderRepeat revert

    maskBorderRepeat2 stretch repeat
-}
maskBorderRepeat :
    BaseValue
        { stretch : Supported
        , repeat : Supported
        , round_ : Supported
        , space : Supported
        }
    -> Style
maskBorderRepeat (Value val) =
    appendProperty <| "mask-border-repeat:" ++ val


{-| Sets the 2-argument variant of the [`mask-border-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-repeat)
property.

    maskBorderRepeat2 stretch repeat
-}
maskBorderRepeat2 :
    Value
        { stretch : Supported
        , repeat : Supported
        , round_ : Supported
        , space : Supported
        }
    -> Value
        { stretch : Supported
        , repeat : Supported
        , round_ : Supported
        , space : Supported
        }
    -> Style
maskBorderRepeat2 (Value val1) (Value val2) =
    appendProperty <|
        "mask-border-repeat:"
        ++ val1
        ++ " "
        ++ val2


{-| Sets the 1-argument variant of the [`mask-border-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-outset)
property.

    maskBorderOutset revert

    maskBorderOutset (num 2.5)

    maskBorderOutset (px 30)

    --             top+bottom | left+right
    maskBorderOutset2 (px 30) (px 10)

    --               top | left+right | bottom
    maskBorderOutset3 (px 12) (px 16) (px 4)
    
    --                  top | right | bottom | left
    maskBorderOutset4 (rem 2) (rem 1) (rem 3) (rem 4)
-}
maskBorderOutset :
    BaseValue
        ( LengthSupported
            { num : Supported }
        )
    -> Style
maskBorderOutset (Value val) =
    appendProperty <| "mask-border-outset:" ++ val


{-| Sets the 2-argument variant of the [`mask-border-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-outset)
property.
    
    --             top+bottom | left+right
    maskBorderOutset2 (px 30) (px 10)
-}
maskBorderOutset2 :
    Value
        ( LengthSupported
            { num : Supported }
        )
    -> Value
        ( LengthSupported
            { num : Supported }
        )
    -> Style
maskBorderOutset2 (Value valTB) (Value valLR) =
    appendProperty <|
        "mask-border-outset:"
        ++ valTB
        ++ " "
        ++ valLR


{-| Sets the 3-argument variant of the [`mask-border-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-outset)
property.

    --               top | left+right | bottom
    maskBorderOutset3 (px 12) (px 16) (px 4)
-}
maskBorderOutset3 :
    Value
        ( LengthSupported
            { num : Supported }
        )
    -> Value
        ( LengthSupported
            { num : Supported }
        )
    -> Value
        ( LengthSupported
            { num : Supported }
        )
    -> Style
maskBorderOutset3 (Value valTop) (Value valLR) (Value valBottom) =
    appendProperty <|
        "mask-border-outset:"
        ++ valTop
        ++ " "
        ++ valLR
        ++ " "
        ++ valBottom


{-| Sets the 4-argument variant of the [`mask-border-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-outset)
property.

    --                  top | right | bottom | left
    maskBorderOutset4 (rem 2) (rem 1) (rem 3) (rem 4)
-}
maskBorderOutset4 :
    Value
        ( LengthSupported
            { num : Supported }
        )
    -> Value
        ( LengthSupported
            { num : Supported }
        )
    -> Value
        ( LengthSupported
            { num : Supported }
        )
    -> Value
        ( LengthSupported
            { num : Supported }
        )
    -> Style
maskBorderOutset4 (Value valTop) (Value valRight) (Value valBottom) (Value valLeft) =
    appendProperty <|
        "mask-border-outset:"
        ++ valTop
        ++ " "
        ++ valRight
        ++ " "
        ++ valBottom
        ++ " "
        ++ valLeft


{-| Sets the 1-argument variant of the [`mask-border-slice`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-slice)
property.

    maskBorderSlice initial

    maskBorderSlice (num 2.5)

    maskBorderSlice (rem 3)

    --           top+bottom | left+right
    maskBorderSlice2 (num 30) (pct 10)

    --              top | left+right | bottom
    maskBorderSlice3 (px 12) (num 2) fill_
    
    --                 top | right | bottom | left
    maskBorderSlice4 (rem 2) (rem 1) fill_ (rem 4)
-}
maskBorderSlice :
    BaseValue
        { num : Supported
        , pct : Supported
        , fill_ : Supported
        }
    -> Style
maskBorderSlice (Value val) =
    appendProperty <| "mask-border-slice:" ++ val


{-| Sets the 2-argument variant of the [`mask-border-slice`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-slice)
property.

    --           top+bottom | left+right
    maskBorderSlice2 (num 30) (pct 10)
-}
maskBorderSlice2 :
    Value
        { num : Supported
        , pct : Supported
        , fill_ : Supported
        }
    -> Value
        { num : Supported
        , pct : Supported
        , fill_ : Supported
        }
    -> Style
maskBorderSlice2 (Value valTB) (Value valLR) =
    appendProperty <|
        "mask-border-slice:"
        ++ valTB
        ++ " "
        ++ valLR


{-| Sets the 3-argument variant of the [`mask-border-slice`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-slice)
property.

    --              top | left+right | bottom
    maskBorderSlice3 (px 12) (num 2) fill_
-}
maskBorderSlice3 :
    Value
        { num : Supported
        , pct : Supported
        , fill_ : Supported
        }
    -> Value
        { num : Supported
        , pct : Supported
        , fill_ : Supported
        }
    -> Value
        { num : Supported
        , pct : Supported
        , fill_ : Supported
        }
    -> Style
maskBorderSlice3 (Value valTop) (Value valLR) (Value valBottom) =
    appendProperty <|
        "mask-border-slice:"
        ++ valTop
        ++ " "
        ++ valLR
        ++ " "
        ++ valBottom


{-| Sets the 4-argument variant of the [`mask-border-slice`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-slice)
property.

    --                 top | right | bottom | left
    maskBorderSlice4 (rem 2) (rem 1) fill_ (rem 4)
-}
maskBorderSlice4 :
    Value
        { num : Supported
        , pct : Supported
        , fill_ : Supported
        }
    -> Value
        { num : Supported
        , pct : Supported
        , fill_ : Supported
        }
    -> Value
        { num : Supported
        , pct : Supported
        , fill_ : Supported
        }
    -> Value
        { num : Supported
        , pct : Supported
        , fill_ : Supported
        }
    -> Style
maskBorderSlice4 (Value valTop) (Value valRight) (Value valBottom) (Value valLeft) =
    appendProperty <|
        "mask-border-slice:"
        ++ valTop
        ++ " "
        ++ valRight
        ++ " "
        ++ valBottom
        ++ " "
        ++ valLeft


{-| Sets the 1-argument variant of the [`mask-border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-width)
property.

    maskBorderWidth initial

    maskBorderWidth auto

    maskBorderWidth (rem 3)

    --           top+bottom | left+right
    maskBorderWidth2 (num 30) (pct 10)

    --              top | left+right | bottom
    maskBorderWidth3 (px 12) auto (px 20)
    
    --                 top | right | bottom | left
    maskBorderWidth4 (rem 2) (rem 1) auto (rem 4)
-}
maskBorderWidth :
    BaseValue
        ( LengthSupported
            { auto : Supported
            , pct : Supported
            , num : Supported
            }
        )
    -> Style
maskBorderWidth (Value val) =
    appendProperty <| "mask-border-width:" ++ val


{-| Sets the 2-argument variant of the [`mask-border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-width)
property.

    --           top+bottom | left+right
    maskBorderWidth2 (num 30) (pct 10)
-}
maskBorderWidth2 :
    Value
        ( LengthSupported
            { auto : Supported
            , pct : Supported
            , num : Supported
            }
        )
    -> Value
        ( LengthSupported
            { auto : Supported
            , pct : Supported
            , num : Supported
            }
        )
    -> Style
maskBorderWidth2 (Value valTB) (Value valLR) =
    appendProperty <|
        "mask-border-width:"
        ++ valTB
        ++ " "
        ++ valLR


{-| Sets the 3-argument variant of the [`mask-border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-width)
property.

    --              top | left+right | bottom
    maskBorderWidth3 (px 12) auto (px 20)
-}
maskBorderWidth3 :
    Value
        ( LengthSupported
            { auto : Supported
            , pct : Supported
            , num : Supported
            }
        )
    -> Value
        ( LengthSupported
            { auto : Supported
            , pct : Supported
            , num : Supported
            }
        )
    -> Value
        ( LengthSupported
            { auto : Supported
            , pct : Supported
            , num : Supported
            }
        )
    -> Style
maskBorderWidth3 (Value valTop) (Value valLR) (Value valBottom) =
    appendProperty <|
        "mask-border-width:"
        ++ valTop
        ++ " "
        ++ valLR
        ++ " "
        ++ valBottom


{-| Sets the 4-argument variant of the [`mask-border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-width)
property.

    --                 top | right | bottom | left
    maskBorderWidth4 (rem 2) (rem 1) auto (rem 4)
-}
maskBorderWidth4 :
    Value
        ( LengthSupported
            { auto : Supported
            , pct : Supported
            , num : Supported
            }
        )
    -> Value
        ( LengthSupported
            { auto : Supported
            , pct : Supported
            , num : Supported
            }
        )
    -> Value
        ( LengthSupported
            { auto : Supported
            , pct : Supported
            , num : Supported
            }
        )
    -> Value
        ( LengthSupported
            { auto : Supported
            , pct : Supported
            , num : Supported
            }
        )
    -> Style
maskBorderWidth4 (Value valTop) (Value valRight) (Value valBottom) (Value valLeft) =
    appendProperty <|
        "mask-border-width:"
        ++ valTop
        ++ " "
        ++ valRight
        ++ " "
        ++ valBottom
        ++ " "
        ++ valLeft


{-| The 1-argument variant of the [`mask-clip`](https://css-tricks.com/almanac/properties/m/mask-clip/)
property.

This does not support non-standard keyword values such as `border`.

    maskClip contentBox

    maskClip revert

    maskClipMany [contentBox, marginBox, noClip]

-}
maskClip :
    BaseValue
        { contentBox : Supported
        , paddingBox : Supported
        , borderBox : Supported
        , marginBox : Supported
        , fillBox : Supported
        , strokeBox : Supported
        , viewBox : Supported
        , noClip : Supported
        }
    -> Style
maskClip (Value val) =
    appendProperty <| "mask-clip:" ++ val


{-| The multi-argument variant of the [`mask-clip`](https://css-tricks.com/almanac/properties/m/mask-clip/)
property.

This does not support non-standard keyword values such as `border`.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    maskClipMany [contentBox, marginBox, noClip]
    
    maskClipMany [] -- mask-clip: unset;
-}
maskClipMany :
    List
        ( Value
            { contentBox : Supported
            , paddingBox : Supported
            , borderBox : Supported
            , marginBox : Supported
            , fillBox : Supported
            , strokeBox : Supported
            , viewBox : Supported
            , noClip : Supported
            }
        )
    -> Style
maskClipMany values =
    appendProperty <| "mask-clip:" ++ valueListToString "," values


{-| The [`mask-composite`](https://css-tricks.com/almanac/properties/m/mask-composite/)
property.

    maskComposite add

    maskComposite revert
-}
maskComposite :
    BaseValue
        { add : Supported
        , subtract : Supported
        , intersect : Supported
        , exclude : Supported
        }
    -> Style
maskComposite (Value val) =
    appendProperty ("mask-composite:" ++ val)


{-| The 1-argument variant of the [`mask-mode`](https://css-tricks.com/almanac/properties/m/mask-mode/)
property.

    maskMode inherit

    maskMode alpha

    maskModeMany [alpha, luminance, alpha, matchSource]
-}
maskMode :
    BaseValue
        { alpha : Supported
        , luminance : Supported
        , matchSource : Supported
        }
    -> Style
maskMode (Value val) =
    appendProperty ("mask-mode:" ++ val)


{-| The multi-argument variant of the [`mask-mode`](https://css-tricks.com/almanac/properties/m/mask-mode/)
property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    maskModeMany [alpha, luminance, alpha, matchSource]

    maskModeMany [] -- mask-mode: unset;
-}
maskModeMany :
    List
        ( Value
            { alpha : Supported
            , luminance : Supported
            , matchSource : Supported
            }
        )
    -> Style
maskModeMany values =
    appendProperty <| "mask-mode:" ++ valueListToString "," values



{-| The 1-argument variant of the [`mask-origin`](https://css-tricks.com/almanac/properties/m/mask-origin/)
property.

    maskOrigin inherit

    maskOrigin contentBox

    maskOriginMany [paddingBox, borderBox]
-}
maskOrigin :
    BaseValue
        { contentBox : Supported
        , paddingBox : Supported
        , borderBox : Supported
        , marginBox : Supported
        }
    -> Style
maskOrigin (Value val) =
    appendProperty ("mask-origin:" ++ val)


{-| The multi-argument variant of the [`mask-origin`](https://css-tricks.com/almanac/properties/m/mask-origin/)
property.

If you give an empty list, the value will be `unset`. This is to make it impossible for it
to have no values in the output.

    maskOriginMany [paddingBox, borderBox]

    maskOriginMany [] -- mask-origin: unset;
-}
maskOriginMany :
    List
        ( Value
            { contentBox : Supported
            , paddingBox : Supported
            , borderBox : Supported
            , marginBox : Supported
            }
        )
    -> Style
maskOriginMany values =
    appendProperty <| "mask-origin:" ++ valueListToString "," values


{-| The 1-argument variant of the [`mask-position`](https://css-tricks.com/almanac/properties/m/mask-position/)
property.

    maskPosition top_

    maskPosition inherit
-}
maskPosition :
    BaseValue
        { top_ : Supported
        , bottom_ : Supported
        , left_ : Supported
        , right_ : Supported
        , center : Supported
        }
    -> Style
maskPosition (Value val) =
    appendProperty <| "mask-position:" ++ val


{-| The 1-argument variant of the [`mask-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-repeat)
property.

    maskRepeat revert

    maskRepeat repeatX

    maskRepeat Css.round

    maskRepeat2 repeat space

-}
maskRepeat :
    BaseValue
        { repeat : Supported
        , repeatX : Supported
        , repeatY : Supported
        , space : Supported
        , round_ : Supported
        , noRepeat : Supported
        }
    -> Style
maskRepeat (Value val) =
    appendProperty <| "mask-repeat:" ++ val


{-| The 2-argument variant of the [`mask-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-repeat)
property.

    maskRepeat2 repeat space
-}
maskRepeat2 :
    Value
        { repeat : Supported
        , space : Supported
        , round_ : Supported
        , noRepeat : Supported
        }
    -> Value
        { repeat : Supported
        , space : Supported
        , round_ : Supported
        , noRepeat : Supported
        }
    -> Style
maskRepeat2 (Value valX) (Value valY) =
    appendProperty <| "mask-repeat:" ++ valX ++ " " ++ valY


-- {-| The multi-argument variant of the [`mask-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-repeat)
-- property.

--     maskRepeatMany [repeat, Css.round, space]
-- -}
-- maskRepeatMany :
--     List
--         ( Value
--             { repeat : Supported
--             , space : Supported
--             , round_ : Supported
--             , noRepeat : Supported
--             }
--         )
--     -> Style
-- maskRepeatMany list =
--     appendProperty <|
--         "mask-repeat:"
--         ++
--         ( list
--         |> List.map (\(Value val) -> val)
--         |> String.join ", "
--         )


{-| The 1-argument variant of the [`mask-size`](https://css-tricks.com/almanac/properties/m/mask-size/)
property.

    maskSize auto

    maskSize (pct 20)

    maskSize (rem 200)

    maskSize2 auto (pct 10)

-}
maskSize :
    BaseValue
        ( LengthSupported
            { pct : Supported
            , auto : Supported
            , cover : Supported
            , contain_ : Supported
            }
        )
    -> Style
maskSize (Value val) =
    appendProperty <| "mask-size:" ++ val


{-| The 2-argument variant of the [`mask-size`](https://css-tricks.com/almanac/properties/m/mask-size/)
property.

    maskSize auto

    maskSize (pct 20)

    maskSize (rem 200)

    maskSize2 auto (pct 10)

-}
maskSize2 :
    Value
        ( LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Value
        ( LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
maskSize2 (Value valX) (Value valY) =
    appendProperty <| "mask-size:" ++ valX ++ " " ++ valY


-- {-|
-- -}
-- maskSizeMany :
--     List
--         ( Value
--             ( LengthSupported
--                 { pct : Supported
--                 , auto : Supported
--                 }
--             )
--         )
--     -> Style
-- maskSizeMany list =
--     appendProperty <|
--         "mask-size:"
--         ++
--         ( list
--         |> List.map (\(Value val) -> val)
--         |> String.join ", "
--         )

{-| Sets the [`mask-type`](https://css-tricks.com/almanac/properties/m/mask-type/)
property.

    maskType inherit

    maskType luminance
-}
maskType :
    BaseValue
        { luminance : Supported
        , alpha : Supported
        }
    -> Style
maskType (Value val) =
    appendProperty <| "mask-type:" ++ val


{-| Sets `no-clip` value for usage with [`maskClip`](#maskClip).

    maskClip noClip

-}
noClip : Value { provides | noClip : Supported }
noClip =
    Value "no-clip"


{-| Sets `add` value for usage with [`maskComposite`](#maskComposite).

    maskComposite add

-}
add : Value { provides | add : Supported }
add =
    Value "add"


{-| Sets `subtract` value for usage with [`maskComposite`](#maskComposite).

    maskComposite subtract

-}
subtract : Value { provides | subtract : Supported }
subtract =
    Value "subtract"


{-| Sets `intersect` value for usage with [`maskComposite`](#maskComposite).

    maskComposite intersect

-}
intersect : Value { provides | intersect : Supported }
intersect =
    Value "intersect"


{-| Sets `exclude` value for usage with [`maskComposite`](#maskComposite).

    maskComposite exclude

-}
exclude : Value { provides | exclude : Supported }
exclude =
    Value "exclude"


{-| Sets `alpha` value for usage with [`maskMode`](#maskMode), [`maskType`](#maskType) and [`maskBorderMode`](#maskBorderMode).

    maskMode alpha

    maskType alpha

    maskBorderMode alpha

-}
alpha : Value { provides | alpha : Supported }
alpha =
    Value "alpha"


{-| Sets `luminance` value for usage with [`maskMode`](#maskMode), [`maskType`](#maskType) and [`maskBorderMode`](#maskBorderMode).

    maskMode luminance

    maskType luminance

    maskBorderMode luminance

-}
luminance : Value { provides | luminance : Supported }
luminance =
    Value "luminance"


{-| Sets `match-source` value for usage with [`maskMode`](#maskMode).

    maskMode matchSource

-}
matchSource : Value { provides | matchSource : Supported }
matchSource =
    Value "match-source"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- FILTERS --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`filter`](https://css-tricks.com/almanac/properties/f/filter/) property.

This single-argument version lets you use global value keywords, as
well as `none`, URLs to SVG filters and single filter functions.

If you want to stack filter functions, use [`filterMany`](#filterMany).

    filter <| blur (px 6)

    filter <| grayscale (pct 60)

    filter <| url "thing.svg#filter1"

    filter none

    filter inherit

    filterMany [] -- unset

    filterMany [ invert (pct 70), sepia(pct 50) ]
-}
filter :
    BaseValue
        ( FilterFunctionSupported
            (   { url : Supported
                , none : Supported
                }
            )
        )
    -> Style
filter (Value val) =
    appendProperty ("filter:" ++ val)


{-| The [`filter`](https://css-tricks.com/almanac/properties/b/backdrop-filter/) property.

This multi-argument version lets you stack multiple filter functions and URLs to SVG filters.
An empty list will create an `unset` value.

    filterMany [] -- unset

    filterMany [ invert (pct 70), sepia(pct 50) ]

-}
filterMany :
    List ( Value 
            ( FilterFunctionSupported
                { url : Supported }
            )
        )
    -> Style
filterMany values =
    appendProperty <| "filter:" ++ valueListToString " " values


{-| The [`backdrop-filter`](https://css-tricks.com/almanac/properties/b/backdrop-filter/) property.

This single-argument version lets you use global value keywords, as
well as `none`, URLs to SVG filters and single filter functions.

If you want to stack filter functions, use [`backdropFilterMany`](#backdropFilterMany).

    backdropFilter <| blur (px 6)

    backdropFilter <| grayscale (pct 60)

    backdropFilter <| url "thing.svg#filter1"

    backdropFilter none

    backdropFilter inherit

    backdropFilterMany [] -- unset

    backdropFilterMany [ invert (pct 70), sepia(pct 50) ]

-}
backdropFilter :
    BaseValue
        ( FilterFunctionSupported
            (   { url : Supported
                , none : Supported
                }
            )
        )
    -> Style
backdropFilter (Value val) =
    appendProperty ("backdrop-filter:" ++ val)


{-| The [`backdrop-filter`](https://css-tricks.com/almanac/properties/b/backdrop-filter/) property.

This multi-argument version lets you stack multiple filter functions and URLs to SVG filters.
An empty list will create an `unset` value.

    backdropFilterMany [] -- unset

    backdropFilterMany [ invert (pct 70), sepia(pct 50) ]

-}
backdropFilterMany :
    List ( Value 
            ( FilterFunctionSupported
                { url : Supported }
            )
        )
    -> Style
backdropFilterMany values =
    appendProperty <| "backdrop-filter:" ++ valueListToString " " values


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- DRAWING --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`paint-order`](https://css-tricks.com/almanac/properties/p/paint-order/) property.

This one-argument version indicates which parts of text and shape graphics are
painted first, followed by the other two in their relative default order.

    paintOrder normal -- normal paint order.

    paintOrder2 fill_ stroke -- fill, stroke, then markers.

    paintOrder3 markers stroke fill_ -- markers, stroke, then fill.

-}
paintOrder :
    BaseValue
        { normal : Supported
        , stroke : Supported
        , markers : Supported
        }
    -> Style
paintOrder (Value val) =
    appendProperty ("paint-order:" ++ val)


{-| The [`paint-order`](https://css-tricks.com/almanac/properties/p/paint-order/) property.

This two-argument version indicates which parts of text and shape graphics are
painted first, followed by the other remaining one.

    paintOrder2 fill_ stroke -- fill, stroke, then markers.

-}
paintOrder2 :
    Value
        { fill_ : Supported
        , stroke : Supported
        , markers : Supported
        }
    ->
        Value
            { fill_ : Supported
            , stroke : Supported
            , markers : Supported
            }
    -> Style
paintOrder2 (Value val1) (Value val2) =
    appendProperty ("paint-order:" ++ val1 ++ " " ++ val2)


{-| The [`paint-order`](https://css-tricks.com/almanac/properties/p/paint-order/) property.

This three-argument version explicitly indicates in which order should all the parts of text
and shape graphics be painted.

    paintOrder3 markers stroke fill_ -- markers, stroke, then fill.

-}
paintOrder3 :
    Value
        { fill_ : Supported
        , stroke : Supported
        , markers : Supported
        }
    ->
        Value
            { fill_ : Supported
            , stroke : Supported
            , markers : Supported
            }
    ->
        Value
            { fill_ : Supported
            , stroke : Supported
            , markers : Supported
            }
    -> Style
paintOrder3 (Value val1) (Value val2) (Value val3) =
    appendProperty ("paint-order:" ++ val1 ++ " " ++ val2 ++ " " ++ val3)


{-| Provides the `markers` value for [`paintOrder`](#paintOrder).

    paintOrder markers

-}
markers : Value { provides | markers : Supported }
markers =
    Value "markers"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------------- USING A PRINTER ----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`bleed`](https://css-tricks.com/almanac/properties/b/bleed/)

    bleed auto

    bleed (pt 10)

-}
bleed :
    BaseValue
        (LengthSupported
            { auto : Supported
            }
        )
    -> Style
bleed (Value val) =
    appendProperty ("bleed:" ++ val)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
---------------------- SVG STROKE ATTRIBUTES ---------------------------
--------------- (THAT CAN BE USED AS CSS PROPERTIES) -------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`fill`](https://css-tricks.com/almanac/properties/f/fill/)
**Note:** `fill` also accepts the patterns of SVG shapes that are defined inside of a [`defs`](https://css-tricks.com/snippets/svg/svg-patterns/) element.

    fill (hex "#60b5cc")

    fill (rgb 96 181 204)

    fill (rgba 96 181 204 0.5)

    fill (url "#pattern")

-}
fill :
    BaseValue
        (ColorSupported
            { url : Supported
            }
        )
    -> Style
fill (Value val) =
    appendProperty ("fill:" ++ val)


{-| Sets [`stroke-dasharray`](https://css-tricks.com/almanac/properties/s/stroke-dasharray/)

    strokeDasharray (num 2)

    strokeDasharray (num 2.5)

    strokeDasharray (em 2)

    strokeDasharray (pct 15)

-}
strokeDasharray :
    BaseValue
        (LengthSupported
            { num : Supported
            , pct : Supported
            }
        )
    -> Style
strokeDasharray (Value val) =
    appendProperty ("stroke-dasharray:" ++ val)


{-| Sets [`stroke-dashoffset`](https://css-tricks.com/almanac/properties/s/stroke-dashoffset/)

    strokeDashoffset zero

    strokeDashoffset (num 100)

    strokeDashoffset (pct 25)

-}
strokeDashoffset :
    BaseValue
        { zero : Supported
        , calc : Supported
        , num : Supported
        , pct : Supported
        }
    -> Style
strokeDashoffset (Value val) =
    appendProperty ("stroke-dashoffset:" ++ val)


{-| Sets [`stroke-width`](https://css-tricks.com/almanac/properties/s/stroke-width/)

    strokeWidth zero

    strokeWidth (px 2)

    strokeWidth (em 2)

    strokeWidth (num 2)

    strokeWidth (num 2.5)

    strokeWidth (pct 15)

-}
strokeWidth :
    BaseValue
        (LengthSupported
            { num : Supported
            , pct : Supported
            }
        )
    -> Style
strokeWidth (Value val) =
    appendProperty ("stroke-width:" ++ val)


{-| Sets [`stroke-align`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-align)

**Note:** This function accepts `inset_` rather than `inset` because
[`inset` is already a property function](#inset).

      strokeAlign center
      strokeAlign inset_
      strokeAlign outset

-}
strokeAlign :
    BaseValue
        { center : Supported
        , inset_ : Supported
        , outset : Supported
        }
    -> Style
strokeAlign (Value val) =
    appendProperty ("stroke-align:" ++ val)


{-| Sets [`stroke-color`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-color)

    strokeColor (rgb 0 100 44)

    strokeColor (hex "#FF9E2C")

-}
strokeColor : BaseValue Color -> Style
strokeColor (Value val) =
    appendProperty ("stroke-color:" ++ val)


{-| Sets [`stroke-image`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-image)

    strokeImage (url "#svg-pattern")

    strokeImage (url "http://www.example.com/chicken.jpg")

-}
strokeImage :
    BaseValue
        { url : Supported
        , none : Supported
        }
    -> Style
strokeImage (Value value) =
    appendProperty ("stroke-image:" ++ value)


{-| Sets [`stroke-miterlimit`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-miterlimit)

    strokeMiterlimit (num 4)

-}
strokeMiterlimit :
    BaseValue
        { num : Supported
        }
    -> Style
strokeMiterlimit (Value val) =
    appendProperty ("stroke-miterlimit:" ++ val)


{-| Sets [`stroke-opacity`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-opacity)

    strokeOpacity (num 0.5)

-}
strokeOpacity :
    BaseValue
        { num : Supported
        }
    -> Style
strokeOpacity (Value val) =
    appendProperty ("stroke-opacity:" ++ val)


{-| Sets [`stroke-position`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-position).

    strokePosition left_

    strokePosition (px 45)

`strokePosition` sets the horizontal direction. If you need the vertical
direction instead, use [`strokePosition2`](#strokePosition2) like this:

    strokePosition zero (px 45)

If you need to set the offsets from the right or bottom, use
[`strokePosition4`](#strokePosition4) like this:

    strokePosition4 right_ (px 20) bottom_ (pct 25)

-}
strokePosition :
    BaseValue
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , right_ : Supported
            , center : Supported
            }
        )
    -> Style
strokePosition (Value horiz) =
    appendProperty ("stroke-position:" ++ horiz)


{-| Sets [`stroke-position`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-position).

    strokePosition2 left_ top_

    strokePosition2 (px 45) (pct 50)

`strokePosition2` sets both the horizontal and vertical directions (in that
order, same as CSS.) If you need only the horizontal, you can use
[`strokePosition`](#strokePosition) instead:

    strokePosition left_

If you need to set the offsets from the right or bottom, use
[`strokePosition4`](#strokePosition4) like this:

    strokePosition4 right_ (px 20) bottom_ (pct 25)

-}
strokePosition2 :
    Value
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , right_ : Supported
            , center : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , top_ : Supported
                , bottom_ : Supported
                , center : Supported
                }
            )
    -> Style
strokePosition2 (Value horiz) (Value vert) =
    appendProperty ("stroke-position:" ++ horiz ++ " " ++ vert)


{-| Sets [`stroke-position`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-position).

    strokePosition4 right_ (px 20) bottom_ (pct 30)

The four-argument form of stroke-position alternates sides and offets. So the
example above would position the stroke-image 20px from the right, and 30%
from the bottom.

See also [`strokePosition`](#strokePosition) for horizontal alignment and
[`strokePosition2`](#strokePosition2) for horizontal (from left) and
vertical (from top) alignment.

-}
strokePosition4 :
    Value
        { left_ : Supported
        , right_ : Supported
        }
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            { top_ : Supported
            , bottom_ : Supported
            }
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
strokePosition4 (Value horiz) (Value horizAmount) (Value vert) (Value vertAmount) =
    appendProperty
        ("stroke-position:"
            ++ horiz
            ++ " "
            ++ horizAmount
            ++ " "
            ++ vert
            ++ " "
            ++ vertAmount
        )


{-| Sets [`stroke-repeat`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-repeat)

    strokeRepeat repeat

    strokeRepeat repeatX

If you need to set horizontal and vertical direction separately, see
[`strokeRepeat2`](#strokeRepeat2)

-}
strokeRepeat :
    BaseValue
        { repeat : Supported
        , repeatX : Supported
        , repeatY : Supported
        , space : Supported
        , round_ : Supported
        , noRepeat : Supported
        }
    -> Style
strokeRepeat (Value repeatVal) =
    appendProperty ("stroke-repeat:" ++ repeatVal)


{-| Sets [`stroke-repeat`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-repeat) along the horizontal axis, then the vertical axis.

    strokeRepeat2 repeat space

    strokeRepeat2 space round

If you only need to set one value for both, see
[`strokeRepeat`](#strokeRepeat) instead.

-}
strokeRepeat2 :
    Value
        { repeat : Supported
        , space : Supported
        , round_ : Supported
        , noRepeat : Supported
        }
    ->
        Value
            { repeat : Supported
            , space : Supported
            , round_ : Supported
            , noRepeat : Supported
            }
    -> Style
strokeRepeat2 (Value horiz) (Value vert) =
    appendProperty ("stroke-repeat:" ++ horiz ++ " " ++ vert)


{-| Sets [`stroke-size`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-size).

    strokeSize cover

    strokeSize (px 400)

If you give a length value, it will be used for the width. The height will be set
proportional to the size of the [`stroke-image`](#strokeImage). If you
need to set both width and height explicitly, use
[`strokeImage2`](#strokeImage2) instead.

-}
strokeSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            , cover : Supported
            }
        )
    -> Style
strokeSize (Value sizeVal) =
    appendProperty ("stroke-size:" ++ sizeVal)


{-| Sets [`stroke-size`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-size).

    strokeSize2 (px 300) (px 100)

    strokeSize2 auto (px 400)

If you only want to set the width, use [`strokeImage`](#strokeImage) instead.

-}
strokeSize2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
strokeSize2 (Value widthVal) (Value heightVal) =
    appendProperty ("stroke-size:" ++ widthVal ++ " " ++ heightVal)


{-| Sets [`stroke-dash-corner`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-dash-corner).

    strokeDashCorner none

    strokeDashCorner (px 10)

    strokeDashCorner (em 5)

-}
strokeDashCorner :
    BaseValue
        (LengthSupported
            { none : Supported
            , pct : Supported
            , auto : Supported
            , cover : Supported
            }
        )
    -> Style
strokeDashCorner (Value sizeVal) =
    appendProperty ("stroke-dash-corner:" ++ sizeVal)


{-| Sets [`stroke-linecap`](https://css-tricks.com/almanac/properties/s/stroke-linecap/)

    strokeLinecap butt

    strokeLinecap square

    strokeLinecap round

-}
strokeLinecap :
    BaseValue
        { butt : Supported
        , square : Supported
        , round_ : Supported
        }
    -> Style
strokeLinecap (Value val) =
    appendProperty ("stroke-linecap:" ++ val)


{-| A `butt` value for the [`strokeLinecap`](#strokeLinecap) property.

    strokeLinecap butt

-}
butt : Value { provides | butt : Supported }
butt =
    Value "butt"


{-| The `square` value used by properties such as [`strokeLinecap`](#strokeLinecap),
[`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType).

    strokeLinecap square

    listStyleType square

-}
square : Value { provides | square : Supported }
square =
    Value "square"



{-| Sets [`stroke-break`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-break)

      strokeBreak boundingBox
      strokeBreak slice
      strokeBreak clone

-}
strokeBreak :
    BaseValue
        { boundingBox : Supported
        , slice : Supported
        , clone : Supported
        }
    -> Style
strokeBreak (Value val) =
    appendProperty ("stroke-break:" ++ val)


{-| A `boundingBox` value for the [`strokeBreak`](#strokeBreak) property.

      strokeBreak boundingBox

-}
boundingBox : Value { provides | boundingBox : Supported }
boundingBox =
    Value "bounding-box"


{-| A `slice` value for the [`strokeBreak`](#strokeBreak) and [`boxDecorationBreak`](#boxDecorationBreak) properties.

      strokeBreak slice

      boxDecorationbreak clone

-}
slice : Value { provides | slice : Supported }
slice =
    Value "slice"


{-| A `clone` value for the [`strokeBreak`](#strokeBreak) and [`boxDecorationBreak`](#boxDecorationBreak) properties.

      strokeBreak clone

      boxDecorationBreak clone

-}
clone : Value { provides | clone : Supported }
clone =
    Value "clone"


{-| Sets [`stroke-origin`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-origin)

    strokeOrign matchParent

    strokeOrign fillBox

    strokeOrign strokeBox

    strokeOrign contentBox

    strokeOrign paddingBox

    strokeOrign borderBox

-}
strokeOrigin :
    BaseValue
        { matchParent : Supported
        , fillBox : Supported
        , strokeBox : Supported
        , contentBox : Supported
        , paddingBox : Supported
        , borderBox : Supported
        }
    -> Style
strokeOrigin (Value val) =
    appendProperty ("stroke-origin:" ++ val)


{-| Sets [`stroke-linejoin`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-linejoin).

    strokeLinejoin crop

    strokeLinejoin arcs

    strokeLinejoin miter

**Note:** if you only want to specifiy the rendering of the cap of a corner you need to use [`strokeLinejoin2`](#strokeLinejoin2)
and set it's first value to `miter` like so: `strokeLinejoin2 miter bevel`.

-}
strokeLinejoin :
    BaseValue
        { crop : Supported
        , arcs : Supported
        , miter : Supported
        }
    -> Style
strokeLinejoin (Value val) =
    appendProperty ("stroke-linejoin:" ++ val)


{-| Sets [`stroke-linejoin`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-linejoin).

    strokeLinejoin crop bevel

    strokeLinejoin arcs round

    strokeLinejoin miter fallback

-}
strokeLinejoin2 :
    Value
        { crop : Supported
        , arcs : Supported
        , miter : Supported
        }
    ->
        Value
            { bevel : Supported
            , round_ : Supported
            , fallback : Supported
            }
    -> Style
strokeLinejoin2 (Value extendCorner) (Value capRender) =
    appendProperty ("stroke-linejoin:" ++ extendCorner ++ " " ++ capRender)


{-| Sets `crop` value for usage with [`strokeLinejoin`](#strokeLinejoin).

    strokeLinejoin crop

-}
crop : Value { provides | crop : Supported }
crop =
    Value "crop"


{-| Sets `arcs` value for usage with [`strokeLinejoin`](#strokeLinejoin).

    strokeLinejoin arcs

-}
arcs : Value { provides | arcs : Supported }
arcs =
    Value "arcs"


{-| Sets `miter` value for usage with [`strokeLinejoin`](#strokeLinejoin).

    strokeLinejoin miter

-}
miter : Value { provides | miter : Supported }
miter =
    Value "miter"


{-| Sets `bevel` value for usage with [`strokeLinejoin`](#strokeLinejoins2).

    strokeLinejoin miter bevel

-}
bevel : Value { provides | bevel : Supported }
bevel =
    Value "bevel"


{-| Sets [`stroke-dash-justify`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-dash-justify).

      strokeDashJustify none
      strokeDashJustify stretch
      strokeDashJustify compress
      strokeDashJustify dashes
      strokeDashJustify gaps

-}
strokeDashJustify :
    BaseValue
        { none : Supported
        , stretch : Supported
        , compress : Supported
        , dashes : Supported
        , gaps : Supported
        }
    -> Style
strokeDashJustify (Value val) =
    appendProperty ("stroke-dash-justify:" ++ val)


{-| Sets `compress` value for usage with [`strokeDashJustify`](#strokeDashJustify).

      strokeDashJustify compress

-}
compress : Value { provides | compress : Supported }
compress =
    Value "compress"


{-| Sets `dashes` value for usage with [`strokeDashJustify`](#strokeDashJustify).

      strokeDashJustify dashes

-}
dashes : Value { provides | dashes : Supported }
dashes =
    Value "dashes"


{-| Sets `gaps` value for usage with [`strokeDashJustify`](#strokeDashJustify).

      strokeDashJustify gaps

-}
gaps : Value { provides | gaps : Supported }
gaps =
    Value "gaps"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------------- TRANSITIONS ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


type alias AnimatableSupported supported =
    { supported
        | all_ : Supported
        , background_ : Supported
        , backgroundColor_ : Supported
        , backgroundPosition_ : Supported
        , backgroundSize_ : Supported
        , border_ : Supported
        , borderBottom_ : Supported
        , borderBottomColor_ : Supported
        , borderBottomLeftRadius_ : Supported
        , borderBottomRightRadius_ : Supported
        , borderBottomWidth_ : Supported
        , borderColor_ : Supported
        , borderLeft_ : Supported
        , borderLeftColor_ : Supported
        , borderLeftWidth_ : Supported
        , borderRadius_ : Supported
        , borderRight_ : Supported
        , borderRightColor_ : Supported
        , borderRightWidth_ : Supported
        , borderTop_ : Supported
        , borderTopColor_ : Supported
        , borderTopLeftRadius_ : Supported
        , borderTopRightRadius_ : Supported
        , borderTopWidth_ : Supported
        , borderWidth_ : Supported
        , bottom_ : Supported
        , boxShadow_ : Supported
        , caretColor_ : Supported
        , clip_ : Supported
        , clipPath_ : Supported
        , color_ : Supported
        , columnCount_ : Supported
        , columnGap_ : Supported
        , columnRule_ : Supported
        , columnRuleColor_ : Supported
        , columnRuleWidth_ : Supported
        , columnWidth_ : Supported
        , columns_ : Supported
        , filter_ : Supported
        , flex_ : Supported
        , flexBasis_ : Supported
        , flexGrow_ : Supported
        , flexShrink_ : Supported
        , font_ : Supported
        , fontSize_ : Supported
        , fontSizeAdjust_ : Supported
        , fontStretch_ : Supported
        , fontVariationSettings_ : Supported
        , fontWeight_ : Supported
        , gridColumnGap_ : Supported
        , gridGap_ : Supported
        , gridRowGap_ : Supported
        , height_ : Supported
        , left_ : Supported
        , letterSpacing_ : Supported
        , lineHeight_ : Supported
        , margin_ : Supported
        , marginBottom_ : Supported
        , marginLeft_ : Supported
        , marginRight_ : Supported
        , marginTop_ : Supported
        , mask_ : Supported
        , maskPosition_ : Supported
        , maskSize_ : Supported
        , maxHeight_ : Supported
        , maxWidth_ : Supported
        , minHeight_ : Supported
        , minWidth_ : Supported
        , objectPosition_ : Supported
        , offset_ : Supported
        , offsetAnchor_ : Supported
        , offsetDistance_ : Supported
        , offsetPath_ : Supported
        , offsetRotate_ : Supported
        , opacity__ : Supported
        , order_ : Supported
        , outline_ : Supported
        , outlineColor_ : Supported
        , outlineOffset_ : Supported
        , outlineWidth_ : Supported
        , padding_ : Supported
        , paddingBottom_ : Supported
        , paddingLeft_ : Supported
        , paddingRight_ : Supported
        , paddingTop_ : Supported
        , right_ : Supported
        , tabSize_ : Supported
        , textIndent_ : Supported
        , textShadow_ : Supported
        , top_ : Supported
        , transform_ : Supported
        , transformOrigin_ : Supported
        , verticalAlign_ : Supported
        , visibility_ : Supported
        , width_ : Supported
        , wordSpacing_ : Supported
        , zIndex_ : Supported
    }


type alias Animatable =
    AnimatableSupported {}

{-| The `background` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
background_ : Value { provided | background_ : Supported }
background_ =
    Value "background"

{-| The `background-color` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
backgroundColor_ : Value { provided | backgroundColor_ : Supported }
backgroundColor_ =
    Value "background-color"

{-| The `background-position` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
backgroundPosition_ : Value { provided | backgroundPosition_ : Supported }
backgroundPosition_ =
    Value "background-position"

{-| The `background-size` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
backgroundSize_ : Value { provided | backgroundSize_ : Supported }
backgroundSize_ =
    Value "background-size"

{-| The `border` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
border_ : Value { provided | border_ : Supported }
border_ =
    Value "border"

{-| The `border-bottom` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderBottom_ : Value { provided | borderBottom_ : Supported }
borderBottom_ =
    Value "border-bottom"

{-| The `border-bottom-color` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderBottomColor_ : Value { provided | borderBottomColor_ : Supported }
borderBottomColor_ =
    Value "border-bottom-color"

{-| The `border-bottom-left-radius` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderBottomLeftRadius_ : Value { provided | borderBottomLeftRadius_ : Supported }
borderBottomLeftRadius_ =
    Value "border-bottom-left-radius"

{-| The `border-bottom-right-radius` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderBottomRightRadius_ : Value { provided | borderBottomRightRadius_ : Supported }
borderBottomRightRadius_ =
    Value "border-bottom-right-radius"

{-| The `border-bottom-width` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderBottomWidth_ : Value { provided | borderBottomWidth_ : Supported }
borderBottomWidth_ =
    Value "border-bottom-width"

{-| The `border-color` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderColor_ : Value { provided | borderColor_ : Supported }
borderColor_ =
    Value "border-color"

{-| The `border-left` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderLeft_ : Value { provided | borderLeft_ : Supported }
borderLeft_ =
    Value "border-left"

{-| The `border-left-color` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderLeftColor_ : Value { provided | borderLeftColor_ : Supported }
borderLeftColor_ =
    Value "border-left-color"

{-| The `border-left-width` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderLeftWidth_ : Value { provided | borderLeftWidth_ : Supported }
borderLeftWidth_ =
    Value "border-left-width"

{-| The `border-radius` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderRadius_ : Value { provided | borderRadius_ : Supported }
borderRadius_ =
    Value "border-radius"

{-| The `border-right` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderRight_ : Value { provided | borderRight_ : Supported }
borderRight_ =
    Value "border-right"

{-| The `border-right-color` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderRightColor_ : Value { provided | borderRightColor_ : Supported }
borderRightColor_ =
    Value "border-right-color"

{-| The `border-right-width` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderRightWidth_ : Value { provided | borderRightWidth_ : Supported }
borderRightWidth_ =
    Value "border-right-width"

{-| The `border-top` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderTop_ : Value { provided | borderTop_ : Supported }
borderTop_ =
    Value "border-top"

{-| The `border-top-color` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderTopColor_ : Value { provided | borderTopColor_ : Supported }
borderTopColor_ =
    Value "border-top-color"

{-| The `border-top-left-radius` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderTopLeftRadius_ : Value { provided | borderTopLeftRadius_ : Supported }
borderTopLeftRadius_ =
    Value "border-top-left-radius"

{-| The `border-top-right-radius` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderTopRightRadius_ : Value { provided | borderTopRightRadius_ : Supported }
borderTopRightRadius_ =
    Value "border-top-right-radius"

{-| The `border-top-width` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderTopWidth_ : Value { provided | borderTopWidth_ : Supported }
borderTopWidth_ =
    Value "border-top-width"

{-| The `border-width` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
borderWidth_ : Value { provided | borderWidth_ : Supported }
borderWidth_ =
    Value "border-width"

{-| The `box-shadow` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
boxShadow_ : Value { provided | boxShadow_ : Supported }
boxShadow_ =
    Value "box-shadow"

{-| The `caret-color` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
caretColor_ : Value { provided | caretColor_ : Supported }
caretColor_ =
    Value "caret-color"

{-| The `clip` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
clip_ : Value { provided | clip_ : Supported }
clip_ =
    Value "clip"

{-| The `clip-path` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
clipPath_ : Value { provided | clipPath_ : Supported }
clipPath_ =
    Value "clip-path"

{-| The `column-count` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
columnCount_ : Value { provided | columnCount_ : Supported }
columnCount_ =
    Value "column-count"

{-| The `column-gap` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
columnGap_ : Value { provided | columnGap_ : Supported }
columnGap_ =
    Value "column-gap"

{-| The `column-rule` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
columnRule_ : Value { provided | columnRule_ : Supported }
columnRule_ =
    Value "column-rule"

{-| The `column-rule-color` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
columnRuleColor_ : Value { provided | columnRuleColor_ : Supported }
columnRuleColor_ =
    Value "column-rule-color"

{-| The `column-rule-width` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
columnRuleWidth_ : Value { provided | columnRuleWidth_ : Supported }
columnRuleWidth_ =
    Value "column-rule-width"

{-| The `column-width` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
columnWidth_ : Value { provided | columnWidth_ : Supported }
columnWidth_ =
    Value "column-width"

{-| The `columns` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
columns_ : Value { provided | columns_ : Supported }
columns_ =
    Value "columns"

{-| The `filter` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
filter_ : Value { provided | filter_ : Supported }
filter_ =
    Value "filter"

{-| The `flex-basis` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
flexBasis_ : Value { provided | flexBasis_ : Supported }
flexBasis_ =
    Value "flex-basis"

{-| The `flex-grow` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
flexGrow_ : Value { provided | flexGrow_ : Supported }
flexGrow_ =
    Value "flex-grow"

{-| The `flex-shrink` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
flexShrink_ : Value { provided | flexShrink_ : Supported }
flexShrink_ =
    Value "flex-shrink"

{-| The `font` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
font_ : Value { provided | font_ : Supported }
font_ =
    Value "font"

{-| The `font-size` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
fontSize_ : Value { provided | fontSize_ : Supported }
fontSize_ =
    Value "font-size"

{-| The `font-size-adjust` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
fontSizeAdjust_ : Value { provided | fontSizeAdjust_ : Supported }
fontSizeAdjust_ =
    Value "font-size-adjust"

{-| The `font-stretch` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
fontStretch_ : Value { provided | fontStretch_ : Supported }
fontStretch_ =
    Value "font-stretch"

{-| The `font-variation-settings` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
fontVariationSettings_ : Value { provided | fontVariationSettings_ : Supported }
fontVariationSettings_ =
    Value "font-variation-settings"

{-| The `font-weight` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
fontWeight_ : Value { provided | fontWeight_ : Supported }
fontWeight_ =
    Value "font-weight"

{-| The `grid-column-gap` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
gridColumnGap_ : Value { provided | gridColumnGap_ : Supported }
gridColumnGap_ =
    Value "grid-column-gap"

{-| The `grid-gap` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
gridGap_ : Value { provided | gridGap_ : Supported }
gridGap_ =
    Value "grid-gap"

{-| The `grid-row-gap` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
gridRowGap_ : Value { provided | gridRowGap_ : Supported }
gridRowGap_ =
    Value "grid-row-gap"

{-| The `height` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
height_ : Value { provided | height_ : Supported }
height_ =
    Value "height"

{-| The `letter-spacing` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
letterSpacing_ : Value { provided | letterSpacing_ : Supported }
letterSpacing_ =
    Value "letter-spacing"

{-| The `line-height` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
lineHeight_ : Value { provided | lineHeight_ : Supported }
lineHeight_ =
    Value "line-height"

{-| The `margin` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
margin_ : Value { provided | margin_ : Supported }
margin_ =
    Value "margin"

{-| The `margin-bottom` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
marginBottom_ : Value { provided | marginBottom_ : Supported }
marginBottom_ =
    Value "margin-bottom"

{-| The `margin-left` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
marginLeft_ : Value { provided | marginLeft_ : Supported }
marginLeft_ =
    Value "margin-left"

{-| The `margin-right` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
marginRight_ : Value { provided | marginRight_ : Supported }
marginRight_ =
    Value "margin-right"

{-| The `margin-top` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
marginTop_ : Value { provided | marginTop_ : Supported }
marginTop_ =
    Value "margin-top"

{-| The `mask` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
mask_ : Value { provided | mask_ : Supported }
mask_ =
    Value "mask"

{-| The `mask-position` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
maskPosition_ : Value { provided | maskPosition_ : Supported }
maskPosition_ =
    Value "mask-position"

{-| The `mask-size` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
maskSize_ : Value { provided | maskSize_ : Supported }
maskSize_ =
    Value "mask-size"

{-| The `max-height` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
maxHeight_ : Value { provided | maxHeight_ : Supported }
maxHeight_ =
    Value "max-height"

{-| The `max-width` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
maxWidth_ : Value { provided | maxWidth_ : Supported }
maxWidth_ =
    Value "max-width"


{-| The `min-height` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
minHeight_ : Value { provided | minHeight_ : Supported }
minHeight_ =
    Value "min-height"


{-| The `min-width` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
minWidth_ : Value { provided | minWidth_ : Supported }
minWidth_ =
    Value "min-width"


{-| The `object-position` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
objectPosition_ : Value { provided | objectPosition_ : Supported }
objectPosition_ =
    Value "object-position"


{-| The `offset` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
offset_ : Value { provided | offset_ : Supported }
offset_ =
    Value "offset"


{-| The `offset-anchor` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
offsetAnchor_ : Value { provided | offsetAnchor_ : Supported }
offsetAnchor_ =
    Value "offset-anchor"


{-| The `offset-distance` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
offsetDistance_ : Value { provided | offsetDistance_ : Supported }
offsetDistance_ =
    Value "offset-distance"


{-| The `offset-path` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
offsetPath_ : Value { provided | offsetPath_ : Supported }
offsetPath_ =
    Value "offset-path"


{-| The `offset-rotate` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
offsetRotate_ : Value { provided | offsetRotate_ : Supported }
offsetRotate_ =
    Value "offset-rotate"


{-| The `opacity` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
opacity__ : Value { provided | opacity__ : Supported }
opacity__ =
    Value "opacity"


{-| The `order` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
order_ : Value { provided | order_ : Supported }
order_ =
    Value "order"


{-| The `outline` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
outline_ : Value { provided | outline_ : Supported }
outline_ =
    Value "outline"


{-| The `outline-color` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
outlineColor_ : Value { provided | outlineColor_ : Supported }
outlineColor_ =
    Value "outline-color"


{-| The `outline-offset` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
outlineOffset_ : Value { provided | outlineOffset_ : Supported }
outlineOffset_ =
    Value "outline-offset"


{-| The `outline-width` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
outlineWidth_ : Value { provided | outlineWidth_ : Supported }
outlineWidth_ =
    Value "outline-width"


{-| The `padding` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
padding_ : Value { provided | padding_ : Supported }
padding_ =
    Value "padding"


{-| The `padding-bottom` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
paddingBottom_ : Value { provided | paddingBottom_ : Supported }
paddingBottom_ =
    Value "padding-bottom"


{-| The `padding-left` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
paddingLeft_ : Value { provided | paddingLeft_ : Supported }
paddingLeft_ =
    Value "padding-left"


{-| The `padding-right` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
paddingRight_ : Value { provided | paddingRight_ : Supported }
paddingRight_ =
    Value "padding-right"


{-| The `padding-top` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
paddingTop_ : Value { provided | paddingTop_ : Supported }
paddingTop_ =
    Value "padding-top"


{-| The `tab-size` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
tabSize_ : Value { provided | tabSize_ : Supported }
tabSize_ =
    Value "tab-size"


{-| The `text-indent` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
textIndent_ : Value { provided | textIndent_ : Supported }
textIndent_ =
    Value "text-indent"


{-| The `text-shadow` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
textShadow_ : Value { provided | textShadow_ : Supported }
textShadow_ =
    Value "text-shadow"


{-| The `transform` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
transform_ : Value { provided | transform_ : Supported }
transform_ =
    Value "transform"


{-| The `transform-origin` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
transformOrigin_ : Value { provided | transformOrigin_ : Supported }
transformOrigin_ =
    Value "transform-origin"


{-| The `vertical-align` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
verticalAlign_ : Value { provided | verticalAlign_ : Supported }
verticalAlign_ =
    Value "vertical-align"


{-| The `visibility` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
visibility_ : Value { provided | visibility_ : Supported }
visibility_ =
    Value "visibility"


{-| The `width` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
width_ : Value { provided | width_ : Supported }
width_ =
    Value "width"


{-| The `word-spacing` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
wordSpacing_ : Value { provided | wordSpacing_ : Supported }
wordSpacing_ =
    Value "word-spacing"


{-| The `z-index` value used by properties such as [`transition`](#transition),
and [`transition-property`](#transitionProperty).
-}
zIndex_ : Value { provided | zIndex_ : Supported }
zIndex_ =
    Value "z-index"


{-| The `allow-discrete` value used by properties such as [`transition`](#transition),
and [`transition-behavior`](#transitionBehavior).
-}
allowDiscrete : Value { provides | allowDiscrete : Supported }
allowDiscrete =
    Value "allow-discrete"


{-| The [`transition-property`](https://css-tricks.com/almanac/properties/t/transition-property/) property.

    transition-property initial

    transition-property none

    transition-property all

    transition-property margin-right
-}
transitionProperty :
    BaseValue
        (AnimatableSupported
            { none : Supported
            }
        )
    -> Style
transitionProperty (Value val) =
    appendProperty ("transition-property:" ++ val)


{-| The [`transition-timing-function`](https://css-tricks.com/almanac/properties/t/transition-timing-function/) property.

    transition-timing-function ease-out

    transition-timing-function linear
-}
transitionTimingFunction : BaseValue EasingFunction -> Style
transitionTimingFunction (Value val) =
    appendProperty ("transition-timing-function:" ++ val)


{-| The [`transition-duration`](https://css-tricks.com/almanac/properties/t/transition-duration/) property.

    transition-duration 2.5s

    transition-duration 400ms
-}
transitionDuration : BaseValue Time -> Style
transitionDuration (Value val) =
    appendProperty ("transition-duration:" ++ val)


{-| The [`transition-delay`](https://css-tricks.com/almanac/properties/t/transition-delay/) property.

    transition-delay 2.5s

    transition-delay 400ms
-}
transitionDelay : BaseValue Time -> Style
transitionDelay (Value val) =
    appendProperty ("transition-delay:" ++ val)


{-| The [`transition-behavior`](https://css-tricks.com/almanac/properties/t/transition-behavior/) property.

    transition-behavior normal

    transition-behavior allowDiscrete
-}
transitionBehavior :
    BaseValue
        { supported
            | normal : Supported
            , allowDiscrete : Supported
        }
    -> Style
transitionBehavior (Value val) =
    appendProperty ("transition-behavior:" ++ val)


{-| Configuration for [`transition`](#transition).
-}
type alias TransitionConfig =
    { property : Value Animatable
    , timingFunction : Value EasingFunction
    , duration : Value Time
    , delay : Value Time
    , behavior :
        Value
            { normal : Supported
            , allowDiscrete : Supported
            }
    }


{-| Default [`transition`](#transition) configuration.

It is equivalent to the following CSS:

    transition: all ease 0s 0s normal;

-}
defaultTransition : TransitionConfig
defaultTransition =
    { property = all_
    , timingFunction = ease
    , duration = s 0
    , delay = s 0
    , behavior = normal
    }


{-| The [`transition`](https://css-tricks.com/almanac/properties/t/transition/) property.

    transition initial

    transition none

For defining transitions look at [`transitionMany`](#transitionMany).

-}
transition :
    BaseValue
        { none : Supported
        }
    -> Style
transition (Value val) =
    appendProperty ("transition:" ++ val)


{-| Sets [`transition`](https://css-tricks.com/almanac/properties/t/transition/).

If you give an empty list, the value will be `none`. This is to make it impossible for it
to have no values in the output.

    transitionMany [] -- "transition: none"

    -- "transition: margin-right ease-out 4s 2s allow-discrete"
    button
        [ css
            [ transitionMany
                [ { defaultTransition
                    | property = marginRight_
                    , easingFunction = easeOut
                    , duration = s 4
                    , delay = s 2
                    , behavior = allowDiscrete
                  }
                ]
            ]
        ]
        [ text "Zap!" ]

-}
transitionMany : List TransitionConfig -> Style
transitionMany configs =
    let
        value =
            case configs of
                [] ->
                    "none"

                _ ->
                    configs
                        |> List.map transitionConfigToString
                        |> String.join ", "
    in
    appendProperty ("transition:" ++ value)


transitionConfigToString : TransitionConfig -> String
transitionConfigToString config =
    let
        (Value property_) =
            config.property

        (Value timingFunction) =
            config.timingFunction

        (Value duration) =
            config.duration

        (Value delay) =
            config.delay

        (Value behavior) =
            config.behavior
    in
    property_ ++ " " ++ timingFunction ++ " " ++ duration ++ " " ++ delay ++ " " ++ behavior


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------ WEBKIT STUFF THAT'S STANDARDISED --------------------
-------------------------- FOR LEGACY SUPPORT --------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Sets [`lineClamp`](https://css-tricks.com/almanac/properties/l/line-clamp/)

    lineClamp none

    lineClamp zero

    lineClamp (int 3)

-}
lineClamp :
    BaseValue
        { none : Supported
        , zero : Supported
        , int : Supported
        }
    -> Style
lineClamp (Value val) =
    appendProperty ("line-clamp:" ++ val)

