module View where

import Model           exposing (..)
import Html            exposing (..)
import Html.Attributes exposing (..)

renderMole : Mole -> Html
renderMole mole = if mole.wackable
  then img [src "http://www.fcps.edu/islandcreekes/ecology/Mammals/Eastern%20Mole/eastern1.jpg"] []
  else img [src "http://cloud.graphicleftovers.com/20677/464110/mole-hole-in-brown-dirt-closeup.-shallow-dof.jpg"] []
