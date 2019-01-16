     /* =================================================================== */
     /*                                                                     */
     /*  Documentation:                                                     */
     /*                                                                     */
     /*  Utility . . . : WHOAMI                                             */
     /*  Object  . . . : WHOAMI     (*CMD)                                  */
     /*  Source member : WHOAMIC1                                           */
     /*  Source type . : CMD                                                */
     /*  Description   : Who am I                                           */
     /*  Author  . . . : Thomas Raddatz   <thomas.raddatz@tools400.de>      */
     /*  Created . . . : 25.01.2017                                         */
     /*                                                                     */
     /* =================================================================== */
     /*                                                                     */
     /*  This software is free software, you can redistribute it and/or     */
     /*  modify it under the terms of the GNU General Public License (GPL)  */
     /*  as published by the Free Software Foundation.                      */
     /*                                                                     */
     /*  See GNU General Public License for details.                        */
     /*          http://www.opensource.org                                  */
     /*          http://www.opensource.org/licenses/gpl-license.html        */
     /*                                                                     */
     /* =================================================================== */
     /*  History:                                                           */
     /*                                                                     */
     /*  Datum       Name          Change                                   */
     /*  ----------  ------------  ---------------------------------------  */
     /*                                                                     */
     /* =================================================================== */
     /* STRPREPRC Compile Options:                                          */
     /*   >>PRE-COMPILER<<                                                  */
     /*     >>CRTCMD<<    CRTCMD   CMD(&LI/WHOAMI) +                        */
     /*                              SRCFILE(&SL/&SF) SRCMBR(&SM);          */
     /*     >>IMPORTANT<<                                                   */
     /*         >>PARM<<   PGM(&LI/WHOAMI);                                 */
     /*         >>PARM<<   HLPPNLGRP(&LI/WHOAMI);                           */
     /*         >>PARM<<   HLPID(WHOAMI);                                   */
     /*     >>END-IMPORTANT<<                                               */
     /*     >>EXECUTE<<                                                     */
     /*   >>END-PRE-COMPILER<<                                              */
     /* =================================================================== */
             CMD        PROMPT('Who am I?')
