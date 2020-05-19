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

  root sign = sign (-exp.linear) (sqrt discriminant) / (2.0 * exp.quadratic)

showQuadratic :: Number -> Number -> Number -> String
showQuadratic a b c =
  let
    result = quadratic_formula $ make_quadratic a b c

    base = "Intercepts: "
  in
    case length result of
      0 -> base <> "No intercepts"
      1 -> base <> (show (extractMaybe (head result)))
      2 -> base <> (show (extractMaybe (head result))) <> ", " <> show (extractMaybe (result !! 1))
      _ -> "More than two intercepts returned - something has gone awry"
  where
  extractMaybe :: Maybe Number -> Number
  {- The -1 sentinel value is terrible, but it will never happen.  We already determined that it WILL be a Just. -}
  extractMaybe = fromMaybe (negate 1.0)

main :: Effect Unit
main = do
  {- should be 1.0 and -3.0 -}
  log $ showQuadratic 1.0 6.0 (-40.0)
