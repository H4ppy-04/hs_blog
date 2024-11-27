module Main where

--import Text.Colour.Code

html_ :: String -> String
html_ content = "\n\ESC[95m<html>\ESC[0m\n" <> content <> "\n\ESC[95m</html>\ESC[0m\n"

head_ :: String -> String
head_ content = "\n\ESC[33m<head>\ESC[0m" <> content <> "\ESC[33m</head>\ESC[0m\n"

title_ :: String -> String
title_ content = "\n\ESC[94m<title>\ESC[0m" <> content <> "\ESC[94m</title>\ESC[0m\n"

body_ :: String -> String
body_ content = "\n\ESC[96m<body>\ESC[0m\n\t" <> content <> "\n\ESC[96m</body>\ESC[0m\n"

makeHtml :: String -> String -> String
makeHtml title body = html_ (head_ (title_ title) <> body_ body)

myhtml :: String
myhtml = makeHtml "My page title" "My page content"

main :: IO()
main = putStrLn myhtml
