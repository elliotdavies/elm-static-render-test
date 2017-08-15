module Main exposing (..)

import Html exposing (..)
import Json.Decode as J
import List
import Styles exposing (CssClasses(..), class, styleTag)


type alias Model =
    { name : String
    , greeting : String
    , repeat : Int
    }


{-| Decode data coming in from JS
-}
decodeModel : J.Decoder Model
decodeModel =
    J.map3 Model
        (J.field "name" J.string)
        (J.field "greeting" J.string)
        (J.field "repeat" J.int)


{-| Layout
-}
view : Model -> Html msg
view model =
    let
        greeting =
            List.repeat model.repeat model.greeting
                |> List.intersperse ", "
                |> String.concat
                |> flip String.append " "
    in
        node "html"
            []
            [ node "head" [] [ styleTag ]
            , body []
                [ p [ class [ Greeting ] ]
                    [ text <| greeting ++ model.name ]
                ]
            ]
