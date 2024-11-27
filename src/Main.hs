module Main where

import Types
import Markdown


main :: IO()
main = do
    let x = toEntityLabel "entity_foo"
    let y = fromEntityLabel x
    putStrLn y
