module Main where

import Signal
import Model  exposing (..)
import View   exposing (..)
import Html   exposing (..)
import Update exposing (..)
import Debug

main : Signal.Signal Html
main = Signal.foldp update { wackable = False } messages.signal
  |> Signal.map (Debug.watch "Mole")
  |> Signal.map renderMole
