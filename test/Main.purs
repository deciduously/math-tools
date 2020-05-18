module Test.Main where

import Prelude (Unit, discard, eq, (<=))
import Data.List.Lazy (length, nil)
import Effect (Effect)
import Effect.Class.Console (log)
import Test.QuickCheck (quickCheck)
import Main

main :: Effect Unit
main = do
  log "Non-quadratic returns empty list"
  quickCheck \(a :: Number) b c ->
    eq (quadratic_formula (make_quadratic 0.0 b c)) nil
  log "Quadratic never returns more than two intercepts"
  quickCheck \a b c ->
    length (quadratic_formula (make_quadratic a b c)) <= 2
