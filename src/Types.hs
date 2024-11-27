module Types where

import Data.List

newtype EntityLabel = ConstructEntityLabel String
newtype Html = MakeHtml String
newtype Structure = MakeStructure String

testNewEntity :: String -> EntityLabel
testNewEntity (identifier) = ConstructEntityLabel(identifier)

toEntityLabel :: String -> EntityLabel
toEntityLabel identifier | isPrefixOf "entity" identifier = ConstructEntityLabel identifier
                         | otherwise = error "Cannot construct identifier without entity prefix"

fromEntityLabel :: EntityLabel -> String
fromEntityLabel (ConstructEntityLabel label) = label

extractStructureString :: Structure -> (String)
extractStructureString = \(MakeStructure str) -> str

printStructure :: Structure -> String
printStructure (MakeStructure a) = a

extractHtmlString :: Html -> (String)
extractHtmlString = \(MakeHtml str) -> str

append_ :: Structure -> Structure -> Structure
append_ (MakeStructure a) (MakeStructure b) = MakeStructure (a <> b)
