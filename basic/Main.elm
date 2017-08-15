module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)


css : Html msg
css =
    node "style" [] [ text ".hello { color: red; }" ]


view : Html msg
view =
    node "html"
        []
        [ node "head" [] [ css ]
        , body []
            [ div []
                [ h1 [ class "hello" ] [ text "Heading here" ]
                , p [] [ text "And some copy" ]
                ]
            ]
        ]
