$!
$ mv == "rename"
$ em == "edit"
$ nd == "@[leermake.login]nd"
$ fd == "@[leermake.login]fd"
$ ls == "directory"
$ tosun == "@[leermake.login]tosun"
$ home == "@[leermake.login]home"
$ roshome == "@[leermake.login]roshome"
$ crdir == "@[leermake.login]crdir"
$ deldir == "@[leermake.login]deldir"
$ printq == "@[leermake.login]printq"
$ where == "show symbol position"
$ home   !in order to fix symbol position
$! @grouplogin:
$ @rosdisk2:[rosetta.syslib]GROUPLOGI.com
$!
$ time
$ shoulog == "@[leermake.compile]shoulog"
$!
$ select rosetta3 tools
$ cd =="@rosdisk4:[leermake.login]cd"
$ rsholog =="@[leermake.login]rsholog"
$ rshol =="@[leermake.login]rshol"
$ sholgo == sholog
$ rene == "@rene"
$ write sys$output "Ga je gang, Rene"
$ EXIT
