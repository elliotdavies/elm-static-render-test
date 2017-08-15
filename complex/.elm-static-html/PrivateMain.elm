
port module PrivateMain exposing (..)

import Platform
import Html exposing (Html)
import ElmHtml.InternalTypes exposing (decodeElmHtml)
import ElmHtml.ToString exposing (nodeToStringWithOptions, defaultFormatOptions)
import Json.Decode as Json
import Native.Jsonify

import Main
import Main


asJsonString : Html msg -> String
asJsonString = Native.Jsonify.stringify

options = { defaultFormatOptions | newLines = True, indent = 4 }

decode : Html msg -> String
decode view =
    case Json.decodeString decodeElmHtml (asJsonString view) of
        Err str -> "ERROR:" ++ str
        Ok str -> nodeToStringWithOptions options str

init : Json.Value -> ((), Cmd msg)
init values =
    case Json.decodeValue Main.decodeModel values of
        Err err -> ((), htmlOut ("ERROR:" ++ err))
        Ok model ->
            ((), htmlOut <| decode <| Main.view model)


main = Platform.programWithFlags
    { init = init
    , update = (\_ b -> (b, Cmd.none))
    , subscriptions = (\_ -> Sub.none)
    }

port htmlOut : String -> Cmd msg
