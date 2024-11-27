module Main where

--import Text.Colour.Code

el :: String -> String -> String -> String
el color tag content =
    color <> "<" <> tag <> ">" <> "\ESC[0m" <> content <> color <> "</" <> tag <> ">" <> "\ESC[0m"

html_ :: String -> String
html_ content = el "\ESC[95m" "html" (content <> "\n")

head_ :: String -> String
head_ content = el "\n\ESC[33m" "head" ("\n" <> content)

title_ :: String -> String
title_ content = el "\ESC[94m" "title" (content)

body_ :: String -> String
body_ content = "\n\ESC[96m<body>\ESC[0m\n\t" <> content <> "\n\ESC[96m</body>\ESC[0m"

makeHtml :: String -> String -> String
makeHtml title body = html_ (head_ (title_ title) <> body_ body)

myhtml :: String
myhtml = makeHtml "My page title" "My page content"

main :: IO()
main = putStrLn myhtml
