module View where

import Model           exposing (..)
import Html            exposing (..)
import Html.Attributes exposing (..)
import Html.Events     exposing (..)
import Signal          exposing (..)

renderMole : Mole -> Html
renderMole mole = let
   wackableUrl   = "http://www.fcps.edu/islandcreekes/ecology/Mammals/Eastern%20Mole/eastern1.jpg"
   unWackableUrl = "http://cloud.graphicleftovers.com/20677/464110/mole-hole-in-brown-dirt-closeup.-shallow-dof.jpg"
   img' url      = img[ src url, onClick messages.address () ] []

   in img' <|
     if mole.wackable
     then wackableUrl
     else unWackableUrl
