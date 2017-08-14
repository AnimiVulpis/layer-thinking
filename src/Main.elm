module Main exposing (main)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import Box.Box exposing (Box)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { boxes : List Box
    }


model : { boxes : List Box }
model =
    { boxes = []
    }


type Msg
    = CreateBox


update : Msg -> Model -> Model
update msg model =
    case msg of
        CreateBox ->
            { model | boxes = List.append model.boxes [ Box 180 90 "Test" ] }


view : a -> Html Msg
view model =
    div []
        [ button [ onClick CreateBox ]
            [ text "new Box" ]
        , div
            [ style
                [ ( "backgroundColor", "cyan" )
                , ( "height", "90px" )
                , ( "width", "180px" )
                , ( "border", "1px solid blue" )
                ]
            ]
            [ text "Hallo" ]
        ]
