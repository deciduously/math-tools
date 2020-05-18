module Test.Main where

import Prelude (Unit, discard, eq, negate, (/), (==), (<=))
import Data.Foldable (sum, product)
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
  log "The sum of the zeros is -b/a"
  quickCheck \a b c ->
    let
      polynomial = make_quadratic a b c
    in
      if polynomial.quadratic == 0.0 then
        true
      else
        eq (sum (quadratic_formula polynomial)) ((negate polynomial.linear) / polynomial.quadratic)
  log "The product of the zeros is c/a"
  quickCheck \a b c ->
    let
      polynomial = make_quadratic a b c
    in
      if polynomial.quadratic == 0.0 then
        true
      else
        eq (product (quadratic_formula polynomial)) (polynomial.constant / polynomial.quadratic)
