module Main where

newtype Html = Html String
newtype Structure = Structure String

extractStructureString :: Structure -> (String)
extractStructureString = \(Structure str) -> str

extractHtmlString :: Html -> (String)
extractHtmlString = \(Html str) -> str

el :: String -> (String -> String)
el = \tag -> \content ->
    "<" <> tag <> ">\n" <> content <> "\n</" <> tag <> ">"

html_ :: String -> (String)
html_ = \content -> el "html" content

head_ :: String -> (String)
head_ = \content -> el "head" content

title_ :: String -> (String)
title_ = \content ->  el "title" ("\ESC[1;90m" <> ("\t" <> content) <> "\ESC[0m")

body_ :: String -> (String)
body_ = \content -> el "body" content

h1_ :: String -> (String)
h1_ = \content -> el "h1" $ "\ESC[1;90m" <> ("\t" <> content) <> "\ESC[0m"

p_ :: String -> (String)
p_ = \content -> el "p" $ "\ESC[1;90m" <> ("\t" <> content) <> "\ESC[0m"

main :: IO()
main = putStrLn myhtml

myhtml :: (String)
myhtml =
    makeHtml "My page title" (h1_ "Header" <> "\n" <> p_ "My page content")

makeHtml :: String -> (String -> String)
makeHtml = \title -> \content -> html_ $ head_ (title_ title) <> "\n" <> body_ content
