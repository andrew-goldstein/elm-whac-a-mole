module Update where

import Model exposing (..)

update : Hole -> Game -> Game
update h g = let

  negateMole : Mole -> Mole
  negateMole m = { m | wackable <- not m.wackable }

  whack : Mole -> Score
  whack m = if m.wackable then 400 else 0

  in List.foldl (\(hole, mole) g' ->
      if h == hole
      then { g' | score <- g'.score + whack mole
                , moles <- (hole, negateMole mole) :: g'.moles }
      else { g' | moles <- (hole,            mole) :: g'.moles }
    ) { score = g.score, moles = [] } g.moles
