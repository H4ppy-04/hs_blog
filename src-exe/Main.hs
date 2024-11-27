module Main where

main :: IO()
main = putStrLn someHtmlCode

wrapHtml :: String -> String
wrapHtml content = "<html><body>" <> content <> "</body></html>"

someHtmlCode :: String
someHtmlCode = wrapHtml "foo"
