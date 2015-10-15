module Update where

import Model exposing (..)

update : () -> Mole -> Mole
update _ m = { m | wackable <- not m.wackable }
