module Update where

import Model exposing (..)

update : Hole -> Game -> Game
update h g = let
  negateMole : Mole -> Mole
  negateMole m = { m | wackable <- not m.wackable }

  moles' : List (Hole, Mole)
  moles' = List.map (\(hole, mole) ->
      if h == hole
      then (hole, negateMole mole)
      else (hole, mole)
    ) g.moles

  in { g | moles <- moles' }
