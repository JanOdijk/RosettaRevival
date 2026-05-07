(*MPM:::==================================================================
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : lexcomcodeimp 
 *  Creation date   : august 1986
 *  Author          : rene leermakers
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

EXPORT(LEXCOMCODE);
pragma C_include('lexcomcode.pf');
pragma C_include('lexcomdecl.pf');
pragma C_include('lexcomrules.pf');
pragma C_include('string.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('ldstrtostr.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM lexcomcode;
 
WITH LEXCOMDECL,
     STRNG,
     LDSTRTOTYPE,
     LDCATSETS,
     LDSTRTOSTR,
     LEXCOMRULES;
     
var
   newcof1{new compositional rule-file},newdecof1{new decompositional
   rule-file},newof2{new interface file},oldcof1{old compositional rule-file},
   olddecof1,oldof2:text;
   
  procedure writetab(var outputfile:text;indentlevel:INTEGER);
  var j:INTEGER;
  begin
  j:=0;
  while j<>indentlevel do 
 	begin
 	j:=j+1;
        write(outputfile,'  ')
 	end
  end;

procedure LEXCOMCODE_writerulecode(rulenaam:LEXCOMDECL_string;stree1:LEXCOMDECL_psnode;
                var compas1:text;var decompas1:text);

var tempstring:LEXCOMDECL_string;
    leftrecords1:LEXCOMDECL_setofrecords;
    rightrecords1:LEXCOMDECL_setofrecords;
    basictrees,basictrees1:LEXCOMDECL_setofrecords;
  procedure writecomcode(stree1:LEXCOMDECL_psnode;var newcof1:text);
    procedure uttproc(s1:LEXCOMDECL_psnode);
    var i,numberofinputmodels,level:INTEGER;
        leftrecords2,rightrecords2:LEXCOMDECL_setofrecords;
        record1:LEXCOMDECL_string;catname,catrecname:STRING_string;
        modelstree,capairstree:LEXCOMDECL_psnode;
      procedure rulenameproc(s1:LEXCOMDECL_psnode);
      begin{rulenameproc}
      end;
      procedure modelsproc(s1:LEXCOMDECL_psnode);
      {writes procedures for matching each input tree}
      var inputmodelstree,outputmodeltree:LEXCOMDECL_psnode;
        procedure inputmodelsproc(s1:LEXCOMDECL_psnode);
        var modeltree:LEXCOMDECL_psnode;
   	    i:INTEGER;
   	    rsnode1:LEXCOMDECL_prsnode;
          procedure modelproc(s1:LEXCOMDECL_psnode;treenumber:INTEGER);
          {*matches model s1 with inputtree s'treenumber' 
           *}
   	  var i,numofreltrees:INTEGER;
   	      reltreelisttree:LEXCOMDECL_psnode;
            procedure nodedescriptionproc(s1:LEXCOMDECL_psnode);
            var category:LEXCOMDECL_string;
                sons:LEXCOMDECL_prsnode;
                str:STRING_string;
              procedure catnameproc(category:LEXCOMDECL_string);
              begin{catnameproc}
   	      writeln(newcof1,'if s^.ls^.cat=',category,' then');
              end;
              procedure catrecnameproc(s1:LEXCOMDECL_psnode;category:LEXCOMDECL_string);
              begin{catrecnameproc}
   	      writeln(newcof1,s1^.catrecnamefield^.catrecfield,':=s^.ls^.',
   							category,'field^');
   	      writeln(newcof1,'else match:=false;')
              end;
              procedure tcijferproc(s1:LEXCOMDECL_psnode);
   	      begin{tcijferproc}
              writeln(newcof1,s1^.tcijferfield^.tfield,':=s')
   	      end;
            begin{nodedescriptionproc}
            if not(s1^.nodedescriptionfield^.variable) then
   		begin
                sons:=s1^.sonlist;
                category:=s1^.nodedescriptionfield^.catn;
                if s1^.nodedescriptionfield^.basiccat then
                  begin
                  writeln(newcof1,'match:=true;');
                  if s1^.nodedescriptionfield^.keypresent then
                    begin
                    str:=s1^.nodedescriptionfield^.keystr;
                    IF str<>'*' THEN BEGIN
                      STRING_uppercase(str,str);
                      writeln(newcof1,'STRTOKEY_getSkey(''',str,''',hulpint);');
                      writeln(newcof1,'match:=(s^.ls^.',category,'field^.key');
                      writeln(newcof1,' = hulpint);');
                      END;
                    sons:=sons^.brother^.brother^.brother;
                    end;
                  writeln(newcof1,
sons^.brother^.brother^.node^.catrecnamefield^.catrecfield,'tree:=s;');
                  end;
   		catnameproc(category);
   		catrecnameproc(sons^.brother^.brother^.node,category)
   		end
   	    else tcijferproc(s1^.sonlist^.node)
            end;
            procedure reltreelistproc(s1:LEXCOMDECL_psnode);
            var i:INTEGER;
                rsnode1:LEXCOMDECL_prsnode;
              procedure relnameproc(s1:LEXCOMDECL_psnode);
              begin{relnameproc}
   	      writeln(newcof1,
             'procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);'); 
   	      writeln(newcof1,'begin{relnametest}');
              writeln(newcof1,'if rs^.relation<>',
                     s1^.relnamefield^.stringfield,' then');
              writeln(newcof1,'  match:=false');
              writeln(newcof1,'end;')   		
              end;
            begin{reltreelistproc}
   	    i:=0;
            numofreltrees:=s1^.reltreelistfield^.numberofsons;
   	    rsnode1:=s1^.sonlist;
   	    while i<>numofreltrees do
   		begin
   		i:=i+1;
   		writeln(newcof1);
   		writeln(newcof1,'procedure reltreeproc',i:1,
			'(var rs:LSSTREE_pRelNode;var match:BOOLEAN);');
                relnameproc(rsnode1^.node);
                rsnode1:=rsnode1^.brother^.brother;
   		modelproc(rsnode1^.node,0);
   		writeln(newcof1,'begin{reltreeproc',i:1,'}');
   	        writeln(newcof1,'relnametest(rs,match);');
   		writeln(newcof1,'if match then modelproc0(rs^.node,match)');
                writeln(newcof1,'end;');
     		if i<>numofreltrees then rsnode1:=rsnode1^.brother^.brother
                end
            end;
          procedure mucijferproc(s1:LEXCOMDECL_psnode);
          begin{mucijferproc}
          writeln(newcof1,s1^.mucijferfield^.mufield,':=rs')
          end;
          begin{modelproc}
          writeln(newcof1,'procedure modelproc',treenumber:1,
				'(s:LSSTREE_pStree;var match:BOOLEAN);');
          writeln(newcof1,'var');
   	  writeln(newcof1,'   rs:LSSTREE_pRelNode;');
          if s1^.modelfield^.nonemptyreltreelist then
   		begin
   		reltreelisttree:=s1^.sonlist^.brother^.brother^.node;
   		reltreelistproc(reltreelisttree)
   		end
          else numofreltrees:=0;
          writeln(newcof1,'begin {modelproc',treenumber:1,'}');
   	  nodedescriptionproc(s1^.sonlist^.node);
   	  if not(s1^.modelfield^.existreltreelist) then
   		writeln(newcof1,'skip');
	  if s1^.modelfield^.nonemptyreltreelist or 
             s1^.modelfield^.existreltreelist then
   					 writeln(newcof1,'rs:=s^.sons;');
   	  if s1^.modelfield^.existreltreelist and 
   				not(s1^.modelfield^.nonemptyreltreelist) then
   		writeln(newcof1,'if rs<>nil then match:=false');
   	  if s1^.modelfield^.nonemptyreltreelist then 
   		if reltreelisttree^.reltreelistfield^.variable then
   	     mucijferproc(reltreelisttree^.sonlist^.node);
          i:=0;
   	  while i<>numofreltrees do
   		begin
   		i:=i+1;
		writeln(newcof1,'if rs=nil then match:=false;');
		writeln(newcof1,'if match then');
		writeln(newcof1,'  begin');
		writeln(newcof1,'  reltreeproc',i:1,'(rs,match);');
   		writeln(newcof1,'  rs:=rs^.brother');
		writeln(newcof1,'  end;');
                if i=numofreltrees then writeln(newcof1,
   					'if rs<>nil then match:=false')
   		end;
          writeln(newcof1,'end;')
          end;
        begin{inputmodelsproc}
   	i:=0;
        rsnode1:=s1^.sonlist^.brother^.brother;
   	while i<>numberofinputmodels do
   		begin
   		i:=i+1;
   		modeltree:=rsnode1^.node;
   		modelproc(modeltree,i);
   		if i<>numberofinputmodels then 
   			rsnode1:=rsnode1^.brother^.brother^.brother
   		end
      end;

      procedure outputmodelproc(s1:LEXCOMDECL_psnode);
        var modeltree:LEXCOMDECL_psnode;
          procedure modelproc(s1:LEXCOMDECL_psnode);
          var reltreelisttree:LEXCOMDECL_psnode;
            procedure nodedescriptionproc(s1:LEXCOMDECL_psnode);
   	    var category:LEXCOMDECL_string;
                str1,str2,str:STRING_string;i:CHAR;
                sons:LEXCOMDECL_prsnode;
              procedure catnameproc(category:LEXCOMDECL_string);
              begin{catnameproc}
              writeln(newcof1,'  s:=MAKET_Stree(',category,');')
              end;
              procedure catrecnameproc(s1:LEXCOMDECL_psnode;category:LEXCOMDECL_string);
              var str1,str2:LEXCOMDECL_string;
                  i:char;commonvar:BOOLEAN;
              begin{catrecnameproc}
              str1:=s1^.catrecnamefield^.catrecfield;
              leftrecords2:=leftrecords1;
              commonvar:=false;
              while LEXCOMRULES_stillrecords(leftrecords2) do
   		begin
   		LEXCOMRULES_takerecord(record1,leftrecords2);
   		if str1=record1 then commonvar:=true
   		end;
   	      if commonvar then
   		    writeln(newcof1,'  s^.ls^.',category,'field^:=',str1,';');
              str2:=str1;
   	      set_length(str2,length(str2)+1);
              i:=str1[length(str1)];
              str2[length(str2)-4]:='_';
              str2[length(str2)-3]:='r';
              str2[length(str2)-2]:='e';
              str2[length(str2)-1]:='c';
              str2[length(str2)]:=i;
   	      writeln(newcof1,'  ',str2,':=','s^.ls^.',category,'field;')
              end;
              procedure tcijferproc(s1:LEXCOMDECL_psnode);
   	      begin{tcijferproc}
   	      writeln(newcof1,'s:=',s1^.tcijferfield^.tfield)
   	      end;
            begin{nodedescriptionproc}
            category:=s1^.nodedescriptionfield^.catn;
            sons:=s1^.sonlist;
            if s1^.nodedescriptionfield^.basiccat then
               begin
               if s1^.nodedescriptionfield^.keypresent then
                  begin
                  str:=s1^.nodedescriptionfield^.keystr;
                  IF str<>'*' THEN BEGIN
                    STRING_uppercase(str,str);
                    writeln(newcof1,'StrToKey_GetSkey(''',str,''',hulpint);');
                    writeln(newcof1,'hulpstree:=LDBLEX_read(hulpint);');
                    writeln(newcof1,'s:=Loopholes.retype(hulpstree,LSSTREE_pstree);');
                    sons:=sons^.brother^.brother^.brother^.brother^.brother;
                    writeln(newcof1,sons^.node^.catrecnamefield^.catrecfield,
                     ':=s^.ls^.',category,'field^;');
                    END
                  ELSE
                    BEGIN
                    write(newcof1,'s:=MAKET_stree(');
                    write(newcof1,category);
                    writeln(newcof1,');');
                    str1:=s1^.sonlist^.brother^.brother^.brother^.brother^.brother^.node^.catrecnamefield^.catrecfield;
                    str2:=str1;
                    set_length(str2,length(str2)+1);
                    i:=str1[length(str1)];
                    str2[length(str2)-4]:='_';
                    str2[length(str2)-3]:='r';
                    str2[length(str2)-2]:='e';
                    str2[length(str2)-1]:='c';
                    str2[length(str2)]:=i;
                    writeln(newcof1,str2,
                    ':=s^.ls^.',category,'field;');
                    END;
                  end
               else
                  begin
                  writeln(newcof1,'s:=',
s1^.sonlist^.brother^.brother^.node^.catrecnamefield^.catrecfield,'tree;');
                  end;
               end
            else
   	    if s1^.nodedescriptionfield^.variable then 
   					tcijferproc(s1^.sonlist^.node)
   	    else
   		begin
   		catnameproc(category);
   	        catrecnameproc(s1^.sonlist^.brother^.brother^.node,category)
   		end
            end;
            procedure reltreelistproc(s1:LEXCOMDECL_psnode);
   	    var i,numofreltrees:INTEGER;
   		rsnode1:LEXCOMDECL_prsnode;
              procedure relnameproc(s1:LEXCOMDECL_psnode);
              begin{relnameproc}
   	      writeln(newcof1,
                  'rs^.relation:=',s1^.relnamefield^.stringfield,';')
              end;
            procedure mucijferproc(s1:LEXCOMDECL_psnode);
   	    begin{mucijferproc}
   	    writeln(newcof1,'rs:=',s1^.mucijferfield^.mufield)
   	    end;
            begin{reltreelistproc}
   	    numofreltrees:=s1^.reltreelistfield^.numberofsons;
   	    writeln(newcof1,
   		'procedure createreltreelist(var rs:LSSTREE_pRelNode);');
   	    if not(s1^.reltreelistfield^.variable) then
   		begin
   		writeln(newcof1,'var');
   	    	writeln(newcof1,'rs1,rs2:LSSTREE_pRelNode;')
   		end;
   	    i:=0;
            rsnode1:=s1^.sonlist;
   	    while i<>numofreltrees do
   		begin
   		i:=i+1;
   		writeln(newcof1,'procedure createreltree',i:1,
   						'(var rs:LSSTREE_pRelNode);');
   		writeln(newcof1,'var');
   		writeln(newcof1,'   s:LSSTREE_pStree;');
   		modelproc(rsnode1^.brother^.brother^.node);
   		writeln(newcof1,'begin{createreltree',i:1,'}');
   		writeln(newcof1,'LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));');
   		relnameproc(rsnode1^.node);
   		writeln(newcof1,'createoutputtree(s);');
   		writeln(newcof1,'rs1^.node:=s');
   		if i<>numofreltrees then 
   			rsnode1:=rsnode1^.brother^.brother^.brother^.brother;
   		writeln(newcof1,'end;')
   		end;
   	    writeln(newcof1,'begin{createreltreelist}');
   	    if s1^.reltreelistfield^.variable then 
   				mucijferproc(s1^.sonlist^.node);
   	    i:=0;
   	    while i<>numofreltrees do
   		begin
   		i:=i+1;
   		writeln(newcof1,'createreltree',i:1,'(rs1);');
   		if i=1 then write(newcof1,'rs:=rs1 ');
   		if i<>1 then write(newcof1,'rs2^.brother:=rs1');
   		if i<>numofreltrees then 
   			begin
   			writeln(newcof1,';');
   			writeln(newcof1,'rs2:=rs1;')
   			end
   		else writeln(newcof1)
   		end;
   	    writeln(newcof1,'end;')
            end;
          begin{modelproc}    
   	  writeln(newcof1,'procedure createoutputtree(var s:LSSTREE_pStree);');
   	  writeln(newcof1,'var');
   	  writeln(newcof1,'   rs:LSSTREE_pRelNode;');
   	  if s1^.modelfield^.nonemptyreltreelist then
   		begin
   		reltreelisttree:=s1^.sonlist^.brother^.brother^.node;
  		reltreelistproc(reltreelisttree)
   		end;
   	  writeln(newcof1,'begin{createoutputtree}');
          nodedescriptionproc(s1^.sonlist^.node);
          if s1^.modelfield^.nonemptyreltreelist then
   	     begin
   	     writeln(newcof1,'  createreltreelist(rs);');
   	     writeln(newcof1,'  s^.sons:=rs;');
             IF reltreelisttree^.reltreelistfield^.variable THEN
                BEGIN
                writeln(newcof1,'s^.li^.n:=numberofelements(rs)');
                END
             ELSE
             writeln(newcof1,'  s^.li^.n:=',
                     reltreelisttree^.reltreelistfield^.numberofsons);
   	     end
   	  else if not(s1^.sonlist^.node^.nodedescriptionfield^.variable) then 
             BEGIN
   	     writeln(newcof1,'  s^.sons:=nil;');
             writeln(newcof1,'  s^.li^.n:=0');
             END;
   	  writeln(newcof1,'end;')
          end;
      begin{outputmodelproc}
      modeltree:=s1^.sonlist^.brother^.brother^.node;
      writeln(newcof1);
      modelproc(modeltree)
      end;

      begin{modelsproc}
      inputmodelstree:=s1^.sonlist^.node;
      outputmodeltree:=s1^.sonlist^.brother^.node;
      inputmodelsproc(inputmodelstree);
      outputmodelproc(outputmodeltree)
      end;

      procedure capairsproc(s1:LEXCOMDECL_psnode;indentlevel:INTEGER);
      var conditiontree,capairstree,actiontree:LEXCOMDECL_psnode;
          i,numberofsoncas:INTEGER;
          rsnode1:LEXCOMDECL_prsnode;

        procedure conditionproc(s1:LEXCOMDECL_psnode;indentlevel:INTEGER);
        var i,numberofconds:INTEGER;
            rsnode1:LEXCOMDECL_prsnode;
            pascaltree:LEXCOMDECL_psnode;
          procedure pascalproc(s1:LEXCOMDECL_psnode);
   	  var i,j:INTEGER;
              ch:char;
          begin{pascalproc}
   	  if length(s1^.pascalfield^.stringfield)<80 then 
          write(newcof1,s1^.pascalfield^.stringfield)
          else
   		begin
   		i:=0;
                j:=0;
   		while i<>length(s1^.pascalfield^.stringfield) do
   			begin
   			i:=i+1;
                        j:=j+1;
   			ch:= s1^.pascalfield^.stringfield[i];
   			if (j>25) and (ch=' ') then 
   					begin
   					writeln(newcof1);
   					write(newcof1,'                 ');
   					j:=0
   					end;
   			write(newcof1,ch)
   			end
   		end
          end;
        begin{conditionproc}
        numberofconds:=s1^.conditionfield^.numberofconditions;
   	i:=1;
        rsnode1:=s1^.sonlist^.brother^.brother;
        pascaltree:=rsnode1^.node;
        pascalproc(pascaltree);
        while i<>numberofconds do
   		begin
   		i:=i+1;
   		if s1^.conditionfield^.andcond then
   			begin
   	   		writeln(newcof1,' then');
        	        writetab(newcof1,indentlevel+i);
                	write(newcof1,'if ')
   			end
   		else
   			begin
   			writeln(newcof1);
   			writetab(newcof1,indentlevel+i);
   			write(newcof1,'or')
   			end;
                rsnode1:=rsnode1^.brother^.brother;
                pascaltree:=rsnode1^.node;
                pascalproc(pascaltree)
   		end
        end;
        procedure actionproc(s1:LEXCOMDECL_psnode;indentlevel:INTEGER);
        var pascaltree:LEXCOMDECL_psnode;
            rsnode1:LEXCOMDECL_prsnode;
            i,numberofacts:INTEGER;
          procedure pascalproc(s1:LEXCOMDECL_psnode);
   	  var i,j:INTEGER;
              ch:char;
          begin{pascalproc}
   	  if length(s1^.pascalfield^.stringfield)<80 then 
          write(newcof1,s1^.pascalfield^.stringfield)
          else
   		begin
   		i:=0;
                j:=0;
   		while i<>length(s1^.pascalfield^.stringfield) do
   			begin
   			i:=i+1;
                        j:=j+1;
   			ch:= s1^.pascalfield^.stringfield[i];
   			if (j>25) and (ch=' ') then 
   					begin
   					writeln(newcof1);
   					write(newcof1,'                 ');
   					j:=0
   					end;
   			write(newcof1,ch)
   			end
   		end
          end;
        begin{actionproc}
        numberofacts:=s1^.actionfield^.numberofactions;
   	if numberofacts<>0 then
   		begin
   		i:=1;
   		rsnode1:=s1^.sonlist^.brother^.brother;
   		pascaltree:=rsnode1^.node;
   		writetab(newcof1,indentlevel);
   		pascalproc(pascaltree);
   		while i<>numberofacts do
   			begin
   			i:=i+1;
   			writeln(newcof1,';');
   			writetab(newcof1,indentlevel);
   			rsnode1:=rsnode1^.brother^.brother;
   			pascaltree:=rsnode1^.node;
   			pascalproc(pascaltree)
   			end
   		end
        else
   		begin
   		writetab(newcof1,indentlevel);
   		write(newcof1,'skip')
   		end
        end;
      begin{capairsproc}
      numberofsoncas:=s1^.capairsfield^.numofcas;
      i:=0;
      rsnode1:=s1^.sonlist;
      while i<>numberofsoncas do
   	begin
        i:=i+1;
        writetab(newcof1,indentlevel);
        write(newcof1,'IF ');
        conditiontree:=rsnode1^.node;
        conditionproc(conditiontree,indentlevel);
        writeln(newcof1,' THEN');
        writetab(newcof1,indentlevel+1);
        writeln(newcof1,'BEGIN');
        rsnode1:=rsnode1^.brother;
        if rsnode1^.node^.cat=capairs then 
   		begin
   		capairstree:=rsnode1^.node;
                capairsproc(capairstree,indentlevel+1);
                rsnode1:=rsnode1^.brother;
                level:=indentlevel+1;
                writetab(newcof1,indentlevel+1);
                writeln(newcof1,'if success and (level=',level:1,') then');
                writetab(newcof1,indentlevel+1);
                writeln(newcof1,'  begin');
                writetab(newcof1,indentlevel+1);
                writeln(newcof1,'  level:=',indentlevel:1,';')
   		end
        else 
   		begin
   		writetab(newcof1,indentlevel+1);
                writeln(newcof1,'if success then againsuccess:=true;');
   		writetab(newcof1,indentlevel+1);
                writeln(newcof1,'downcount:=downcount-1;');
   		writetab(newcof1,indentlevel+1);
                writeln(newcof1,'if downcount=0 then');
   		writetab(newcof1,indentlevel+1);
                writeln(newcof1,'  begin');
   		writetab(newcof1,indentlevel+1);
                writeln(newcof1,'  success:=true;');
   		writetab(newcof1,indentlevel+1);
                writeln(newcof1,'  level:=',indentlevel:1,';');
   		writetab(newcof1,indentlevel+1);
   		writeln(newcof1,'  createoutputtree(s);')
   		end;
        actiontree:=rsnode1^.node;
        actionproc(actiontree,indentlevel+2);
        writeln(newcof1);
        writetab(newcof1,indentlevel+1);
        writeln(newcof1,'  end');
        writetab(newcof1,indentlevel+1);
        writeln(newcof1,'END;');
        if i<>numberofsoncas then rsnode1:=rsnode1^.brother
   	end
      end;
   
   begin{uttproc}
   write(newcof1,'FUNCTION com');
   write(newcof1,s1^.sonlist^.node^.rulenamefield^.rulename,'(');
   modelstree:=s1^.sonlist^.brother^.node;
   capairstree:=s1^.sonlist^.brother^.brother^.brother^.node;
   numberofinputmodels:=
  		   modelstree^.sonlist^.node^.inputmodelsfield^.numberofmodels;
   i:=1;
   write(newcof1,'Is1');
   while i<>numberofinputmodels do
      begin
      i:=i+1;
      write(newcof1,',','Is',i:1);
      end;
   writeln(newcof1,':LISTREE_pStree)');
   writeln(newcof1,'                                 :LISTREE_SetOfStrees;');
   if s1^.sonlist^.brother^.brother^.node^.cat=comp then
    begin
    writeln(newcof1,'var');
    basictrees1:=basictrees;
    while LEXCOMRULES_stillrecords(basictrees1) do
      begin
      LEXCOMRULES_takerecord(tempstring,basictrees1);
      writeln(newcof1,tempstring,':LSSTREE_pstree;');
      end;
    writeln(newcof1,'   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;');
    writeln(newcof1,'   s:LSSTREE_pStree;');
    writeln(newcof1,'   hulpint:INTEGER;');
    writeln(newcof1,'   hulpstree:LISTREE_pStree;');
    writeln(newcof1,'   Is:LISTREE_pStree;');
    i:=0;
    while i<>numberofinputmodels do
   	begin
        i:=i+1;
        writeln(newcof1,'   s',i:1,':LSSTREE_pStree;')
   	end;
    writeln(newcof1,'   match,success,againsuccess:BOOLEAN;');
    writeln(newcof1,'   downcount,numberofsuccesses,level:INTEGER;');
    writeln(newcof1,'   result:LISTREE_SetOfStrees;');
    leftrecords2:=leftrecords1;
    while LEXCOMRULES_stillrecords(leftrecords2) do
   	begin
   	LEXCOMRULES_takerecord(record1,leftrecords2);
   	i:=0;
        STRING_constantempty(catname);
   	while i<> (length(record1)-4) do
   		begin
   		i:=i+1;
                STRING_appendchar(catname,catname,record1[i])
   		end;
        catrecname:=ldstrtostr_cattorectype(catname);
        writeln(newcof1,'   ',record1,':LSDOMAINT_',
                                          catrecname:STRING_length(catrecname),';')
	end;
    rightrecords2:=rightrecords1;
    while LEXCOMRULES_stillrecords(rightrecords2) do
   	begin
   	LEXCOMRULES_takerecord(record1,rightrecords2);
        write(newcof1,'    ');
   	i:=0;
        set_length(catname,0);
   	while i<> (length(record1)-4) do
   		begin
   		i:=i+1;
                set_length(catname,length(catname)+1);
                catname[i]:=record1[i]
   		end;
        write(newcof1,catname,'_rec');
   	write(newcof1,record1[length(record1)]);
        catrecname:=ldstrtostr_cattorectype(catname);
   	writeln(newcof1,':','LSDOMAINT_p',catrecname:STRING_length(catrecname),';')
   	end;
    modelsproc(modelstree);
    writeln(newcof1);
    writeln(newcof1,'begin {main body}');
    writeln(newcof1,'s:=nil;');
    i:=0;
    while i<>numberofinputmodels do
   	begin
        i:=i+1;
        writeln(newcof1,'s',i:1,':=loopholes.retype(Is',i:1,',LSSTREE_pStree);')
   	end;
    writeln(newcof1,'match:=true;');
    writeln(newcof1,'againsuccess:=true;');
    writeln(newcof1,'numberofsuccesses:=0;');
    writeln(newcof1,'LISTREE_initsetofstrees(result);');
    i:=1;
    if numberofinputmodels>=1 then
       writeln(newcof1,'modelproc1(s1,match);');
    while i<>numberofinputmodels do 
       	begin
   	i:=i+1;
   	writeln(newcof1,'if match then modelproc',i:1,'(s',i:1,',match',');')
   	end;
    writeln(newcof1,'WHILE againsuccess DO');
    writeln(newcof1,'  begin');
    writeln(newcof1,'  againsuccess:=false;');
    writeln(newcof1,'  success:=false;');
    writeln(newcof1,'  level:=0;');
    writeln(newcof1,'  numberofsuccesses:=numberofsuccesses+1;');
    writeln(newcof1,'  downcount:=numberofsuccesses;');
    writeln(newcof1,'  if match then');
    writeln(newcof1,'    begin');
    capairsproc(capairstree,2);
    writeln(newcof1,'    skip');
    writeln(newcof1,'    end;');
    writeln(newcof1,'  Is:=loopholes.retype(s,LISTREE_pStree);');
    writeln(newcof1,'  if success then LISTREE_appendstree(Is,result)');
    writeln(newcof1,'  end;');
    writeln(newcof1,'com',s1^.sonlist^.node^.rulenamefield^.rulename,
   								':=result');
    writeln(newcof1,'end;')
    end
   else writeln(newcof1,'begin end;')
   end;    

  begin
  writeln(newcof1);
  writeln(newcof1,'{rule:}');
  writeln(newcof1,'{:',stree1^.sonlist^.node^.rulenamefield^.rulename,'}');
  uttproc(stree1);
  writeln(newcof1,'{:',stree1^.sonlist^.node^.rulenamefield^.rulename,'}')
  end;

  procedure writedecomcode(stree1:LEXCOMDECL_psnode;var newdecof1:text);
    var level:INTEGER;
    procedure uttproc(s1:LEXCOMDECL_psnode);
    var i,numberofinputmodels:INTEGER;
        leftrecords2,rightrecords2:LEXCOMDECL_setofrecords;
   	record1:LEXCOMDECL_string;catname,catrecname:STRING_string;
        modelstree,capairstree:LEXCOMDECL_psnode;
      procedure rulenameproc(s1:LEXCOMDECL_psnode);
      begin{rulenameproc}
      end;
      procedure modelsproc(s1:LEXCOMDECL_psnode);
      var outputmodeltree,inputmodelstree:LEXCOMDECL_psnode;  
        procedure outputmodelproc(s1:LEXCOMDECL_psnode);
          procedure modelproc(s1:LEXCOMDECL_psnode);
   	  var i,numofreltrees:INTEGER;
   	      reltreelisttree:LEXCOMDECL_psnode;
            procedure nodedescriptionproc(s1:LEXCOMDECL_psnode);
            var category:LEXCOMDECL_string;
                sons:LEXCOMDECL_prsnode;
                str:STRING_string;
              procedure catnameproc(category:LEXCOMDECL_string);
              begin{catnameproc}
   	      writeln(newdecof1,'if s^.ls^.cat=',category,' then');
              end;
              procedure catrecnameproc(s1:LEXCOMDECL_psnode;category:LEXCOMDECL_string);
              begin{catrecnameproc}
   	      writeln(newdecof1,s1^.catrecnamefield^.catrecfield,':=s^.ls^.',
   							category,'field^');
   	      writeln(newdecof1,'else match:=false;')
              end;
              procedure tcijferproc(s1:LEXCOMDECL_psnode);
   	      begin{tcijferproc}
              writeln(newdecof1,s1^.tcijferfield^.tfield,':=s')
   	      end;
            begin{nodedescriptionproc}
            if not(s1^.nodedescriptionfield^.variable) then
   		begin
                category:=s1^.nodedescriptionfield^.catn;
                sons:=s1^.sonlist;
                if s1^.nodedescriptionfield^.basiccat then
                  begin
                  writeln(newdecof1,'match:=true;');
                  if s1^.nodedescriptionfield^.keypresent then
                    begin
                    str:=s1^.nodedescriptionfield^.keystr;
                    IF str<>'*' THEN BEGIN
                      STRING_uppercase(str,str);
                      writeln(newdecof1,'STRTOKEY_getSkey(''',str,''',hulpint);');
                      writeln(newdecof1,'match:=(s^.ls^.',category,'field^.key');
                      writeln(newdecof1,' = hulpint);');
                      END;
                    sons:=sons^.brother^.brother^.brother;
                    end;
                  writeln(newdecof1,
sons^.brother^.brother^.node^.catrecnamefield^.catrecfield,'tree:=s;');
                  end;
   		catnameproc(category);
   		catrecnameproc(sons^.brother^.brother^.node,category)
   		end
   	    else tcijferproc(s1^.sonlist^.node)
            end;
            procedure reltreelistproc(s1:LEXCOMDECL_psnode);
            var i:INTEGER;
                rsnode1:LEXCOMDECL_prsnode;
              procedure relnameproc(s1:LEXCOMDECL_psnode);
              begin{relnameproc}
   	      writeln(newdecof1,
             'procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);'); 
   	      writeln(newdecof1,'begin{relnametest}');
              writeln(newdecof1,'if rs^.relation<>',
                     s1^.relnamefield^.stringfield,' then');
              writeln(newdecof1,'  match:=false');
              writeln(newdecof1,'end;')   		
              end;
            begin{reltreelistproc}
   	    i:=0;
            numofreltrees:=s1^.reltreelistfield^.numberofsons;
   	    rsnode1:=s1^.sonlist;
   	    while i<>numofreltrees do
   		begin
   		i:=i+1;
   		writeln(newdecof1);
   		writeln(newdecof1,'procedure reltreeproc',i:1,
			'(var rs:LSSTREE_pRelNode;var match:BOOLEAN);');
                relnameproc(rsnode1^.node);
                rsnode1:=rsnode1^.brother^.brother;
   		modelproc(rsnode1^.node);
   		writeln(newdecof1,'begin{reltreeproc',i:1,'}');
   	        writeln(newdecof1,'relnametest(rs,match);');
   		writeln(newdecof1,'if match then modelproc(rs^.node,match)');
                writeln(newdecof1,'end;');
     		if i<>numofreltrees then rsnode1:=rsnode1^.brother^.brother
                end
            end;
          procedure mucijferproc(s1:LEXCOMDECL_psnode);
          begin{mucijferproc}
          writeln(newdecof1,s1^.mucijferfield^.mufield,':=rs')
          end;
          begin{modelproc}
   	  writeln(newdecof1,
               'procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);');
   	  writeln(newdecof1,'var');
   	  writeln(newdecof1,'   rs:LSSTREE_pRelNode;');
          if s1^.modelfield^.nonemptyreltreelist then
   		begin
   		reltreelisttree:=s1^.sonlist^.brother^.brother^.node;
   		reltreelistproc(reltreelisttree)
   		end
          else numofreltrees:=0;
   	  writeln(newdecof1,'begin{modelproc}');
   	  nodedescriptionproc(s1^.sonlist^.node);
   	  if not(s1^.modelfield^.existreltreelist) then
   		writeln(newdecof1,'skip');
   	  if s1^.modelfield^.nonemptyreltreelist or 
   	     s1^.modelfield^.existreltreelist then
   				writeln(newdecof1,'rs:=s^.sons;');
   	  if s1^.modelfield^.existreltreelist and
   			not(s1^.modelfield^.nonemptyreltreelist) then
   		writeln(newdecof1,'if rs<>nil then match:=false');
   	  if s1^.modelfield^.nonemptyreltreelist then 
   		if reltreelisttree^.reltreelistfield^.variable then
   	     mucijferproc(reltreelisttree^.sonlist^.node);
          i:=0;
   	  while i<>numofreltrees do
   		begin
   		i:=i+1;
		writeln(newdecof1,'if rs=nil then match:=false;');
		writeln(newdecof1,'if match then');
		writeln(newdecof1,'  begin');
		writeln(newdecof1,'  reltreeproc',i:1,'(rs,match);');
   		writeln(newdecof1,'  rs:=rs^.brother');
		writeln(newdecof1,'  end;');
   		if i=numofreltrees then 
   	                writeln(newdecof1,'if rs<>nil then match:=false')
   		end;
        
   	  writeln(newdecof1,'end;')
          end;
        begin{outputmodelproc}
   	modelproc(s1^.sonlist^.brother^.brother^.node)
        end;

        procedure inputmodelsproc(s1:LEXCOMDECL_psnode);
        var modeltree:LEXCOMDECL_psnode;
            i:INTEGER;
            rsnode1:LEXCOMDECL_prsnode;
          procedure modelproc(s1:LEXCOMDECL_psnode;treenumber:INTEGER);
          var reltreelisttree:LEXCOMDECL_psnode;
            procedure nodedescriptionproc(s1:LEXCOMDECL_psnode);
   	    var category:LEXCOMDECL_string;
                sons:LEXCOMDECL_prsnode;
                str,str1,str2:STRING_string;i:CHAR;
              procedure catnameproc(category:LEXCOMDECL_string);
              begin{catnameproc}
              writeln(newdecof1,'s:=MAKET_Stree(',category,');')
              end;
              procedure catrecnameproc(s1:LEXCOMDECL_psnode;category:LEXCOMDECL_string);
              var str1,str2:LEXCOMDECL_string;
                  i:char;commonvar:BOOLEAN;
              begin{catrecnameproc}
              str1:=s1^.catrecnamefield^.catrecfield;
              rightrecords2:=rightrecords1;
              commonvar:=false;
              while LEXCOMRULES_stillrecords(rightrecords2) do
   		begin
   		LEXCOMRULES_takerecord(record1,rightrecords2);
   		if str1=record1 then commonvar:=true
   		end;
   	      if commonvar then
         	      writeln(newdecof1,'s^.ls^.',category,'field^:=',str1,';');
              str2:=str1;
   	      set_length(str2,length(str2)+1);
              i:=str1[length(str1)];
              str2[length(str2)-4]:='_';
              str2[length(str2)-3]:='r';
              str2[length(str2)-2]:='e';
              str2[length(str2)-1]:='c';
              str2[length(str2)]:=i;
   	      writeln(newdecof1,'  ',str2,':=','s^.ls^.',category,'field;')
              end;
              procedure tcijferproc(s1:LEXCOMDECL_psnode);
   	      begin{tcijferproc}
   	      writeln(newdecof1,'s:=',s1^.tcijferfield^.tfield)
   	      end;
            begin{nodedescriptionproc}
            category:=s1^.nodedescriptionfield^.catn;
            sons:=s1^.sonlist;
            if s1^.nodedescriptionfield^.basiccat then
               begin
               if s1^.nodedescriptionfield^.keypresent then
                  begin
                  str:=s1^.nodedescriptionfield^.keystr;
                  IF str<>'*' THEN BEGIN
                    STRING_uppercase(str,str);
                    writeln(newdecof1,'StrToKey_GetSkey(''',str,''',hulpint);');
                    writeln(newdecof1,'hulpstree:=LDBLEX_read(hulpint);');
                    writeln(newdecof1,'s:=loopholes.retype(hulpstree,LSSTREE_pstree);');
                    sons:=sons^.brother^.brother^.brother^.brother^.brother;
                    writeln(newdecof1,sons^.node^.catrecnamefield^.catrecfield,
                     ':=s^.ls^.',category,'field^;');
                    END
                  ELSE
                    BEGIN
                    write(newdecof1,'s:=MAKET_stree(');
                    write(newdecof1,category);
                    writeln(newdecof1,');');
                    str1:=s1^.sonlist^.brother^.brother^.brother^.brother^.brother^.node^.catrecnamefield^.catrecfield;
                    str2:=str1;
                    set_length(str2,length(str2)+1);
                    i:=str1[length(str1)];
                    str2[length(str2)-4]:='_';
                    str2[length(str2)-3]:='r';
                    str2[length(str2)-2]:='e';
                    str2[length(str2)-1]:='c';
                    str2[length(str2)]:=i;
                    writeln(newdecof1,str2,
                    ':=s^.ls^.',category,'field;');
                    END;
                  end
               else
                  begin
                  writeln(newdecof1,'s:=',
s1^.sonlist^.brother^.brother^.node^.catrecnamefield^.catrecfield,'tree;');
                  end;
               end
            else
   	    if s1^.nodedescriptionfield^.variable then 
   					tcijferproc(s1^.sonlist^.node)
   	    else
   		begin
   		catnameproc(category);
   	        catrecnameproc(s1^.sonlist^.brother^.brother^.node,category)
   		end
            end;
            procedure reltreelistproc(s1:LEXCOMDECL_psnode);
   	    var i,numofreltrees:INTEGER;
   		rsnode1:LEXCOMDECL_prsnode;
              procedure relnameproc(s1:LEXCOMDECL_psnode);
              begin{relnameproc}
   	      writeln(newdecof1,
                 'rs^.relation:=',s1^.relnamefield^.stringfield,';')
              end;
            procedure mucijferproc(s1:LEXCOMDECL_psnode);
   	    begin{mucijferproc}
   	    writeln(newdecof1,'rs:=',s1^.mucijferfield^.mufield)
   	    end;
            begin{reltreelistproc}
   	    numofreltrees:=s1^.reltreelistfield^.numberofsons;
   	    writeln(newdecof1,
                'procedure createreltreelist(var rs:LSSTREE_pRelNode);');
   	    if not(s1^.reltreelistfield^.variable) then
   		begin
   		writeln(newdecof1,'var');
   	    	writeln(newdecof1,'rs1,rs2:LSSTREE_pRelNode;')
   		end;
   	    i:=0;
            rsnode1:=s1^.sonlist;
   	    while i<>numofreltrees do
   		begin
   		i:=i+1;
   		writeln(newdecof1,'procedure createreltree',i:1,
   						'(var rs:LSSTREE_pRelNode);');
   		writeln(newdecof1,'var');
   		writeln(newdecof1,'   s:LSSTREE_pStree;');
   		modelproc(rsnode1^.brother^.brother^.node,0);
   		writeln(newdecof1,'begin{createreltree',i:1,'}');
   		writeln(newdecof1,'LISTREE_makerelnode(loopholes.retype(rs,LISTREE_prelnode));');
   		relnameproc(rsnode1^.node);
   		writeln(newdecof1,'createinputmodel0(s);');
   		writeln(newdecof1,'rs1^.node:=s');
   		if i<>numofreltrees then 
   			rsnode1:=rsnode1^.brother^.brother^.brother^.brother;
   		writeln(newdecof1,'end;')
   		end;
   	    writeln(newdecof1,'begin{createreltreelist}');
   	    if s1^.reltreelistfield^.variable then 
   				mucijferproc(s1^.sonlist^.node);
   	    i:=0;
   	    while i<>numofreltrees do
   		begin
   		i:=i+1;
   		writeln(newdecof1,'createreltree',i:1,'(rs1);');
   		if i=1 then write(newdecof1,'rs:=rs1 ');
   		if i<>1 then write(newdecof1,'rs2^.brother:=rs1');
   		if i<>numofreltrees then 
   			begin
   			writeln(newdecof1,';');
   			writeln(newdecof1,'rs2:=rs1;')
   			end
   		else writeln(newdecof1)
   		end;
   	    writeln(newdecof1,'end;')
            end;
          begin{modelproc}
   	  writeln(newdecof1,'procedure createinputmodel',treenumber:1,
   					'(var s:LSSTREE_pStree);');
   	  writeln(newdecof1,'var');
   	  writeln(newdecof1,'   rs:LSSTREE_pRelNode;');
   	  if s1^.modelfield^.nonemptyreltreelist then
   		begin
   		reltreelisttree:=s1^.sonlist^.brother^.brother^.node;
  		reltreelistproc(reltreelisttree)
   		end;
   	  writeln(newdecof1,'begin{createinputmodel',treenumber:1,'}');
          nodedescriptionproc(s1^.sonlist^.node);
          if s1^.modelfield^.nonemptyreltreelist then
   	     begin
   	     writeln(newdecof1,'createreltreelist(rs);');
   	     writeln(newdecof1,'s^.sons:=rs;');
             IF reltreelisttree^.reltreelistfield^.variable THEN
               BEGIN
               writeln(newdecof1,'s^.li^.n:=numberofelements(rs)');
               END
             ELSE
             writeln(newdecof1,'s^.li^.n:=',
                     reltreelisttree^.reltreelistfield^.numberofsons);

   	     end
   	  else if not(s1^.sonlist^.node^.nodedescriptionfield^.variable) then 
             BEGIN
    	     writeln(newdecof1,'s^.sons:=nil;');
             writeln(newdecof1,'s^.li^.n:=0');
             END;
   	  writeln(newdecof1,'end;')
          end;
        begin{inputmodelsproc}
   	writeln(newdecof1);
        write(newdecof1,'procedure createinputmodels(');
   	i:=0;
   	while i<>numberofinputmodels do
   		begin
   		i:=i+1;
   		write(newdecof1,'var s',i:1,':LSSTREE_pStree');
   		if i<>numberofinputmodels then write(newdecof1,';')
   		end;
        writeln(newdecof1,');');
        i:=0;
        rsnode1:=s1^.sonlist^.brother^.brother;
        modeltree:=rsnode1^.node;
   	while i<>numberofinputmodels do
   		begin
   		i:=i+1;
   	        modelproc(modeltree,i);
                if i<>numberofinputmodels then 
   			begin
   			rsnode1:=rsnode1^.brother^.brother^.brother;
   			modeltree:=rsnode1^.node
   			end;
   		end;
   	writeln(newdecof1,'begin{createinputmodels}');
   	i:=0;
   	while i<>numberofinputmodels do
   		begin
   		i:=i+1;
   		write(newdecof1,'createinputmodel',i:1,'(s',i:1,')');
   		if i<>numberofinputmodels then writeln(newdecof1,';')
   		end;
        writeln(newdecof1);
   	writeln(newdecof1,'end;')
        end;

      begin{modelsproc}
      inputmodelstree:=s1^.sonlist^.node;
      outputmodeltree:=s1^.sonlist^.brother^.node;
      outputmodelproc(outputmodeltree);
      inputmodelsproc(inputmodelstree)
      end;
      procedure capairsproc(s1:LEXCOMDECL_psnode;indentlevel:INTEGER);
      var conditiontree,capairstree,actiontree:LEXCOMDECL_psnode;
          i,j,numberofsoncas:INTEGER;
          rsnode1:LEXCOMDECL_prsnode;

        procedure conditionproc(s1:LEXCOMDECL_psnode;indentlevel:INTEGER);
        var i,numberofconds:INTEGER;
            rsnode1:LEXCOMDECL_prsnode;
            pascaltree:LEXCOMDECL_psnode;
          procedure pascalproc(s1:LEXCOMDECL_psnode);
   	  var i,j:INTEGER;
              ch:char;
          begin{pascalproc}
   	  if length(s1^.pascalfield^.stringfield)<80 then 
          write(newdecof1,s1^.pascalfield^.stringfield)
          else
   		begin
   		i:=0;
                j:=0;
   		while i<>length(s1^.pascalfield^.stringfield) do
   			begin
   			i:=i+1;
                        j:=j+1;
   			ch:= s1^.pascalfield^.stringfield[i];
   			if (j>25) and (ch=' ') then 
   					begin
   					writeln(newdecof1);
   					write(newdecof1,'                 ');
   					j:=0
   					end;
   			write(newdecof1,ch)
   			end
   		end
          end;
        begin{conditionproc}
        numberofconds:=s1^.conditionfield^.numberofconditions;
        i:=1;
        rsnode1:=s1^.sonlist^.brother^.brother;
        pascaltree:=rsnode1^.node;
        pascalproc(pascaltree);
        while i<>numberofconds do
   		begin
   		i:=i+1;
   		if s1^.conditionfield^.andcond then
   			begin
   	   		writeln(newdecof1,' then');
   			writetab(newdecof1,indentlevel+i);
   			write(newdecof1,'if ')
   			end
   		else
   			begin
   			writeln(newdecof1);
   			writetab(newdecof1,indentlevel+i);
   			write(newdecof1,'or')
   			end;
   		rsnode1:=rsnode1^.brother^.brother;
   		pascaltree:=rsnode1^.node;
   		pascalproc(pascaltree)
   		end
        end;
        procedure actionproc(s1:LEXCOMDECL_psnode;indentlevel:INTEGER);
        var pascaltree:LEXCOMDECL_psnode;
            rsnode1:LEXCOMDECL_prsnode;
            i,numberofacts:INTEGER;
          procedure pascalproc(s1:LEXCOMDECL_psnode);
   	  var i,j:INTEGER;
              ch:char;
          begin{pascalproc}
   	  if length(s1^.pascalfield^.stringfield)<80 then 
          write(newdecof1,s1^.pascalfield^.stringfield)
          else
   		begin
   		i:=0;
                j:=0;
   		while i<>length(s1^.pascalfield^.stringfield) do
   			begin
   			i:=i+1;
                        j:=j+1;
   			ch:= s1^.pascalfield^.stringfield[i];
   			if (j>25) and (ch=' ') then 
   					begin
   					writeln(newdecof1);
   					write(newdecof1,'                 ');
   					j:=0
   					end;
   			write(newdecof1,ch)
   			end
   		end
          end;
        begin{actionproc}
        numberofacts:=s1^.actionfield^.numberofactions;
   	if numberofacts<>0 then
   		begin
   		i:=1;
   		rsnode1:=s1^.sonlist^.brother^.brother;
   		pascaltree:=rsnode1^.node;
   		writetab(newdecof1,indentlevel);
   		pascalproc(pascaltree);
   		while i<>numberofacts do
   			begin
   			i:=i+1;
   			writeln(newdecof1,';');
   			writetab(newdecof1,indentlevel);
   			rsnode1:=rsnode1^.brother^.brother;
   			pascaltree:=rsnode1^.node;
   			pascalproc(pascaltree)
   			end
   		end
        else
   		begin
   		writetab(newdecof1,indentlevel);
   		write(newdecof1,'skip')
   		end
        end;
      begin{capairsproc}
      numberofsoncas:=s1^.capairsfield^.numofcas;
      i:=0;
      rsnode1:=s1^.sonlist;
      while i<>numberofsoncas do
   	begin
        i:=i+1;
        writetab(newdecof1,indentlevel);
   	write(newdecof1,'IF ');
        conditiontree:=rsnode1^.node;
        conditionproc(conditiontree,indentlevel);
        writeln(newdecof1,' THEN');
   	writetab(newdecof1,indentlevel+1);
   	writeln(newdecof1,'BEGIN');
        rsnode1:=rsnode1^.brother;
        if rsnode1^.node^.cat=capairs then 
   		begin
   		capairstree:=rsnode1^.node;
                capairsproc(capairstree,indentlevel+1);
                rsnode1:=rsnode1^.brother;
                level:=indentlevel+1;
                writetab(newdecof1,indentlevel+1);
                writeln(newdecof1,'if success and (level=',level:1,') then');
                writetab(newdecof1,indentlevel+1);
                writeln(newdecof1,'  begin');
                writetab(newdecof1,indentlevel+1);
                writeln(newdecof1,'level:=',indentlevel:1,';')
   		end
        else 
   		begin
   		writetab(newdecof1,indentlevel+1);
                writeln(newdecof1,'if success then againsuccess:=true;');
                writetab(newdecof1,indentlevel+1);
                writeln(newdecof1,'downcount:=downcount-1;');
                writetab(newdecof1,indentlevel+1);
                writeln(newdecof1,'if downcount=0 then');
   		writetab(newdecof1,indentlevel+1);
                writeln(newdecof1,'  begin');
                writetab(newdecof1,indentlevel+1);
                writeln(newdecof1,'  success:=true;');
                writetab(newdecof1,indentlevel+1);
                writeln(newdecof1,'  level:=',indentlevel:1,';');
                writetab(newdecof1,indentlevel+1);
   		write(newdecof1,'  createinputmodels(');
   		j:=0;
   		while j<>numberofinputmodels do
   			begin
   			j:=j+1;
   			write(newdecof1,'s',j:1);
   			if numberofinputmodels<>j then write(newdecof1,',')
   			end;
   		writeln(newdecof1,');');
   		end;
        actiontree:=rsnode1^.node;
        actionproc(actiontree,indentlevel+2);
   	writeln(newdecof1);
   	writetab(newdecof1,indentlevel+1);
        writeln(newdecof1,'  end');
        writetab(newdecof1,indentlevel+1);
   	writeln(newdecof1,'END;');
   	if i<>numberofsoncas then rsnode1:=rsnode1^.brother
        end
      end;
   
    begin{uttproc}
    write(newdecof1,'FUNCTION dec');
    write(newdecof1,s1^.sonlist^.node^.rulenamefield^.rulename,'(');
    modelstree:=s1^.sonlist^.brother^.node;
    if s1^.sonlist^.brother^.brother^.node^.cat=comp then
    capairstree:=s1^.sonlist^.brother^.brother^.brother^.brother^.brother^.node
    else capairstree:=s1^.sonlist^.brother^.brother^.brother^.node;
    numberofinputmodels:=
   		   modelstree^.sonlist^.node^.inputmodelsfield^.numberofmodels;
    writeln(newdecof1,'Is:LISTREE_pStree)');
    writeln(newdecof1,'                          :LISTREE_SetOfTupleOfStrees;');
    writeln(newdecof1,'VAR');
    basictrees1:=basictrees;
    while LEXCOMRULES_stillrecords(basictrees1) do
      begin
      LEXCOMRULES_takerecord(tempstring,basictrees1);
      writeln(newdecof1,tempstring,':LSSTREE_pstree;');
      end;
    writeln(newdecof1,'   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;');
    writeln(newdecof1,'   match,success,againsuccess:BOOLEAN;');
    writeln(newdecof1,'   result:LISTREE_SetOfTupleOfStrees;');
    writeln(newdecof1,'   tuple:LISTREE_TupleOfStrees;');
    writeln(newdecof1,'   hulpint:INTEGER;');
    writeln(newdecof1,'   hulpstree:LISTREE_pStree;');
    writeln(newdecof1,'   s:LSSTREE_pStree;');
    writeln(newdecof1,'   downcount,level,numberofsuccesses:INTEGER;');
    i:=0;
    while i<>numberofinputmodels do
      begin
      i:=i+1;
      writeln(newdecof1,'   Is',i:1,':LISTREE_pStree;')
      end;
    i:=0;
    while i<>numberofinputmodels do
      begin
      i:=i+1;
      writeln(newdecof1,'   s',i:1,':LSSTREE_pStree;')
      end;
    rightrecords2:=rightrecords1;
    while LEXCOMRULES_stillrecords(rightrecords2) do
   	begin
   	LEXCOMRULES_takerecord(record1,rightrecords2);
        i:=0;
        STRING_constantempty(catname);
        while i<> (length(record1)-4) do
   		begin
   		i:=i+1;
   		STRING_appendchar(catname,catname,record1[i])
   		end;
        catrecname:=ldstrtostr_cattorectype(catname);
        writeln(newdecof1,'   ',record1,':LSDOMAINT_',
                                         catrecname:STRING_length(catrecname),';')
   	end;
    leftrecords2:=leftrecords1;
    while LEXCOMRULES_stillrecords(leftrecords2) do
   	begin
   	LEXCOMRULES_takerecord(record1,leftrecords2);
   	i:=0;
        set_length(catname,0);
   	while i<>(length(record1)-4) do
   		begin
   		i:=i+1;
                set_length(catname,length(catname)+1);
                catname[i]:=record1[i]
   		end;
        write(newdecof1,'    ',catname,'_rec');
   	write(newdecof1,record1[length(record1)]);
        catrecname:=ldstrtostr_cattorectype(catname);
   	writeln(newdecof1,':','LSDOMAINT_p',catrecname:STRING_length(catrecname),';')
   	end;
    modelsproc(modelstree);
    writeln(newdecof1);
    writeln(newdecof1,'begin{main body}');
    i:=0;
    while i<>numberofinputmodels do
   	begin
   	i:=i+1;
   	writeln(newdecof1,'s',i:1,':=nil;');
   	end;
    writeln(newdecof1,'s:=loopholes.retype(Is,LSSTREE_pStree);');
    writeln(newdecof1,'match:=true;');
    writeln(newdecof1,'againsuccess:=true;');
    writeln(newdecof1,'numberofsuccesses:=0;');
    writeln(newdecof1,'LISTREE_initSetOfTupleofStrees(result);');
    writeln(newdecof1,'modelproc(s,match);');
    writeln(newdecof1,'WHILE againsuccess DO');
    writeln(newdecof1,'  BEGIN');
    writeln(newdecof1,'  againsuccess:=false;');
    writeln(newdecof1,'  numberofsuccesses:=numberofsuccesses+1;');
    writeln(newdecof1,'  level:=0;');
    writeln(newdecof1,'  success:=false;');
    writeln(newdecof1,'  downcount:=numberofsuccesses;');
    writeln(newdecof1,'  if match then');
    writeln(newdecof1,'    begin');
    capairsproc(capairstree,2);
    writeln(newdecof1,'    skip');
    writeln(newdecof1,'    end;');
    writeln(newdecof1,'  if success then');
    writeln(newdecof1,'    begin');
    writeln(newdecof1,'    LISTREE_emptytuple(tuple);');
    i:=0;
    while i<>numberofinputmodels do
 	begin
        i:=i+1;
        writeln(newdecof1,'    Is',i:1,':=loopholes.retype(s',i:1,',LISTREE_pStree);');
        writeln(newdecof1,
                   '    LISTREE_addtotuple(Is',i:1,',tuple);')
        end;
    writeln(newdecof1,
                '    LISTREE_appendtupleofstrees(tuple,result)');
    writeln(newdecof1,'    end');
    writeln(newdecof1,'  END;');
    writeln(newdecof1,'dec',s1^.sonlist^.node^.rulenamefield^.rulename,
   								':=result');
    writeln(newdecof1,'end;')
    end;    

  begin
  writeln(newdecof1);
  writeln(newdecof1,'{rule:}');
  writeln(newdecof1,'{:',stree1^.sonlist^.node^.rulenamefield^.rulename,'}');
  uttproc(stree1);
  writeln(newdecof1,'{:',stree1^.sonlist^.node^.rulenamefield^.rulename,'}')
  end;

  procedure mergebasictrees;
  var table:LEXCOMDECL_setofrecords;
      treename:LEXCOMDECL_string;
  function present(str:STRING_string;table:LEXCOMDECL_setofrecords):BOOLEAN;
  VAR found:boolean;
      treename:LEXCOMDECL_string;
  begin
  found:=false;
  while LEXCOMRULES_stillrecords(table) and not(found) do
    begin
    LEXCOMRULES_takerecord(treename,table);
    found:=(STRING_compare(treename,str)=0)
    end;
  present:=found;
  end;
  begin
  table:=basictrees;
  initsetofrecords(basictrees);
  while LEXCOMRULES_stillrecords(table) do
    begin
    LEXCOMRULES_takerecord(treename,table);
    if not present(treename,basictrees) then
      LEXCOMRULES_appendrecord(treename,basictrees);
    end;
  end;
begin{writerulecode}
leftrecords1:=LEXCOMRULES_leftrecords;
rightrecords1:=LEXCOMRULES_rightrecords;
basictrees:=LEXCOMRULES_basictrees;
mergebasictrees;
writecomcode(stree1,compas1);
writeln(compas1);
writedecomcode(stree1,decompas1);
writeln(decompas1)
end;

procedure LEXCOMCODE_writeintercode(rulenaam:LEXCOMDECL_string;stree1:LEXCOMDECL_psnode;
                              var comenv1:text;var decomenv1:text);

  procedure writecode(stree1:LEXCOMDECL_psnode;var env1:text;var env2:text);
  var modelstree,capairstree:LEXCOMDECL_psnode;
      i,numberofinputmodels:INTEGER;
    procedure uttproc(s1:LEXCOMDECL_psnode);
      procedure modelsproc(s1:LEXCOMDECL_psnode);
        var inputmodelstree,outputmodeltree:LEXCOMDECL_psnode;
            i,numberofinputmodels:INTEGER;
            rsnode1:LEXCOMDECL_prsnode;
            catname1:LEXCOMDECL_psnode;
        begin{modelsproc}
        inputmodelstree:=s1^.sonlist^.node;
        outputmodeltree:=s1^.sonlist^.brother^.node;
        numberofinputmodels:=inputmodelstree^.inputmodelsfield^.numberofmodels;
        writeln(env1,numberofinputmodels:1);
        i:=0;
	rsnode1:=inputmodelstree^.sonlist^.brother^.brother;
        while i<>numberofinputmodels do
   		begin
   		i:=i+1;
                catname1:=rsnode1^.node^.sonlist^.node^.sonlist^.node;
                writeln(env1,catname1^.catnamefield^.catfield);
   		if i<>numberofinputmodels then
   			rsnode1:=rsnode1^.brother^.brother^.brother
   		end;
        rsnode1:=outputmodeltree^.sonlist^.brother^.brother;
        catname1:=rsnode1^.node^.sonlist^.node^.sonlist^.node;
        writeln(env1,catname1^.catnamefield^.catfield)
        end;
      procedure capairsproc(s1:LEXCOMDECL_psnode);
        begin{for 'preconditions on tree node' (for decomp. (idiom) M-rules)}
        end;
    begin{uttproc}
    write(env1,'FUNCTION com');
    write(env1,s1^.sonlist^.node^.rulenamefield^.rulename,'(');
    modelstree:=s1^.sonlist^.brother^.node;
    capairstree:=s1^.sonlist^.brother^.brother^.brother^.node;
    numberofinputmodels:=
   		   modelstree^.sonlist^.node^.inputmodelsfield^.numberofmodels;
    i:=1;
    write(env1,'Is1');
    while i<>numberofinputmodels do
      begin
      i:=i+1;
      write(env1,',','Is',i:1);
      end;
    writeln(env1,':LISTREE_pStree)');
    writeln(env1,'                                 :LISTREE_SetOfStrees;');
    writeln(env1,'EXTERNAL;');
    writeln(env1,'{*');
    writeln(env1,s1^.sonlist^.node^.rulenamefield^.rulename);
    modelsproc(modelstree);
    writeln(env1,'}');
    write(env2,'FUNCTION dec');
    write(env2,s1^.sonlist^.node^.rulenamefield^.rulename,'(');
    modelstree:=s1^.sonlist^.brother^.node;
    if s1^.sonlist^.brother^.brother^.node^.cat=comp then
    capairstree:=s1^.sonlist^.brother^.brother^.brother^.brother^.brother^.node
    else capairstree:=s1^.sonlist^.brother^.brother^.brother^.node;
    numberofinputmodels:=
   		   modelstree^.sonlist^.node^.inputmodelsfield^.numberofmodels;
    writeln(env2,'Is:LISTREE_pStree)');
    writeln(env2,'                          :LISTREE_SetOfTupleOfStrees;');
    writeln(env2,'EXTERNAL;')
    end;
  begin
  writeln(env1);
  writeln(env1,'{rule:}');
  writeln(env1,'{:',stree1^.sonlist^.node^.rulenamefield^.rulename,'}');
  uttproc(stree1);
  writeln(env1,'{:',stree1^.sonlist^.node^.rulenamefield^.rulename,'}');
  writeln(env1)
  end;

begin{writeintercode}
writecode(stree1,comenv1,decomenv1)
end;


