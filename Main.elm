module Main where

import Signal
import Model  exposing (..)
import View   exposing (..)
import Html   exposing (..)
import Update exposing (..)
import Debug



main : Signal.Signal Html
main =
  Signal.foldp update initialGame (Signal.merge messages.signal (Signal.map Random rand))
  |> Signal.map (Debug.watch "Game")
  |> Signal.map view
