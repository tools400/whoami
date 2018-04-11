**free
     // =================================================================== *
     //                                                                     *
     //  Documentation:                                                     *
     //                                                                     *
     //  Utility . . . : WHOAMI                                             *
     //  Object  . . . : WHOAMIM1   (*MODULE)                               *
     //  Source member : WHOAMIC1                                           *
     //  Source type . : RPGLE                                              *
     //  Description   : Who am I - CPP                                     *
     //  Author  . . . : Thomas Raddatz   <thomas.raddatz@tools400.de>      *
     //  Created . . . : 25.01.2017                                         *
     //                                                                     *
     // =================================================================== *
     //                                                                     *
     //  This software is free software, you can redistribute it and/or     *
     //  modify it under the terms of the GNU General Public License (GPL)  *
     //  as published by the Free Software Foundation.                      *
     //                                                                     *
     //  See GNU General Public License for details.                        *
     //          http://www.opensource.org                                  *
     //          http://www.opensource.org/licenses/gpl-license.html        *
     //                                                                     *
     // =================================================================== *
     //  History:                                                           *
     //                                                                     *
     //  Datum       Name          Änderung                                 *
     //  ----------  ------------  ---------------------------------------  *
     //                                                                     *
     // =================================================================== *
     // STRPREPRC Compile Options:                                          *
     //   >>PRE-COMPILER<<                                                  *
     //     >>CRTCMD<<    CRTRPGMOD  MODULE(&LI/&OB) +                      *
     //                              SRCFILE(&SL/&SF) SRCMBR(&SM);          *
     //     >>IMPORTANT<<                                                   *
     //       >>PARM<<    TRUNCNBR(*NO);                                    *
     //       >>PARM<<    DBGVIEW(*LIST);                                   *
     //       >>PARM<<    OPTION(*EVENTF);                                  *
     //     >>END-IMPORTANT<<                                               *
     //     >>EXECUTE<<                                                     *
     //   >>END-PRE-COMPILER<<                                              *
     // =================================================================== *

       ctl-opt debug(*yes);
      /if defined(CRTBNDRPG)
       ctl-opt dftactgrp(*no) actgrp(*new);
      /endif
      /include QWHOAMI,COPYRIGHT

       // Send Program Message (QMHSNDPM) API
       dcl-pr QMHSNDPM extpgm('QMHSNDPM');
          i_msgId       char(7)     const;
          i_qMsgF       char(20)    const;
          i_msgData     char(32768) options(*varsize) const;
          i_lenMsgData  int(10)     const;
          i_msgType     char(10)    const;
          i_callStkE    char(10)    const;
          i_callStkC    int(10)     const;
          o_msgKey      char(4);
          io_errCode    likeds(errCode_t) options(*varsize);
       end-pr;

       // Retrieve Device Description (QDCRDEVD) API
       dcl-pr QDCRDEVD extpgm('QDCRDEVD');
          o_rcvVar      char(37767) options(*varsize);
          i_lenRcv      int(10)     const;
          i_format      char(8)     const;
          i_device      char(10)    const;
          io_errCode    likeds(errCode_t) options(*varsize);
       end-pr;

       dcl-ds devd0600_t qualified template;
          bytRet          int(10)   pos(1);
          bytAvl          int(10)   pos(5);
          dateInfRtv      char(7)   pos(9);
          timeInfRtv      char(6)   pos(16);
          devName         char(10)  pos(22);
          decCategory     char(10)  pos(32);
          onlineAtIPL     char(10)  pos(42);
          text            char(51)  pos(51);
          reserved_1      char(3)   pos(102);
          graphCharSet    int(10)   pos(105);
          codePage        int(10)   pos(109);
          maxLenReqU      int(10)   pos(113);
          inactTimer      int(10)   pos(117);
          dbcsRamSize     int(10)   pos(121);
          actTimer        int(10)   pos(125);
          swsSetting      int(10)   pos(129);
          devPort         int(10)   pos(133);
          maxOutFrms      int(10)   pos(137);
          idlTimer        int(10)   pos(141);
          nrmPollTimer    int(10)   pos(145);
          frmRetry        int(10)   pos(149);
          ofsAuxDev       int(10)   pos(153);
          numAuxDev       int(10)   pos(157);
          lenAuxDev       int(10)   pos(161);
          devClass        char(10)  pos(165);
          devType         char(10)  pos(175);
          devModel        char(10)  pos(185);
          lclLocAddr      char(10)  pos(195);
          attNonSwsCtrl   char(10)  pos(205);
          keybLngType     char(10)  pos(215);
          dropLineAtSnO   char(10)  pos(225);
          alwBlkCrs       char(10)  pos(235);
          prtDev          char(10)  pos(245);
          rmtLocName      char(10)  pos(255);
          lclLocName      char(10)  pos(265);
          rmtNetworkID    char(10)  pos(275);
          ctrlSessDevD    char(10)  pos(285);
          acoPrtName      char(10)  pos(295);
          acoPrtRmtNtID   char(10)  pos(305);
          altPrtName      char(10)  pos(315);
          altPrtRmtNtID   char(10)  pos(325);
          outQName        char(10)  pos(335);
          outQLib         char(10)  pos(345);
          printer         char(10)  pos(355);
          prtFName        char(10)  pos(365);
          prtFLib         char(10)  pos(375);
          wsCstObjName    char(10)  pos(385);
          wsCstObjLib     char(10)  pos(395);
          applType        char(10)  pos(405);
          dbcsMtxSize     char(10)  pos(415);
          dbcsLangID      char(10)  pos(425);
          dbcsLastCdePt   char(10)  pos(435);
          snaPassThrDev   char(10)  pos(445);
          snaPassThrGrp   char(10)  pos(455);
          emlDev          char(10)  pos(465);
          emlModel        char(10)  pos(475);
          emlAscDev       char(10)  pos(485);
          physAttach      char(10)  pos(495);
          lineSpeed       char(10)  pos(505);
          wordLength      char(10)  pos(515);
          parityType      char(10)  pos(525);
          stopBits        char(10)  pos(535);
          ascTerminalID   char(20)  pos(545);
          acoAppcDev      char(10)  pos(565);
          hostSignonCmd   char(256) pos(575);
          passThrID       char(1)   pos(831);
          autoCfg         char(10)  pos(832);
          reserved_2      char(3)   pos(842);
          shrdSessNbr     int(10)   pos(845);
          depLocName      char(10)  pos(849);
          netwProt        char(1)   pos(859);
          netwProtAddr    char(18)  pos(860);
          tcpIpDotAddr    char(15)  pos(878);
          alcByJobName    char(10)  pos(893);
          alcByUserName   char(10)  pos(903);
          alcByJobNbr     char(6)   pos(913);
          curMsgQName     char(10)  pos(919);
          curMsgQLib      char(10)  pos(929);
          svrNetwProt     char(1)   pos(939);
          svrNetwProtAddr char(18)  pos(940);
          svrTcpIpDotAddr char(15)  pos(958);
       end-ds;

       // Retrieve Network Attributes (QWCRNETA) API
       dcl-pr QWCRNETA extpgm('QWCRNETA');
          o_rcvVar      char(37767) options(*varsize);
          i_lenRcv      int(10)     const;
          i_numAttr     int(10)     const;
          i_attrNames   char(10) dim(50)  options(*varsize) const;
          io_errCode    likeds(errCode_t) options(*varsize);
       end-pr;

       dcl-ds QWCRNETA_returned_t qualified template;
          numE          int(10);
          offsAttr      int(10);
       end-ds;

       dcl-ds QWCRNETA_attr_t qualified template;
          name          char(10);
          type          char(1);
          status        char(1);
          length        int(10);
          data_char     char(256);
          data_bin      int(10) overlay(data_char);
       end-ds;

       dcl-c QWCRNETA_TYPE_NONE '';
       dcl-c QWCRNETA_TYPE_CHAR 'C';
       dcl-c QWCRNETA_TYPE_BIN 'B';

       dcl-c QWCRNETA_STATUS_OK '';
       dcl-c QWCRNETA_STATUS_LOCKED 'L';

       // IBM API error structure
       dcl-ds errCode_t qualified template;
          bytPrv        int(10);
          bytAvl        int(10);
          excId         char(7);
          reserved      char(1);
          excData       char(512);
       end-ds;

       // IBM qialified object name
       dcl-ds qObj_t qualified template;
          name          char(10);
          lib           char(10);
       end-ds;

       // Program status information data structure
       dcl-ds sds PSDS qualified;
          pgmName       char(10) pos(1);
          pgmStat       zoned(5) pos(11);
          prevStat      zoned(5) pos(16);
          lastSeq       char(8)  pos(21);
          lastSubr      char(8)  pos(29);
          nbrParm       zoned(3) pos(37);
          excType       char(3)  pos(40);
          excNbr        char(4)  pos(43);
          miInstruction char(4)  pos(47);
          workArea      char(30) pos(51);
          pgmLib        char(10) pos(81);
          excData       char(80) pos(91);
          rnx9001Exc    char(4)  pos(171);
          lastFileLong  char(10) pos(175);
          unused_1      char(6)  pos(185);
          datFmt        char(8)  pos(191);
          year          zoned(2) pos(199);
          lastFileShort char(8)  pos(201);
          fileStat      char(35) pos(209);
          job           char(10) pos(244);
          user          char(10) pos(254);
          nbr           char(6)  pos(264);
          startDate     zoned(6) pos(270);
          runDate       zoned(6) pos(276);
          runTime       zoned(6) pos(282);
          compDate      char(6)  pos(288);
          compTime      char(6)  pos(294);
          compLevel     char(4)  pos(300);
          srcFile       char(10) pos(304);
          srcLib        char(10) pos(314);
          srcMbr        char(10) pos(324);
          pgmContProc   char(10) pos(334);
          modContProc   char(10) pos(344);
          sourceID1     int(5)   pos(354);
          sourceID2     int(5)   pos(356);
          currUser      char(10) pos(358);
          unused_2      char(62) pos(368);
       end-ds;

       // IBM API error structure:
       dcl-ds errCode likeds(errCode_t) inz;

       // QWCRNETA fields:
       dcl-s QWCRNETA_rcvBuff char(300);
       dcl-ds QWCRNETA_returned likeds(QWCRNETA_returned_t) based(pQWCRNETA_returned);
       dcl-ds QWCRNETA_attr likeds(QWCRNETA_attr_t) based(pQWCRNETA_attr);
       dcl-s QWCRNETA_attrs char(10) dim(1);

       dcl-s sysName char(10);

       // Retrieve Device Description (QDCRDEVD) API
       dcl-s workstation char(10);
       dcl-ds devd0600 likeds(devd0600_t) inz;
       dcl-s tcpIdAddr like(devd0600.tcpIpDotAddr);

       // Send Program Message (QMHSNDPM) API
       dcl-ds qMsgF likeds(qObj_t) inz;
       dcl-s message varchar(132);
       dcl-s msgKey char(4);

       // Retrieve system name
       QWCRNETA_attrs(1) = 'SYSNAME';
       QWCRNETA(QWCRNETA_rcvBuff: %size(QWCRNETA_rcvBuff)
                : %elem(QWCRNETA_attrs): QWCRNETA_attrs: errCode);

       pQWCRNETA_returned = %addr(QWCRNETA_rcvBuff);
       if (QWCRNETA_returned.numE = 1);
          pQWCRNETA_attr = pQWCRNETA_returned + QWCRNETA_returned.offsAttr;
          sysName = %subst(QWCRNETA_attr.data_char: 1: QWCRNETA_attr.length);
       endif;

       // Retrieve TCP/IP address from device description
       workstation = sds.job;
       QDCRDEVD(devd0600: %size(devd0600): 'DEVD0600': workstation: errCode);
       tcpIdAddr = devd0600.tcpIpDotAddr;

       // Send result to command line
       message = 'User: '     + %trim(sds.user) +
                 ', System: ' + %trim(sysName) +
                 ', Device: ' + %trim(workstation) +
                 ', IP: '     + %trim(tcpIdAddr);

       qMsgF.name = 'QCPFMSG';
       qMsgF.lib = 'QSYS';
       QMHSNDPM('CPDA0FF': qMsgF: message: %len(message): '*INFO': '*PGMBDY': 1: msgKey: errCode);

       return;


