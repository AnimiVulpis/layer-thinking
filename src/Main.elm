module Main exposing (main)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main =
    Html.beginnerProgram { model = Nothing, view = view, update = update }


update msg model =
    Nothing


view model =
    div []
        [ text "Hallo" ]
