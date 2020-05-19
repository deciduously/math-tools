module Main where

import Prelude (Unit, negate, show, ($), (*), (+), (-), (/), (<>), (==))
import Data.List.Lazy (List, head, length, nil, (:), (!!))
import Data.Maybe (Maybe, fromMaybe)
import Effect (Effect)
import Effect.Console (log)
import Math (pow, sqrt)

type QuadraticPolynomial
  = { quadratic :: Number, linear :: Number, constant :: Number }

make_quadratic :: Number -> Number -> Number -> QuadraticPolynomial
make_quadratic a b c = { quadratic: a, linear: b, constant: c }

{- Solve for the y-intercepts of a quadratic polynomial via the quadratic formula -}
quadratic_formula :: QuadraticPolynomial -> List Number
quadratic_formula exp =
  if exp.quadratic == 0.0 then
    nil
  else
    if discriminant == 0.0 then
      root (+) : nil
    else
      root (+) : root (-) : nil
  where
  discriminant = (pow 2.0 exp.linear) - 4.0 * exp.quadratic * exp.constant

  root sign = sign (negate exp.linear) (sqrt discriminant) / (2.0 * exp.quadratic)

showQuadratic :: Number -> Number -> Number -> String
showQuadratic a b c =
  let
    polynomial = make_quadratic a b c

    result = quadratic_formula polynomial

    base = "Intercepts: "
  in
    case length result of
      0 -> base <> "No intercepts"
      1 -> base <> (show (extractMaybe (head result)))
      2 -> base <> (show (extractMaybe (head result))) <> ", " <> show (extractMaybe (result !! 1))
      _ -> "More than two interceps returned - something has gone awry"
  where
  extractMaybe :: Maybe Number -> Number
  extractMaybe m = fromMaybe (negate 1.0) m

main :: Effect Unit
main = do
  {- should be 1.0 and -3.0 -}
  log $ showQuadratic 2.0 4.0 (negate 6.0)
