module View where

import Model           exposing (..)
import Html            exposing (..)
import Html.Attributes exposing (..)
import Html.Events     exposing (..)
import List
import Css.Transform2  exposing (..)
import Css.Position    exposing (..)

view : Game -> Html
view {moles, score} = div [] <|
  h1 [] [ text <| "Score: " ++ toString score ] :: renderMoles moles


grid : Int
grid = 300

scaleGrid : Float -> Int
scaleGrid x = round <| toFloat grid * x

renderMole : Hole -> Mole -> Html
renderMole hole mole = let
   wackableUrl   = "http://www.fcps.edu/islandcreekes/ecology/Mammals/Eastern%20Mole/eastern1.jpg"
   unWackableUrl = "http://cloud.graphicleftovers.com/20677/464110/mole-hole-in-brown-dirt-closeup.-shallow-dof.jpg"
   moleSize      = round <| toFloat grid / 1.618
   img' url      = img[ src url, onClick messages.address (Wack hole), width moleSize, height moleSize ] []

   in img' <|
     if mole.wackable
     then wackableUrl
     else unWackableUrl


styleHole : Hole -> Attribute
styleHole h =
  (\(x, y) -> style << position Absolute <| transform2 [translate2 x y] [])
  <| case h of
    UL -> (0,             0)
    UM -> (grid,          0)
    UR -> (grid * 2,      0)
    LL -> (scaleGrid 0.5, grid)
    LR -> (scaleGrid 1.5, grid)


renderMoles : List (Hole, Mole) -> List Html
renderMoles hms = List.map (\(h, m) -> Html.div [styleHole h] [renderMole h m]) hms
