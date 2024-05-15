module Main where

import Strings.StringJO

-- English
refkeys = ["200537","386","381","493","411","63","532","46","110","102","404","567","172",
           "166","164","161","157","385","154","142","139","138","135","132","122","117","396",
           "106","105","389","100","99","401","95","83","82","57","55","47","43","35","31",
           "22","21","20","19","382","159","397","458","410","399","383","380","413","390",
           "415","414","379","407","687","685","675","670","668","681","182","183","103",
           "62","12","91","151","36","148","87","58","1","177","96","377","402","184","394","0"]

{--
Dutch
refkeys = ["532", "200537","386","404","381","493","411","63","46","110","102","172","166",
           "164","161","157","385","154","142","139","138","135","132","122","117","396","106",
           "105","389","100","99","401","95","83","82","57","55","47","43","35","31","22",
           "21","20","19","397","382","383","159","394","399","379","410","402","380","413",
           "390","407","414","415","687","685","675","670","668","681","182","183","103",
           "62","12","91","151","36","148","87","58","1","177","96","377\n","402","394","184","0"]
--}

main :: IO ()
main = do
         let infp = "d:/jodijk/rosettaarchive/lexzip/ENGLISH/bskeydef.kdf"
         let outfp= "d:/jodijk/rosettaarchive/lexzip/ENGLISH/reducedbskeydef.kdf"
         str <- readFile infp
         let inlines = lines str
         let fields = map (split ",") inlines
         let selected = filter (\x-> (x?1) `elem` refkeys) fields
         let stringlist = map ((flip paste) ",") selected
         writeFile outfp ""
         listWriteFile outfp stringlist
         
listWriteFile :: FilePath -> [String] -> IO()
listWriteFile fp [] = return ()
listWriteFile fp (x:xs) = do
                appendFile fp x
                appendFile fp "\n"
                listWriteFile fp xs
