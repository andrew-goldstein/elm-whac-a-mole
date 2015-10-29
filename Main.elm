module Main where

import Signal
import Model  exposing (..)
import View   exposing (..)
import Html   exposing (..)
import Update exposing (..)
import Debug



main : Signal.Signal Html
main =
  Signal.filterMap identity UM messages.signal
  |> Signal.foldp update initialGame
  |> Signal.map (Debug.watch "Game")
  |> Signal.map view
