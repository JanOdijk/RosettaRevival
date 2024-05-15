module Main where

import qualified Data.Map as DM
import Strings.StringJO

type Field = String
type Record = [Field]
type RecordSet = [Record]

sep = "\t"

incr :: Ord k => DM.Map k Int -> k -> DM.Map k Int
incr mp k = if k `DM.member` mp
            then DM.adjust (+1)  k mp
            else DM.insert k 1 mp 


main :: IO ()
main = do
       arglist <- getArgs
       let args = arg2avlist arglist
       str <- getContents
       let inlines = lines str
       let relvals = map getVals inlines
       let (f1vals,f2vals,f3vals) = unzip3 relvals
       let mp1 = foldl incr DM.empty f1vals
       let mp2 = foldl incr DM.empty f2vals
       let mp3 = foldl incr DM.empty f3vals
       putStrLn "\nField 41:"
       mpprint mp1
       putStrLn "\nField 42:"
       mpprint mp2
       putStrLn "\nField 43:"
       mpprint mp3
       
       
getVals :: String -> (String,String, String)
getVals str = ([str!!40],[str!!41],[str!!42])


mpprint :: (Ord k, Show k, Show v) => DM.Map k v -> IO ()
mpprint mp = niceprint (DM.toList mp)

niceprint :: (Show a, Show b) => [(a,b)] -> IO()
niceprint [] = return()
niceprint ((k,v):kvs) = do
                putStr (show k)
                putStr sep
                putStr (show v)
                putStr "\n"
                niceprint kvs

getFields :: [Int] -> String -> [Field]
getFields [] "" = []
getFields [] str = error ("Incorrect Field by Position definition: " ++ str ++ " remaining")
getFields (_:[]) str  = [str]
getFields (i:j:is) str = (fij:isflds) where
                       (fij, rest) = splitAt (j-i) str  
                       isflds = getFields (j:is) rest
 

arg2avlist :: [String] -> [AVPair]
arg2avlist = map str2av

str2av :: String -> AVPair
str2av str = (att, val) where
            attval = split "=" str
            (att, val) = case attval of
                          [x,y] -> (x,y)
                          [x]   -> (x,"")
                          []    -> error "Empty av pair"  
