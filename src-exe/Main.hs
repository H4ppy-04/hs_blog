module Main where

--import Text.Colour.Code

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">\n" <> content <> "\n</" <> tag <> ">"

html_ :: String -> String
html_ content = el "html" content

head_ :: String -> String
head_ content = el "head" content

title_ :: String -> String
title_ content = el "title" ("\ESC[1;90m" <> ("\t" <> content) <> "\ESC[0m")

body_ :: String -> String
body_ content = el "body" content

h1_ :: String -> String
h1_ content = el "h1" content

p_ :: String -> String
p_ content = el "p" ("\ESC[1;90m" <> ("\t" <> content) <> "\ESC[0m")

makeHtml :: String -> String -> String
makeHtml title paragraph = html_ (head_ (title_ title) <> "\n" <> body_ (p_ paragraph))

myhtml :: String
myhtml = makeHtml "My page title" "My page content"

main :: IO()
main = putStrLn myhtml
