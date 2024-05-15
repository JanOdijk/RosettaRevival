module Main where

import Text.ParserCombinators.Parsec
import Strings.StringJO
import Data.List
import qualified Data.Map as DM 
import Maybe
import System
import Data.Char

sourcepath = "d:/jodijk/rosettaarchive/lexzip/"
targetpath = "./"
langset = ["DUTCH","ENGLISH","SPANISH"]
errorfile = "errors.txt"
keyatts = ["{prepkey1:}", "{prepkey2:}", "{prepkey:}", "{particle:}", "{correlative2key:}", "{postpkey:}", "{secondprep:}" ]
                  
type KeyMap = DM.Map Int String                                               


type BLexEntry = (String, String, [(String,String)])
-- skey syntcat record

type BLexMap = DM.Map Key BLexEntry            


type Dict = ([MDictEntry],[SDictEntry],[MDictEntry],[SIdDictEntry],[IdDictEntry],IlDictMap,
             BLexMap,SCommentEntryMap,MCommentEntryMap)
             
type IdDictEntry = (Key, Int, [Key], Key, String)
-- headkey #components components idkey idpatterns

type IlDictEntry = (String, String, Int, Int, String, Char, Char)
-- skey mkey skeypref  mkeypref, meaningdescription, Char, Char)

type IlDictMap = DM.Map Key [IlDictEntry] 

             
type Key = String
type Language = String

type MCommentEntry = (Key,Key, String)
-- skey mkey comment

type  MCommentEntryMap = DM.Map (Key, Key) [String]                

type MDictEntry = (String, Char, Char, Char, String)
-- wordstr fon1 fon2 agswitch skey

type SCommentEntry = (Key, String)
-- skey comment

type  SCommentEntryMap = DM.Map Key [SCommentEntry]                

type SDictEntry = (String, String, [String])
-- fkey skey contextkeys

--semi-idioms                               
type SIdDictEntry = (String, String, Int, String)
-- headskey  complementskey  argnr idskey 

             

el12 (a,b) = a
el13 (a,b,c) = a
el14 (a,b,c,d) = a
el15 (a,b,c,d,e) = a
el17 (a,b,c,d,e,f,g)= a
el23 (a,b,c) = b
el33 (a,b,c) = c
el55 (a,b,c,d,e) = e

reportevery = 20

main :: IO ()
main = do
    rl <- getArgs
    rl1 <- case rl of
      []     -> return ""
      (x:[]) -> return x
      (x:_)  -> do putStrLn "Too many Program Arguments. Arg 2 and further ignored"
                   return x
    lang <- getLang rl1
    mdict    <- readMDict lang
    sdict    <- readSDict lang
    siddict  <- readSIdDict lang
    iddict   <- readIdDict lang
    ildict   <- readIlDict lang
    km       <- readKM lang
    blex1     <- readBLex lang
    let blex = replaceKeys km blex1
    scomment <- readSComment lang
    mcomment <- readMComment lang
    let dict = (mdict,sdict,mdict,siddict,iddict,ildict,blex,scomment,mcomment)
    initializeFiles targetpath lang
    putStrLn "Starting MakeEntry..."
    makeEntry 1 lang dict
    return ()  

initializeFiles :: FilePath -> Language -> IO()
initializeFiles fp lang = do
    let templ = fp ++ lang ++ "/"
    let fullfiles = map (templ++) thefiles
    mapM_ initFile fullfiles
 
initFile fp = writeFile fp ""    

thefiles = ["bnoun.dict", "bverb.dict", "badj.dict", "badv.dict", "prep.dict", "particle.dict", "pronoun.dict",
             "conj.dict", "misc.dict", "errors.txt"]
    
getLang :: String -> IO String
getLang str = do
            rawlang <- if (str == "")
                          then do putStr "Specify language (DUTCH, ENGLISH, or SPANISH):"
                                  rl <- getLine
                                  return rl
                          else return str
            let cleanlang = cleanLang rawlang
            if cleanlang `elem` langset
                then do let lang = cleanlang
                        return lang
                else do getLang ""         

cleanLang str = lang where
          upstr = map toUpper str
          lang = case upstr of
           "D" -> "DUTCH"
           "E" -> "ENGLISH"
           "S" -> "SPANISH"
           _   -> upstr
      
{--

run along mdict
make mdictpart
use skey to find sdictentry
make sdictpart
find scomment(s) and add 
use skey to find siddictentries
if found make semiiddictpart
use skey to find iddictentries
if found make iddictpart
use skey to find ildict entries
for each mkey find mcomment and add
if found or not  make ildictpart
use skey to find BLEX entry
make blexpart
end with ;\n\n

and then do the same staring from sdict, and find a mdict entry and the rest

!!comments

--}    

makeEntry :: Int -> Language -> Dict -> IO ()
makeEntry ctr lang ([],[],mdict, siddict,iddict,ildict,blex,scomment,mcomment) = return ()
makeEntry ctr lang ([], (sd:sds), mdict, siddict, iddict,ildict,blex,scomment,mcomment) = do
          let (fkey,skey,ckeys) = sd
        --  putStrLn ("making entry for " ++ fkey)
          let sdictstr = makeSDictStr sd
          let (mdictstr,theskey,mdictentries) = getMDictStr lang mdict fkey
          if mdictstr==""
             then if mdictentries == []
                     then do appendFile errorfile ("No MDICT entry found for " ++ skey)
                     else do appendFile errorfile ("Multiple different MDICT entries found for "++ skey ++ ": " ++ (show mdictentries))
             else return ()
          let commentstr = getSCommentStr scomment skey
          let siddictstr = getSIdDictStr mcomment ildict siddict skey 
          let iddictstr = getIdDictStr  mcomment ildict iddict skey 
          let ildictstr = getIlDictStr mcomment ildict skey
          let (blexstr,cat) = makeBLexStr blex skey 
          let entrystr = makeEntryStr mdictstr sdictstr commentstr siddictstr iddictstr ildictstr blexstr
          let (blexstr,cat) = makeBLexStr blex skey 
          let entrystr = makeEntryStr mdictstr sdictstr commentstr siddictstr iddictstr ildictstr blexstr
          let fp = targetpath ++ lang ++ "/" ++ (getFP cat)
          appendFile fp entrystr  
          if ctr `mod` reportevery ==0 
             then putStr ((show ctr)++"\t")
             else return ()        
          makeEntry (ctr+1) lang ([],sds, mdict, siddict,iddict,ildict,blex,scomment,mcomment)


makeEntry ctr lang ((md:mds),sdict, mdict,siddict,iddict,ildict,blex,scomment,mcomment) = do
          let (str,fon1,fon2,unkn, skey) = md 
          -- putStrLn ("making entry for " ++ str ++":" ++ skey)
          let mdictstr = makeMDictStr lang md 
          let sdictstr = makeSDictStr (skey,skey,[])
          let commentstr = getSCommentStr scomment skey
          let siddictstr = getSIdDictStr mcomment ildict siddict skey 
          let iddictstr = getIdDictStr  mcomment ildict iddict skey 
          let ildictstr = getIlDictStr mcomment ildict skey
          let (blexstr,cat) = makeBLexStr blex skey 
          let entrystr = makeEntryStr mdictstr sdictstr commentstr siddictstr iddictstr ildictstr blexstr
          let fp = targetpath ++ lang ++ "/" ++ (getFP cat)
          appendFile fp entrystr
          if ctr `mod` reportevery ==0 
             then putStr ((show ctr)++"\t")
             else return ()       
          makeEntry (ctr+1) lang (mds,sdict,mdict, siddict,iddict,ildict,blex,scomment,mcomment)

makeEntryStr :: String -> String -> String -> String -> String -> String -> String -> String
makeEntryStr mdictstr sdictstr commentstr siddictstr iddictstr ildictstr blexstr = result where
                 siddictpart = if siddictstr==""
                               then ""
                               else "\n: " ++ siddictstr
                 iddictpart  = if iddictstr==""
                               then ""
                               else "\n: " ++ iddictstr
                 commentpart = if commentstr==""
                               then ""
                               else "\n" ++ commentstr              
                 templ = "%s%s\n: %s%s%s\n: %s\n: %s;\n\n"
                 result = subst' templ [mdictstr,commentpart,sdictstr,siddictpart,iddictpart,ildictstr,blexstr]
                                
        
getFP ::  String -> FilePath
getFP c | c `elem` nouncats = "bnoun.dict"
        | c=="BVERB" = "bverb.dict"
        | c `elem` ["BADV","RADV", "BADVSUFF"]  = "badv.dict"
        | c=="BADJ"  = "badj.dict"
        | c=="PREP"  = "prep.dict"
        | c=="PART" = "particle.dict"
        | c `elem` ["CONJ", "COORD"] = "conj.dict"
        | c `elem` pronouncats = "pronoun.dict"
        | otherwise = "misc.dict"
        
pronouncats = ["BINDEFPRO", "BPERSPRO", "BWHPRO", "DEMPRO", "RELPRO", "RELANTPRO", "REFLPRO", "RECIPRO", "PROSENT",
                "BDET", "Q", "NUM", "DEMADJ", "ART", "INDEFPRO"]    
nouncats = ["BNOUN", "BPROPERNOUN"]    

makeSDictStr :: SDictEntry ->  String
makeSDictStr (fkey, skey , contextkeys)  = result where
                          skeypart = "$" ++ skey
                          fkeypart = if fkey==skey && contextkeys==[]
                                     then ""
                                     else ", $" ++ fkey
                          contextkeystrs = map ("$"++) contextkeys           
                          contextpart = if contextkeys == []
                                        then ""
                                        else "<"++(paste contextkeystrs ",")++">"
                          result = spaceConcat[skeypart,fkeypart,contextpart]                      


getMDictStr :: Language -> [MDictEntry] -> Key -> (String, Key, [MDictEntry])
getMDictStr lang mdict skey  = result where
                     goodentries = filter (\x->el55 x==skey) mdict
                     result = if goodentries==[]
                              then ("", skey, [])
                              else if length goodentries >= 1 && all (==(head goodentries)) goodentries
                              then (makeMDictStr lang (head goodentries),skey, [])
                              else ("",skey, goodentries)
                               
 
makeMDictStr :: Language -> MDictEntry -> String
makeMDictStr lang (str,fon1,fon2,unkn, fkey) = result where                               
                     agswitchval = if unkn == 'B'
                                   then ""
                                   else [unkn]
                     strpart = str
                     fonspec = subst' "<%s,%s>" [getfon lang fon1, getfon lang fon2]           
                     agswitch = if agswitchval == ""
                                then ""
                                else "/" ++ agswitchval
                     ccspec = ""    --unclear where to get this from   --maybe does not exist in Dutch :is part of fon                    
                     result =  spaceConcat [agswitch,strpart,fonspec,ccspec]
                                          
                     
getSIdDictStr :: MCommentEntryMap -> IlDictMap -> [SIdDictEntry] ->  Key -> String
getSIdDictStr mcomment ildict siddict  skey  = result where
                     goodentries = filter (\x->el14 x==skey) siddict
                     resultlist = map (makeSIdDictStr mcomment ildict) goodentries
                     result = paste resultlist ",\n  "

makeSIdDictStr :: MCommentEntryMap -> IlDictMap -> SIdDictEntry ->  String
makeSIdDictStr mcomment ildict (headskey, complementskey, argnr, idskey) = result where
                         templ = "#%s=%s %s"
                         spart = subst' templ [show argnr,complementskey,idskey]
                         mkeyEntries = getIlEntries ildict idskey
                         mkeystrs = map (makeIlDictStr mcomment) mkeyEntries
                         mkeystrlists = [[x] | x<- mkeystrs]
                         templ2 = spart ++ " %s"
                         resultlist = map (subst' templ2) mkeystrlists
                         result = paste resultlist ",\n"
                         
                         
getIlDictStr ::  MCommentEntryMap -> IlDictMap -> Key -> String
getIlDictStr mcomment ildict skey = result where
                  ildictentries = getIlEntries ildict skey
                  ildictstrlist = map (makeIlDictStr mcomment) ildictentries
                  result = paste ildictstrlist ",\n  "
                         
makeIlDictStr :: MCommentEntryMap -> IlDictEntry -> String
makeIlDictStr mcomments (skey, mkey, skeypref, mkeypref, md, unkn1, unkn2) = result where
                         agswitch = ""  ---unn1= A,B,G!!
                         spref = if skeypref == 0
                                 then ""
                                 else "s" ++ (show skeypref)
                         mpref = if mkeypref == 0
                                 then ""
                                 else "m" ++ (show mkeypref)
                         mdstr = if md==""
                                 then ""
                                 else "\""++md++"\""
                         mkeystr = "$" ++ mkey        
                         mcommentstr = getMCommentStr mcomments skey mkey
                         result = spaceConcat [mkeystr,agswitch,spref,mpref,mdstr,mcommentstr]                
                     
getSCommentStr :: SCommentEntryMap -> Key -> String
getSCommentStr scomment skey = result where
                    maybecommententries = DM.lookup skey scomment
                    commententries   = if maybecommententries == Nothing
                                       then []
                                       else fromJust maybecommententries
                    thecomments = map snd commententries                    
                    commentstr = paste thecomments "\n"
                    result = if commentstr == ""
                             then ""
                             else "{" ++ commentstr ++ "}"

getMCommentStr :: MCommentEntryMap -> Key -> Key -> String
getMCommentStr mcomment skey mkey = result where
                    maybecommententries = DM.lookup (skey,mkey) mcomment
                    thecomments = if maybecommententries == Nothing
                                  then []
                                  else fromJust maybecommententries
                    commentstr = paste thecomments "\n"
                    result = if commentstr == ""
                             then ""
                             else "{" ++ commentstr ++ "}"


                     

getIdDictStr :: MCommentEntryMap->IlDictMap -> [IdDictEntry] -> Key -> String
getIdDictStr mcomment ildict iddict skey = result where
           idlist = filter (\x->el15 x==skey) iddict
           idstrlist = map (makeIdDictStr mcomment ildict) idlist
           result = paste idstrlist ",\n  "
           
makeIdDictStr ::  MCommentEntryMap->IlDictMap -> IdDictEntry ->  String 
makeIdDictStr mcomment ildict (headkey, compcount, components, idskey, idpatterns) = result where
                  comps = map ("$"++) components
                  skeyseq = "<" ++ (paste comps " ") ++">"
                  idpatternset = "[" ++ idpatterns ++ "]"
                  ilentries = getIlEntries ildict idskey
                  ilstrlist = map (makeIlDictStr mcomment) ilentries
                  ilstr = paste ilstrlist "\n" 
                  result = paste [skeyseq,idpatternset, "$"++idskey, ilstr] " "

-- (skey mkey skeypref  mkeypref, meaningdescription, Char, Char)

getIlEntries :: IlDictMap -> Key -> [IlDictEntry]
getIlEntries ildict skey = result where
                      mayberesult = DM.lookup skey ildict
                      result = if mayberesult == Nothing
                               then []
                               else fromJust mayberesult

-- skey syntcat record                  
makeBLexStr :: BLexMap -> Key -> (String, String)                           
makeBLexStr blex skey = result where
                   maybeentry = DM.lookup skey blex
                   theentry = if maybeentry == Nothing
                              then ("","",[])
                              else fromJust maybeentry
                   (thekey, cat, rec) = theentry
                   attvalstr = map makeAttValStr rec
                   recstr = paste attvalstr ",\n"
                   blexstr = if cat++recstr==""
                             then ""
                             else cat ++ "(\n" ++ recstr ++ "\n)"
                   result = (blexstr, cat)                                

makeAttValStr :: (String, String) -> String
makeAttValStr (att, val) = attstr ++ val where
               attstr = att ++ (replicate n ' ')
               n = 40- (length att) +1


getfon :: Language -> Char -> String
getfon _ 'T' = "true"
getfon _ 'F' = "false"
getfon "ENGLISH" 'C' = "Consonant"
getfon "ENGLISH" 'V' = "Vowel"
getfon "ENGLISH" 'N' = "Neutral"
getfon l c = error ("illegal fon value "++ l ++": " ++ [c]) 
                     
spaceConcat :: [String] -> String
spaceConcat [] = ""
spaceConcat (x:xs) = x++maybespace++newxs where
                 newxs = spaceConcat xs
                 maybespace = if newxs=="" || x == ""
                              then ""
                              else " "                     





readMDict :: Language ->  IO [MDictEntry]
readMDict lang = fileToList  "mdict.dict" lang mDictLine
          

mDictLine :: String -> MDictEntry
mDictLine str = result where
      (fullword, rest) = splitAt 40 str
      (fon1, rest2) = splitAt 1 rest
      (fon2, rest3) = splitAt 1 rest2
      (unkn, skey) = splitAt 1 rest3
      word = paste (words fullword) "_" 
      result = (word, head fon1, head fon2, head unkn , skey) 



readSDict :: Language -> IO [SDictEntry] 
readSDict lang = fileToList "sdict.dict" lang sDictLine


sDictLine :: String -> SDictEntry
sDictLine str = (fkey, skey, contextkeys) where
                 keys = split " " str
                 fkey = head keys
                 skey = head tailkeys
                 tailkeys = tail keys
                 tailtailkeys = tail tailkeys
                 contextkeys = if last tailtailkeys==""
                               then init tailtailkeys
                               else tailtailkeys
  


sIdDictLine :: String -> SIdDictEntry
sIdDictLine str = (headkey, complkey, argnr, sidkey) where
                 elems = split " " str
                 headkey = elems?1
                 complkey = elems?2
                 argnr = read (elems?3)::Int
                 sidkey = elems?4
                 
readSIdDict :: Language -> IO [SIdDictEntry] 
readSIdDict lang = fileToList "siddict.dict" lang sIdDictLine



readIdDict :: Language -> IO [IdDictEntry] 
readIdDict lang = fileToList "iddict.dict" lang idDictLine

idDictLine :: String -> IdDictEntry
idDictLine str = (headkey, compcount, complkeys, idkey, pattern) where
                 elems = split " " str
                 headkey = elems?1
                 compcount = read(elems?2)::Int
                 complkeys = take compcount (tail (tail elems))
                 idkeyfldnr = 2+compcount+1
                 patternfldnr = idkeyfldnr+1
                 idkey = elems?idkeyfldnr
                 pattern = elems?patternfldnr
 
 
readIlDict :: Language -> IO IlDictMap
readIlDict lang = do
          putStrLn "Reading IlDict..."
          let path =subst' "%s%s/" [sourcepath, lang]
          let file = "ildict.dict"
          let filepath = path ++ file
          input<- readFile filepath
          let inlines = lines input
          let ildictlist = map ilDictLine inlines
          let ildictkvpairs = map ilDictAddKey ildictlist 
          let ildict = myFromListWith snoc ildictkvpairs DM.empty
          putStrLn "IlDict Done"
          return ildict
          
snoc :: a -> [a] -> [a]
snoc x xs = xs ++ [x]

myInsertWith :: (Eq a, Ord k) => (a->[a]->[a])-> k -> a -> DM.Map k [a] -> DM.Map k [a]
myInsertWith f  k v mp = if maybekvalue == Nothing
                          then DM.insert k [v] mp
                          else DM.insert k nv mp where
                          nv = f v (fromJust maybekvalue)
                          maybekvalue = DM.lookup k mp
                          
myFromListWith :: (Eq a, Ord k) => (a->[a]->[a])->[(k,a)] -> DM.Map k [a] -> DM.Map k [a]
myFromListWith _ [] mp = mp         
myFromListWith f ((k,v):xs) mp = myFromListWith f xs newmp where
                          newmp = myInsertWith f k v mp



readKM :: Language -> IO KeyMap
readKM lang = do
          let path = subst' "d:/jodijk/rosettaarchive/lexzip/%s/" [lang]
          let file = "reducedbskeydef.kdf"
          let filepath = path ++ file
          input<- readFile filepath
          let inlines = lines input
          let kmlist = map kmLine inlines
          let result = DM.fromList kmlist
          putStrLn "KeyMap read"
          return result

kmLine :: String -> (Int,String)
kmLine str = (theint, thestr) where
         els = split "," str
         (theint, thestr) = if length els == 2
                            then (read (head els) :: Int, unwords $ words $ (els?2))
                            else error ("Unexpected input keymap: " ++ str)

ilDictLine :: String -> IlDictEntry
ilDictLine str = (skey, mkey, skeypref, mkeypref, md, unkn1, unkn2) where
                 (skey, rest) = break (==' ') str
                 (mkey, rest1) = break (==' ') (tail rest)
                 (skeyprefstr, rest2) = break (==' ') (tail rest1)
                 (mkeyprefstr, rest3) = break (==' ') (tail rest2)
                 (rawmd, rest4) = splitAt 50  rest3
                 md = unwords $ words $ rawmd
                 (unkn1str, unkn2str) = splitAt 1 rest4
                 unkn1 = head unkn1str
                 unkn2 = head unkn2str
                 skeypref = read skeyprefstr::Int 
                 mkeypref = read mkeyprefstr::Int 



bLexEntry ::  Parser BLexEntry
bLexEntry = do
                char '$'
                skey <- identifier
                spaces
                cat <- identifier
                spaces
                char '('
                spaces
                rec <- option [] attvals
                char ')'
                spaces
                char  ';'
                spaces
                return (skey,cat,rec)

bLexList :: Parser [BLexEntry]
bLexList = do                              
          list <- many bLexEntry
          char '@'
          spaces
          return list

                
bLex :: Parser BLexMap
bLex = do                              
          list <- many bLexEntry
          char '@'
          spaces
          let result = bLexToMap list 
          return result
 
attvals :: Parser [(String, String)]
attvals = do
             rec <- sepBy attval sep
             spaces
             return rec
             
sep :: Parser Char
sep = do res <- char ','
         spaces
         return res              
             
attval ::  Parser (String, String)
attval = do 
            attstr <- att
            spaces
            valstr <- val 
            spaces            
            return (attstr,valstr)

att :: Parser String
att = do
          char '{'
          attstr <- many1 (anyBut "}")
          char '}'
          spaces
          return ("{"++attstr++"}") 

val :: Parser String
val = do
         valstr <- simpleval <|> setval
         spaces
         return valstr
         
simpleval :: Parser String
simpleval = do
              valstr <- many1 (anyBut "[], )")
              let cleanvalstr = unwords $ words $ valstr
              return cleanvalstr
              
setval :: Parser String
setval = do 
            char '['
            valstr <- many (anyBut "]")
            char ']'
            spaces
            return ("["++valstr++"]")                       


unique :: Eq a => [a] -> [a]
unique = unique' []

unique' res [] = res
unique' res (x:xs) = if x `elem` res
                     then unique' res xs
                     else unique' (x:res) xs

collectKeys ::  (String, String) -> [String]
collectKeys (att,val) = if att `elem` keyatts
                        then [val]
                        else []

collectKeysBLE ::  BLexEntry -> [String]
collectKeysBLE (skey,cat,rec) = concatMap collectKeys rec

collectKeysBLex :: [BLexEntry] -> [String]
collectKeysBLex blex = result where
         result1 = concatMap collectKeysBLE blex
         result = unique result1 
           

getstrkey :: KeyMap -> (String, String) -> (String, String)           
getstrkey km (att, val)  = result where
                    result = if att `elem` keyatts
                             then if maybestrkey == Nothing
                                  then (att,val)
                                  else (att,newval)
                             else (att,val)  where
                    maybestrkey = DM.lookup intval km
                    intval = read val::Int
                    newval = "$"++(fromJust maybestrkey)
                    
replaceKeys :: KeyMap -> BLexMap -> BLexMap
replaceKeys  km blex =   DM.map (adjustBLex km) blex

adjustBLex :: KeyMap -> BLexEntry -> BLexEntry
adjustBLex  km (skey, cat, rec) = (skey, cat, newrec) where
                     newrec = map (getstrkey km) rec               
                              
identifier :: Parser String
identifier = do 
                 result <- many1 (anyBut " (")
                 return result
          
readBLex :: Language -> IO BLexMap
readBLex lang = do 
          let path = subst' "%s%s/" [sourcepath,lang]
          let file = "blex.dict"            
          let filepath = path ++ file
          input<- readFile filepath
          putStrLn "parsing BLex..."
          case (parse bLex "" input) of
            Left err -> do
                            putStr "parse error at "
                            print err
                            return DM.empty
            Right x  -> do return x


          
readBLexList :: Language -> IO [BLexEntry]
readBLexList lang = do 
          let path = subst' "%s%s/" [sourcepath,lang]
          let file = "blex.dict"            
          let filepath = path ++ file
          input<- readFile filepath
          case (parse bLexList "" input) of
            Left err -> do
                            putStr "parse error at "
                            print err
                            return []
            Right x  -> do return x
            
            
bLexToMap :: [BLexEntry] -> DM.Map Key BLexEntry
bLexToMap v = DM.fromList (map bLexAddKey v)

bLexAddKey :: BLexEntry -> (Key, BLexEntry)
bLexAddKey v@(skey, _, _) = (skey, v)

ilDictAddKey :: IlDictEntry -> (Key, IlDictEntry)
ilDictAddKey v@(skey,_,_,_,_,_,_) = (skey, v)

sCommentAddKey :: SCommentEntry -> (Key, SCommentEntry)
sCommentAddKey v@(skey,_) = (skey, v)
          
anyBut :: [Char] -> CharParser st Char
anyBut xs = satisfy (\x-> not (x `elem` xs)) 


sCommentLine :: String -> SCommentEntry
sCommentLine str = (skey, comment) where
                 (skey, rest) = break (==' ') str
                 rawcomment = tail rest
                 comment = unwords $ words $ rawcomment



mCommentLine :: String -> MCommentEntry
mCommentLine str = (skey, mkey, comment) where
                 (skey, rest) = break (==' ') str
                 (mkey, rest2) = break (==' ') (tail rest)
                 rawcomment = tail rest2
                 comment = unwords $ words $ rawcomment

    
readSComment :: Language -> IO SCommentEntryMap 
readSComment lang = do
          putStrLn "Reading SComments..."
          let path = subst' "%s%s/" [sourcepath,lang]
          let file = "scomment.dict"
          let filepath = path ++ file
          input<- readFile filepath
          let inlines = lines input
          let scommentlist = map sCommentLine inlines
          let scommentkvpairs = map sCommentAddKey scommentlist
          let scomments = myFromListWith snoc scommentkvpairs DM.empty
          putStrLn "SComments done"
          return scomments             

readMComment :: Language -> IO MCommentEntryMap 
readMComment lang = do
          putStrLn "Reading MComments..."
          let path = subst' "%s%s/" [sourcepath, lang]
          let file = "mcomment.dict"
          let filepath = path ++ file
          input<- readFile filepath
          let inlines = lines input
          let mcommentlist = map mCommentLine inlines
          let mcommentkvpairs = map triple2pair mcommentlist
          let mcomments = myFromListWith snoc mcommentkvpairs DM.empty
          putStrLn "MComments done"
          return mcomments 
          
triple2pair :: (a,b,c) -> ((a,b),c)
triple2pair (a,b,c) = ((a,b),c)                 

{--
readMComment :: Language -> IO [MCommentEntry] 
readMComment lang = fileToList "mcomment.dict" lang  mCommentLine  
--}
          
          
fileToList :: FilePath -> Language -> (String->a) -> IO [a] 
fileToList fp lang f = do
          let path = subst' "d:/jodijk/rosettaarchive/lexzip/%s/" [lang]
          let file = fp
          let filepath = path ++ file
          putStrLn ("Reading " ++ filepath ++ "...")
          input<- readFile filepath
          let inlines = lines input
          let result = map f inlines
          putStrLn (filepath ++ " Done")
          return result                        
