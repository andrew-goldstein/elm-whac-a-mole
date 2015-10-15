module Main where

import Signal
import Model  exposing (..)
import View   exposing (..)
import Html   exposing (..)
import Update exposing (..)

main : Signal.Signal Html
main = Signal.map renderMole <| Signal.foldp update { wackable = False } messages.signal
