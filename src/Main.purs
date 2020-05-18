module Main where

import Prelude
import Data.List
import Data.Maybe
import Effect (Effect)
import Effect.Console (log)
import Math (pow)

{- For now, just Number -}
quads :: Number -> Number -> Number -> Maybe (List Number)
quads a b c = 
  let 
    under_radical = (pow b 2.0) - (4.0 * a * c)
  in
    if under_radical < 0.0 then
      Nothing
    else
      Just (((negate b) + under_radical) / (2.0 * a) : ((negate b) - under_radical) / (2.0 * a) : Nil)

main :: Effect Unit
main = do
  log $ show (quads 2.0 4.0 0.0)
