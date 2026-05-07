!!! List the integration targets of this component

Integrate_ACTIONS : 
   MMS /DESCRIPTION="''rbs_archive_root'.''rbs_release']descrip.rbs" -
          $(MMSQUALIFIERS) -
          /OUTPUT="''rbs_user_root'.''rbs_release']actions_dutch.rbs" -
          /MACRO=("language=DUTCH") Integrate_2
   @'rbs_user_root'.'rbs_release']actions_dutch.rbs
   MMS /DESCRIPTION="''rbs_archive_root'.''rbs_release']descrip.rbs" -
          $(MMSQUALIFIERS) -
          /OUTPUT="''rbs_user_root'.''rbs_release']actions_english.rbs" -
          /MACRO=("language=ENGLISH") Integrate_2
   @'rbs_user_root'.'rbs_release']actions_english.rbs
   MMS /DESCRIPTION="''rbs_archive_root'.''rbs_release']descrip.rbs" -
          $(MMSQUALIFIERS) -
          /OUTPUT="''rbs_user_root'.''rbs_release']actions_spanish.rbs" -
          /MACRO=("language=SPANISH") Integrate_2
   @'rbs_user_root'.'rbs_release']actions_spanish.rbs


Integrate_2 : Integrate_ACTIONS_2,-
              Integrate_TOOLS_2,-
              Integrate_GENERAL_2,-
              Integrate_INTERLINGUA_2,-
              Integrate_LEXICON_2,-
              Integrate_DOC_2,-
              Integrate_VMS_2,-
              Integrate_DUTCH_2,-
              Integrate_ENGLISH_2,-
              Integrate_SPANISH_2
   @ ! no action needed


Integrate_ACTIONS_2 : ACTIONS:unpack.exe,-
                      ACTIONS:pack.exe,-
                      editor, -
                      keys
   @ ! no action needed

.SUFFIXES


.FIRST
   @ oldver = F$VERIFY(actions_verify)
   @ actions_cpu_begin_$(language) = F$GETJPI("","CPUTIM")
   @ IF F$TRNLNM("LANGUAGE").NES."" THEN DEASSIGN language
   @ ASSIGN $(language) language
   @ actions_dom_$(language)_lsdomaint  == ""
   @ actions_auxdom_$(language)_lsauxdomain  == ""
   @ actions_lex_$(language)_lexrules1  == ""
   @ actions_lex_$(language)_lexrules2  == ""
   @ actions_lex_$(language)_lexrules3  == ""
   @ actions_seg_$(language)_suffix     == ""
   @ actions_seg_$(language)_prefix     == ""
   @ actions_seg_$(language)_glue       == ""
   @ actions_sur_$(language)_surfrules  == ""
   @ actions_mrudom_TOOLS_mrucom        == ""
   @ actions_mrusur_TOOLS_mrucom        == ""
   @ actions_mrudom_TOOLS_afxpr     == ""
   @ actions_afxprsur_TOOLS_afxpr   == ""
   @ actions_mrudom_TOOLS_auxcom        == ""
   @ actions_auxsur_TOOLS_auxcom        == ""
   @ actions_mrudom_TOOLS_surcom        == ""
   @ actions_sursur_TOOLS_surcom        == ""
   @ actions_mrudom_TOOLS_msurcom        == ""
   @ actions_msursur_TOOLS_msurcom        == ""
   @ actions_actbld_toggle             == ""
.LAST
   @ IF F$TRNLNM("LANGUAGE").NES."" THEN DEASSIGN language
   @ actions_dom_$(language)_lsdomaint  == ""
   @ actions_auxdom_$(language)_lsauxdomain  == ""
   @ actions_lex_$(language)_lexrules1  == ""
   @ actions_lex_$(language)_lexrules2  == ""
   @ actions_lex_$(language)_lexrules3  == ""
   @ actions_seg_$(language)_suffix     == ""
   @ actions_seg_$(language)_prefix     == ""
   @ actions_seg_$(language)_glue       == ""
   @ actions_sur_$(language)_surfrules  == ""
   @ actions_mrudom_TOOLS_mrucom        == ""
   @ actions_mrusur_TOOLS_mrucom        == ""
   @ actions_mrudom_TOOLS_afxpr     == ""
   @ actions_afxprsur_TOOLS_afxpr   == ""
   @ actions_mrudom_TOOLS_auxcom        == ""
   @ actions_auxsur_TOOLS_auxcom        == ""
   @ actions_mrudom_TOOLS_surcom        == ""
   @ actions_sursur_TOOLS_surcom        == ""
   @ actions_mrudom_TOOLS_msurcom        == ""
   @ actions_msursur_TOOLS_msurcom        == ""
   @ actions_cpu_begin_$(language) = F$GETJPI("","CPUTIM") - actions_cpu_begin_$(language)
   @ actions_cpu_begin_$(language) = (actions_cpu_begin_$(language) + 50) / 100
   @ oldver = F$VERIFY(oldver)

!!! include the description files of the parts of this component

!.INCLUDE actions:TeX

!!! the dependencies of this component

!$(target) : $(sources)
!   $(action)

!!!

ACTIONS:pack.exe : ACTIONS:pack.opt
   @actions:opt ACTIONS pack

ACTIONS:pack.opt : ACTIONS:pack.obj, -
                   GENERAL:Files.opt, -
                   GENERAL:Str.opt
   @actions:obj ACTIONS ACTIONS pack
   @actions:merge_opt ACTIONS pack GENERAL Files
   @actions:merge_opt ACTIONS pack GENERAL Str

ACTIONS:pack.obj : ACTIONS:pack.pas, -
                   GENERAL:Files.pen, -
                   GENERAL:Str.pen
   @actions:pas ACTIONS pack

!!!

ACTIONS:unpack.exe : ACTIONS:unpack.opt
   @actions:opt ACTIONS unpack

ACTIONS:unpack.opt : ACTIONS:unpack.obj, -
                     GENERAL:Files.opt, -
                     GENERAL:Str.opt
   @actions:obj ACTIONS ACTIONS unpack
   @actions:merge_opt ACTIONS unpack GENERAL Files
   @actions:merge_opt ACTIONS unpack GENERAL Str

ACTIONS:unpack.obj : ACTIONS:unpack.pas, -
                     GENERAL:Files.pen, -
                     GENERAL:Str.pen
   @actions:pas ACTIONS unpack

!!!

keys : ACTIONS:setkeys.hlp
   @actions:hlp ACTIONS setkeys

!!!

editor : ACTIONS:edtini.edt, ACTIONS:edtini.hlp,-
         ACTIONS:lia.edt, ACTIONS:lia.hlp,-
         ACTIONS:mrule.edt, ACTIONS:mrule.hlp,-
         ACTIONS:env.edt, ACTIONS:env.hlp,-
         ACTIONS:pas.edt, ACTIONS:pas.hlp,-
         ACTIONS:tex.edt, ACTIONS:tex.hlp,-
         ACTIONS:dict.edt, ACTIONS:dict.hlp,-
         ACTIONS:sur.edt, ACTIONS:sur.hlp
   @actions:edt ACTIONS edtini
   @actions:edt ACTIONS lia
   @actions:edt ACTIONS mrule
   @actions:edt ACTIONS env
   @actions:edt ACTIONS pas
   @actions:edt ACTIONS tex
   @actions:edt ACTIONS dict
   @actions:edt ACTIONS sur

!!!
