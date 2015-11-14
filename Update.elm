module Update where

import Time
import List
import Random as R
import List.Extra exposing (zip)
import Signal exposing (..)
import Model exposing (..)

interval : Signal Time.Time
interval = Time.every <| Time.second * 3

rand : Signal (List (Hole, Mole))
rand = let

    iToM i =
      if i == 0 then moleInAHole else Mole True

    f currentTime (_, seed) = let
       seed' = if currentTime == 0
               then R.initialSeed currentTime
               else seed

       gen = R.int 0 1

       (ul, s')     = gen `R.generate` seed'
       (um, s'')    = gen `R.generate` s'
       (ur, s''')   = gen `R.generate` s''
       (ll, s'''')  = gen `R.generate` s'''
       (lr, s''''') = gen `R.generate` s''''

       in (zip (List.map iToM [ul, um, ur, ll, lr]) [UL, UM, UR, LL, LR], s''''')

  in List.map (\(a,b) -> (b,a)) <~ (fst <~ foldp f ([], R.initialSeed 0) interval)



update : Input -> Game -> Game
update input g = let

  whack : Mole -> Score
  whack m = if m.wackable then 400 else 0

  whacked h = List.foldl (\(hole, mole) g' ->
      if h == hole
      then { g' | score <- g'.score + whack mole
                , moles <- (hole, moleInAHole) :: g'.moles }
      else { g' | moles <- (hole, mole)        :: g'.moles }
    ) { score = g.score, moles = [] } g.moles

  in case input of
    Wack h -> whacked h
    Random hms -> { g | moles <- hms }
    EmptyInput -> g
