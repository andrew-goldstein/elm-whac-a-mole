module Model where

import Signal exposing (mailbox, Mailbox)

type alias Wackable = Bool
type alias Mole     = { wackable : Wackable }

type alias Score = Int

moleInAHole : Mole
moleInAHole = { wackable = False }

type Hole = UL | UM | UR
             | LL | LR


type alias Game =
  { moles : List (Hole, Mole)
  , score : Score }

initialGame : Game
initialGame =
  { moles = [ (UL, moleInAHole)
            , (UM, moleInAHole)
            , (UR, moleInAHole)
            , (LL, moleInAHole)
            , (LR, moleInAHole) ]
  , score = 0 }

messages : Mailbox (Maybe Hole)
messages = mailbox Nothing
