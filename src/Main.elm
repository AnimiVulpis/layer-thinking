module Main exposing (main)

import Box.Box exposing (Box, Drag)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, onClick)
import Json.Decode as Decode
import Mouse exposing (Position)


-- import Position.Position exposing (BoxPosition)


main : Program Never Model BoxMsg
main =
    Html.beginnerProgram { model = model, view = view, update = update }


type BoxMsg
    = CreateBox
    | DragStart Position
    | DragAt Position
    | DragEnd Position


type alias Model =
    { boxes : List Box
    }


model : { boxes : List Box }
model =
    { boxes = []
    }


updateHelp : BoxMsg -> Model -> Model
updateHelp msg model =
    case msg of
        _ ->
            model



-- subscriptions : Box -> Sub BoxMsg
-- subscriptions box =
--     case box of
--         Nothing ->
--             Sub.none
--         Just _ ->
--             Sub.batch [ Mouse.moves DragAt, Mouse.ups DragEnd ]


update : BoxMsg -> Model -> Model
update msg model =
    case msg of
        CreateBox ->
            { model | boxes = List.append model.boxes [ Box (Position 500 500) "Test" ] }

        _ ->
            updateHelp msg model


view : Model -> Html BoxMsg
view model =
    div []
        (button [ onClick CreateBox ] [ text "new Box" ]
            :: List.map createBoxItem model.boxes
        )


createBoxItem : Box -> Html BoxMsg
createBoxItem box =
    div
        [ onMouseDown box
        , style
            [ ( "backgroundColor", "cyan" )
            , ( "height", "90px" )
            , ( "width", "180px" )
            , ( "border", "1px solid blue" )
            , ( "position", "absolute" )
            , ( "top", px box.position.y )
            , ( "left", px box.position.x )
            ]
        ]
        [ text box.text ]


px : Int -> String
px number =
    toString number ++ "px"


getPosition : Model -> Position
getPosition { position, drag } =
    case drag of
        Nothing ->
            position

        Just { start, current } ->
            Position
                (position.x + current.x - start.x)
                (position.y + current.y - start.y)


onMouseDown : Box -> Attribute BoxMsg
onMouseDown box =
    on "mousedown" (Decode.map DragStart Mouse.position box)
