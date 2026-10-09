#-----------------------------------------------------------------------
#  Utility . . . : WHOAMI
#  Description   : Builds the WHOAMI utility from the IFS of an IBM i.
#  Author  . . . : Thomas Raddatz   <thomas.raddatz@tools400.de>
#
#  Usage:
#
#    gmake                   Builds all objects into library $(BIN_LIB)
#    gmake BIN_LIB=MYLIB     Builds all objects into library MYLIB
#    gmake clean             Deletes the objects of the utility
#    gmake erase             Deletes the whole target library
#
#  Call gmake from the root directory of the project, because the
#  source paths are specified relative to the current directory.
#
#  This makefile is the IFS equivalent of QWHOAMI/A_INSTALL.CLLE.
#-----------------------------------------------------------------------

NAME=Who am I - A tools400 utility
BIN_LIB=WHOAMI
SRCDIR=QWHOAMI

CPP_PGM=WHOAMICPP
HLP_PNLGRP=WHOAMIP

#  Temporary source file for sources that cannot be compiled from the
#  IFS. Deliberately not named QSOURCE, so that an existing source file
#  of the target library can never be deleted by 'cleanup' or 'clean'.
TMP_SRCF=QGMAKESRC

DBGVIEW=*LIST
TGTRLS=*CURRENT
TGTCCSID=*JOB

#-----------------------------------------------------------------------
#  Objects
#-----------------------------------------------------------------------

all: $(BIN_LIB).lib WHOAMICPP.RPGLE WHOAMIP.PNLGRP WHOAMI.CMD cleanup
	@echo "Built all"

#  The command needs the command processing program and the help panel
#  group, hence it is built last.
WHOAMI.CMD: WHOAMICPP.RPGLE WHOAMIP.PNLGRP

#-----------------------------------------------------------------------
#  Rules
#
#  Commands that would fail because an object already exists or does not
#  exist yet are guarded with "test" on the /QSYS.lib view. A failing
#  "system" call dies from a signal, and the shell then prints
#  "IOT/Abort trap" no matter how the output is redirected, so the call
#  has to be avoided instead of silenced.
#-----------------------------------------------------------------------

#  DEFINE(IFS_BUILD) switches the source over to the IFS copy book
#  "/include 'COPYRIGHT.RPGLE'", which INCDIR resolves in $(SRCDIR).
#  Without it the compiler resolves "/include QWHOAMI,COPYRIGHT" through
#  the library list and silently picks up a QWHOAMI source file of
#  another library instead of the sources of this repository.
%.RPGLE:
	system "CRTBNDRPG PGM($(BIN_LIB)/$*) SRCSTMF('$(SRCDIR)/$*.RPGLE') INCDIR('$(SRCDIR)') DEFINE(IFS_BUILD) TEXT('$(NAME)') REPLACE(*YES) DBGVIEW($(DBGVIEW)) TRUNCNBR(*NO) DFTACTGRP(*NO) ACTGRP(*NEW) TGTRLS($(TGTRLS)) TGTCCSID($(TGTCCSID))"

#  CRTPNLGRP does not support stream files, therefore the source is
#  copied to a temporary source file member first. CPYFRMSTMF creates
#  the member itself, it does not have to exist.
%.PNLGRP:
	system "CPYFRMSTMF FROMSTMF('$(SRCDIR)/$*.PNLGRP') TOMBR('/QSYS.lib/$(BIN_LIB).lib/$(TMP_SRCF).file/$*.mbr') MBROPT(*REPLACE)"
	system "CRTPNLGRP PNLGRP($(BIN_LIB)/$*) SRCFILE($(BIN_LIB)/$(TMP_SRCF)) SRCMBR($*) REPLACE(*YES) TEXT('$(NAME)')"

#  CRTCMD has no REPLACE parameter, hence the command is deleted first.
%.CMD:
	! test -e /QSYS.lib/$(BIN_LIB).lib/$*.CMD || system "DLTCMD CMD($(BIN_LIB)/$*)"
	system "CRTCMD CMD($(BIN_LIB)/$*) PGM($(BIN_LIB)/$(CPP_PGM)) SRCSTMF('$(SRCDIR)/$*.CMD') TEXT('$(NAME)') HLPPNLGRP($(BIN_LIB)/$(HLP_PNLGRP)) HLPID($*)"

%.lib:
	test -d /QSYS.lib/$*.lib || system "CRTLIB LIB($*) TEXT('$(NAME)')"
	test -e /QSYS.lib/$*.lib/$(TMP_SRCF).FILE || system "CRTSRCPF FILE($*/$(TMP_SRCF)) RCDLEN(112) TEXT('Temporary source file, used by gmake')"

#-----------------------------------------------------------------------
#  Housekeeping
#-----------------------------------------------------------------------

cleanup:
	! test -e /QSYS.lib/$(BIN_LIB).lib/$(TMP_SRCF).FILE || system "DLTF FILE($(BIN_LIB)/$(TMP_SRCF))"

clean:
	! test -e /QSYS.lib/$(BIN_LIB).lib/WHOAMI.CMD || system "DLTCMD CMD($(BIN_LIB)/WHOAMI)"
	! test -e /QSYS.lib/$(BIN_LIB).lib/$(CPP_PGM).PGM || system "DLTPGM PGM($(BIN_LIB)/$(CPP_PGM))"
	! test -e /QSYS.lib/$(BIN_LIB).lib/$(HLP_PNLGRP).PNLGRP || system "DLTPNLGRP PNLGRP($(BIN_LIB)/$(HLP_PNLGRP))"
	! test -e /QSYS.lib/$(BIN_LIB).lib/$(TMP_SRCF).FILE || system "DLTF FILE($(BIN_LIB)/$(TMP_SRCF))"

erase:
	! test -d /QSYS.lib/$(BIN_LIB).lib || system "DLTLIB LIB($(BIN_LIB))"
