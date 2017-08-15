module Styles exposing (CssClasses(..), class, styleTag)

import Css exposing (color, compile, hex, padding, stylesheet)
import Css.Elements exposing (p)
import Css.Namespace exposing (namespace)
import Html as H
import Html.CssHelpers


{-| Construct a style tag
-}
toStyleTag : Css.Stylesheet -> H.Html msg
toStyleTag sheet =
    let
        { css } =
            compile [ sheet ]
    in
        H.node "style" [] [ H.text css ]


{-| Classes and styles
-}
type CssClasses
    = Greeting


testNamespace =
    "test"


{ class } =
    Html.CssHelpers.withNamespace testNamespace


{-| The actual styles
-}
css : Css.Stylesheet
css =
    (stylesheet << namespace testNamespace)
        [ p [ color <| hex "#ff0000" ]
        , Css.class Greeting
            [ padding <| Css.rem 1 ]
        ]


styleTag : H.Html msg
styleTag =
    toStyleTag css
