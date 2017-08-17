module Position.Position exposing (BoxPosition)


type alias BoxPosition =
    { x : Int
    , y : Int
    , layer : Int
    }


move : BoxPosition -> Int -> Int -> BoxPosition
move pos x y =
    BoxPosition x y pos.layer
