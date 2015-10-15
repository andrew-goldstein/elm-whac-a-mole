module Main where

import Signal
import Model exposing (..)
import View  exposing (..)
import Html  exposing (..)

main : Signal.Signal Html
main = Signal.map renderMole messages.signal
