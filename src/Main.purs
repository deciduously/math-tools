module Main where

import Prelude (Unit, negate, show, ($), (*), (+), (-), (/), (==))
import Data.List.Lazy (List, nil, (:))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Math (pow, sqrt)

type QuadraticPolynomial
  = { quadratic :: Number, linear :: Number, constant :: Number }

make_quadratic :: Number -> Number -> Number -> QuadraticPolynomial
make_quadratic a b c = { quadratic: a, linear: b, constant: c }

quadratic_formula :: QuadraticPolynomial -> List Number
quadratic_formula exp =
  if exp.quadratic == 0.0 then
    nil
  else
    if rad == 0.0 then
      root (+) : nil
    else
      root (+) : root (-) : nil
  where
  rad = (pow 2.0 exp.linear) - 4.0 * exp.quadratic * exp.constant

  root sign = (sign (negate exp.linear) (sqrt rad) / (2.0 * exp.quadratic))

main :: Effect Unit
main = do
  log $ show (quadratic_formula (make_quadratic 1.0 7.0 10.0)) {- should be -2.0 and -5.0 -}
