module Box.Box exposing (Box, Drag)

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (style)
import Mouse exposing (Position)


type alias Box =
    { position : Position
    , text : String
    , drag : Maybe Drag
    }


type alias Drag =
    { start : Position
    , current : Position
    }
