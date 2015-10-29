module View where

import Model           exposing (..)
import Html            exposing (..)
import Html.Attributes exposing (..)
import Html.Events     exposing (..)
import List
import Css.Transform2  exposing (..)
import Css.Position    exposing (..)

view : Game -> Html
view {moles} = div [] <| renderMoles moles


renderMole : Hole -> Mole -> Html
renderMole hole mole = let
   wackableUrl   = "http://www.fcps.edu/islandcreekes/ecology/Mammals/Eastern%20Mole/eastern1.jpg"
   unWackableUrl = "http://cloud.graphicleftovers.com/20677/464110/mole-hole-in-brown-dirt-closeup.-shallow-dof.jpg"
   img' url      = img[ src url, onClick messages.address (Just hole) ] []

   in img' <|
     if mole.wackable
     then wackableUrl
     else unWackableUrl

styleHole : Hole -> Attribute
styleHole h =
  (\(x, y) -> style << position Absolute <| transform2 [translate2 x y] [])
  <| case h of
    UL -> (0, 0)
    UM -> (0, 100)
    UR -> (0, 200)
    LL -> (50, 0)
    LR -> (50, 100)
    _ -> (0,0)


renderMoles : List (Hole, Mole) -> List Html
renderMoles hms = List.map (\(h, m) -> Html.div [styleHole h] [renderMole h m]) hms
