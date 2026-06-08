/* -------------------------------------------------------------------------- */
/* WHOAMI     - SCRIPT MEMBER                                                 */
/* Use commands  xmlgenINC (generate text for install pgm)                    */
/*               xmlgenMBR (to define source members                          */
/*               xmlgenCMD (execute qcmdexc at run time                       */
/* Put &TOLIB where you want user selected lib at run time.                   */
   DCL &TOLIB *CHAR 10
/* -------------------------------------------------------------------------- */
/* >>PRE-COMPILER<<                                                           */
/*   >>CRTCMD<<  XMLGEN  XMLSCRIPT(&SM) SCRIPTSRCF(&SL/&SF);                  */
/*   >>IMPORTANT<<                                                            */
/*     >>PARM<<  SRCTOFILE(&LI/QXML);                                         */
/*     >>PARM<<  XMLMBR(*SCRIPT);                                             */
/*     >>PARM<<  ENCODING('ISO-8859-1');                                      */
/*     >>PARM<<  AUTHOR('Thomas Raddatz');                                    */
/*   >>END-IMPORTANT<<                                                        */
/*   >>EXECUTE<<                                                              */
/* >>END-PRE-COMPILER<<                                                       */
/* -------------------------------------------------------------------------- */
             XMLGENINC  XINCLUDE(*YES)

             XMLGENVRS XSRCFILE(QWHOAMI) XSRCLIB(WHOAMID) XSRCMBR(COPYRIGHT)

             XMLGENSET  XVAR(&SRCFILE) XVALUE(QWHOAMI)

/* ---------------------------------- */
/*  Deploy source member              */
/* ---------------------------------- */
             XMLGENMBR  XMBR(A_INSTALL ) XMBRATR(CLLE  ) +
                          XFROMSRCF(QWHOAMI   ) XFROMSRCL(WHOAMID) +
                          XTOSRCF(QWHOAMI   ) XOBJTYPE(*FILE  ) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(A_README  ) XMBRATR(TXT) +
                          XFROMSRCF(QWHOAMI   ) XFROMSRCL(WHOAMID) +
                          XTOSRCF(QWHOAMI   ) XOBJTYPE(*PGM) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(COPYRIGHT ) XMBRATR(RPGLE ) +
                          XFROMSRCF(QWHOAMI   ) XFROMSRCL(WHOAMID) +
                          XTOSRCF(QWHOAMI   ) XOBJTYPE(*FILE  ) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(WHOAMI    ) XMBRATR(CMD   ) +
                          XFROMSRCF(QWHOAMI   ) XFROMSRCL(WHOAMID) +
                          XTOSRCF(QWHOAMI   ) XOBJTYPE(*FILE  ) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(WHOAMIP   ) XMBRATR(PNLGRP) +
                          XFROMSRCF(QWHOAMI   ) XFROMSRCL(WHOAMID) +
                          XTOSRCF(QWHOAMI   ) XOBJTYPE(*FILE  ) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(WHOAMICPP ) XMBRATR(RPGLE ) +
                          XFROMSRCF(QWHOAMI   ) XFROMSRCL(WHOAMID) +
                          XTOSRCF(QWHOAMI   ) XOBJTYPE(*FILE  ) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(WHOAMICPP ) XMBRATR(MAKPGM ) +
                          XFROMSRCF(QWHOAMI   ) XFROMSRCL(WHOAMID) +
                          XTOSRCF(QWHOAMI   ) XOBJTYPE(*FILE  ) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

/* ---------------------------------- */
/*  Create objects                    */
/* ---------------------------------- */
             XMLGENCMD  XCMD(CRTBNDCL PGM(&TOLIB/A_INSTALL) +
                          SRCFILE(&TOLIB/QWHOAMI) SRCMBR(*PGM) +
                          DFTACTGRP(*NO) ACTGRP(*NEW) +
                          DBGVIEW(*LIST)) XDLTSPLF(A_INSTALL)

             XMLGENCMD  XCMD(CALL PGM(&TOLIB/A_INSTALL) +
                             PARM('&TGTRLS' '&SRCFILE' '&TOLIB'))
             XMLGENCMD  XCMD(DLTPGM PGM(&TOLIB/A_INSTALL))

