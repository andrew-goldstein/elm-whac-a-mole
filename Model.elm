module Model where

import Signal exposing (mailbox, Mailbox)

type alias Wackable = Bool
type alias Mole = { wackable : Wackable }

moleInAHole : Mole
moleInAHole = { wackable = False }

messages : Mailbox ()
messages = mailbox ()
