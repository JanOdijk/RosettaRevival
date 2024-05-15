#! /bin/awk -f

#to do replace final ; by . \n
#done replace || by +
#done replace set_length by STRING_set_length setlength
#more done to be added @@@

BEGIN{
packagefound=0
lastend=""

stringmodules["STR.PF"]
stringmodules["STR.P"]
addimports["STR.P"]="STRNG"


programs["ANALYSIS.P"]
programs["GENERATION.P"]
programs["CONTROL.P"]
programs["DOMCOMSCANNER.P"]
programs["DOMCOM.P"]
programs["MOPTTOOPT.P"]


inimport=0
dowith=0
headerfound=0
bufline=0
incomments=0
beforeimport=1


}

{
#if (NR==30) {exiot 1}
#printf"$0 in=%s\n", $0
#printf"inimport=%s\n", inimport
#printf"[%s] \n", FILENAME > "stderr"

infile = toupper(FILENAME)
if (infilebase=="") {infilebase=getbase(infile)}
if (infileext=="") {infileext=getextension(infile)}
if (infilecore=="") {infilecore=getcore(infile)}
infilename = infilecore "." infileext

if (lastend |= "")
   { if (isempty($0))
         { lastend = lastend "\n" $0
           next
         }
     else 
         {
           print lastend
           lastend = ""
         }
   }

IGNORECASE = 1

selfincl = "(WITH *" infilecore " *;)"

$0 = gensub (selfincl, "(* \\1 *)","g",$0)
if ($0~/^ *pragma/) {$0="(* $0 *)" }
if ($0~/^ *Export/) {$0="(* $0 *)" }
if ($0~/^ *PACKAGE/) { sub("PACKAGE", "MODULE", $0)
                       sub(";", " Interface;", $0)
                       dowith=1
                       headerfound=1
                     }

if ($0~/^ *PROGRAM/) { 
                       dowith=1
                       headerfound=1
                     }

#print infilename
#print headerfound

if (!(infilename in programs))
  {
   if ($0~/^ *PROGRAM/)
      {
       sub("PROGRAM","MODULE", $0)
       sub(";"," Implementation;", $0)
       if (infile in addimports)
          {$0 = $0 sprintf("\n\nIMPORT %s;\n", addimports[infilename])}
      }
  }

gsub(/(WITH LOOPHOLES;)/,"(* WITH LOOPHOLES *)", $0)
gsub(/\<conversions;/," (* conversions *)", $0)

if (infilecore=="WCH") {gsub(//END {PC};/,"END {WCH}.", $0)}

if ((beforeimport || inimport) && $0_/\<WITH\>/) 
    {sub("WITH", "IMPORT", $0)
     inimport = 1
     beforeimport = 0
     dowith = 0
    }

gsub(/(WITH LOOPHOLES;)/,"(* WITH LOOPHOLES; *)", $0)
gsub(/loopholes\.sizeof/,"{loopholes.}sizeof",$0)
$0=gensub(/loopholes\.retype *\(([^,]+) *\,([^\)]+)\)/, "{loopholes.}\\2(\\1)", "g", $0) 
# sometimes loopholes is no present e.g in mem.p
$0=gebsub(/retype *\(([^,]+ *\,([^\)]+\)/, "{loopholes.}\\2(\\1)", "g", $0)
gsub(/loopholes.address/, "{loopholes.}Pointer", $0)

#put out to avoid name clash between type String and interface string
#if (inimport) {sub(/\<STRNG\>/,"STRING", $0)}

# comment STRINGS import out
#importstrings = /^(IMPORT STRINGS *;)$/
if       ($0~/^(WITH STRINGS *;)$/) {$0=gensub(/^(WITH STRINGS *;)$/, "(*1 \\1 1*)", $0)}
else if  ($0~/^(IMPORT STRINGS *;)$/) {$0=gensub(/^(IMPORT STRINGS *;)$/, "(*1 \\1 1*)", $0)}
else if  (inimport) {$0=gensub(/(\<STRINGS *[,;])/, "(*2 \\1 2*)", "g", $0)} 


if ($0~/^ *CONST\>/  || $0~/^ *TYPE\>/ || $0~/^ *VAR\>/ || $0~/^ *PROCEDURE\>/ || $0~/^ *BEGIN\>/ || $0~/^ *FUNCTION\>/ )
    {inimport=0}
    
if (inimport) {gsub(/,/,";",$0)}

#replace || by +
gsub(/\|\|/,"+",$0)

IGNORECASE=1
if (infilecore in stringmodules)
    {prefix=infilecore}
else
    {prefix="STRING"}

#replace set_length by STRING_set_length OR setlength
if (infilecore in stringmodules)
   {gsub(/\<set_length\>/, prefix "_set_length",$0)}
else {gsub(/\<set_length\>/, "set_length",$0)}

#replace deletestring by STRING_deletestring OR deletestring
if (infilecore in stringmodules)
   {gsub(/\<deletestring\>/, prefix "_deletestring",$0)}
else {gsub(/\<deletestring\>/, "deletestring",$0)}


#replace Append(x,y) by x:= x+y STRING_varconcat
if (infilecore in stringmodules)
       {gsub(/\<Append\>/, prefix "_Varconcat",$0)}
else   {$0=gensub(/\<Append *\(([,]+),([^\)]+)\)/,"\\\1 := \\1 + \\2","g",$0)}   

#replace maxlength(str) by STRING_Max STRING_maxlength
gsub(/\<maxlength\>/, prefix "_maxlength",$0)

if (infilecore=="LEXCOMRULES")
  {gsub(/string\(220\)/,"LEXCOMDECL_String",$0)}
  
if (infilename=="LOGNAME.PF")
   {
    if ($0~/^TYPE/)
       {$0=$0 "\n   LOGNAME_String = String(LOGNAME_MaxLen);"}
    else
       {gsub(//String\(LOGNAME_MaxLen\)/,"LOGNAME_String",$0)}   
   } #if (infilename=="LOGNAME.PF")
   
if (infilename=="LOGNAME.P")
   {
     if ($0~//^TYPE)
        {$0 =$0 "\n   String100 = String(100);"
         $0 =$0 "\n   StringSTR_Max = String(STR_Max);"
        }
     else
        {
         gsub(/String\(100\)/,"String100",$0)
         gsub(/STRING\(Str_Max\)/, "STRINGSTR_Max", $0)
        }   
   }# if (infilename=="LOGNAME.P")
        
IGNORECASE=0

if (headerfound==1)
    {
     print $0
     for (i=1;i<buflie;i++) {print buffer[i]}
     if (infilecore=="STRING")
         {ifname="STRNG"}
     else
         {ifname=infilecore}
     if (packagefound) {printf"\nEXPORT %s=all\n",ifname}
     packagefound = 0
     delete buffer
     bufline=0
     headerfound=2        
    }# if (headerfound==1)
else if (headerfound==0)
    {
     bufline++
     if (lastend=="") {buffer[bufline]=$0}
     if (packagefound) 
        {
         bufline++
         buffer[bufline]=sprintf("\nEXPORT %s=all;\n", infilecore)
        }
    } # else if (headerfound==0)     
else if (headerfound==2)
    {  
      if (lastend == "") {print $0}
    } # else if (headerfound==2)
    
if (incomments==-1) {incomments=0}

}#main loop

END{
  if (headerfound==0)
  {
    if (infileext=="PF") {modtype="interface"}
    else if (infileext=="P") {modtype="implementation"}
    else {modtype="unknown"}
    theheader= sprintf("MODULE %s %s;\n",infilecore, modtype)
    print theheader
    if (infileext=="PF") {printf"\n EXPORT %s=all;\n", infilecore}
    for (i=1,i<=bufline;i++) {print buffer[i]}
    
    packagefound=0
    delete buffer
    bufline=0
    
  }#  if (headerfound==0)

addfile = FILENAME ".add"
extendwithfile(addfile)
endstmt = sprintf("END {%s}.", infilecore)

getextension(FILENAME)
if (infileext=="PF") {gsub(/;/,".",lastend)}
printf"\n%s\n\n", lastend
if (infileext=="P" && (!(infilename in programs))) {printf"\n%s\n", endstmt}
if (headerfound==0) {printf"\n%s\n", endstmt} 

}#END



function getbase(str)
{
        local basename
        basename = str
        gsub(/(.*)\.[^\.]+$/, "$1", basename)
        return(toupper(basename))
} # getbase

function getext(str)
{
        local extension
        extension = str
        gsub(/.+\.([^\.]+)$/, "$1", extension)
        if (str !~ /\./) {extension = ""}
        return(toupper(extension))
} #getext

function getcore(str)
{
  local core
  local base
  base = getbase(str)
  core = gensub(/.*\/([^/]+)$/,"\\1","g",base)
  if (str~/\//) {core=base}
  return(toupper(core))
} #getcore
