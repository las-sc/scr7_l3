//`ifndef __SCR_BASE_CL3_CHIPKG_DEFINED__
`define __SCR_BASE_CL3_CHIPKG_DEFINED__
///
/// @file       <scr_base_cl3_chipkg.sv>
/// @brief      Cluster Level 3 Parameters declaration
///
/// @authors    esk-sc
////
/// Copyright by Syntacore LLC © 2017, 2018. ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.
///

package scr_base_cl3_chipkg;

parameter   SCR_BASE_CL3_NOC_DID_WIDTH          =   7;
parameter   SCR_BASE_CL3_NOC_CID_WIDTH          =   12;

// REQ Flits
parameter   SCR_BASE_CL3_NOC_REQ_TGTID_WIDTH    =   SCR_BASE_CL3_NOC_DID_WIDTH;
parameter   SCR_BASE_CL3_NOC_REQ_TGTID_LSB      =   0;
parameter   SCR_BASE_CL3_NOC_REQ_TGTID_MSB      =   SCR_BASE_CL3_NOC_REQ_TGTID_WIDTH;

parameter   SCR_BASE_CL3_NOC_REQ_SRCID_EN       =   1;
parameter   SCR_BASE_CL3_NOC_REQ_SRCID_WIDTH    =   SCR_BASE_CL3_NOC_DID_WIDTH;
parameter   SCR_BASE_CL3_NOC_REQ_SRCID_LSB      =   SCR_BASE_CL3_NOC_REQ_TGTID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_SRCID_MSB      =   (SCR_BASE_CL3_NOC_REQ_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_REQ_SRCID_LSB + SCR_BASE_CL3_NOC_REQ_SRCID_WIDTH - 1  :
                                                                                                SCR_BASE_CL3_NOC_REQ_SRCID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_REQ_TXNID_EN       =   1;
parameter   SCR_BASE_CL3_NOC_REQ_TXNID_WIDTH    =   SCR_BASE_CL3_NOC_CID_WIDTH;
parameter   SCR_BASE_CL3_NOC_REQ_TXNID_LSB      =   SCR_BASE_CL3_NOC_REQ_SRCID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_TXNID_MSB      =   (SCR_BASE_CL3_NOC_REQ_TXNID_EN == 1)    ?   SCR_BASE_CL3_NOC_REQ_TXNID_LSB + SCR_BASE_CL3_NOC_REQ_TXNID_WIDTH - 1   :
                                                                                                SCR_BASE_CL3_NOC_REQ_TXNID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_REQ_OPC_EN         =   1;
parameter   SCR_BASE_CL3_NOC_REQ_OPC_LSB        =   SCR_BASE_CL3_NOC_REQ_TXNID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_OPC_MSB        =   (SCR_BASE_CL3_NOC_REQ_OPC_EN == 1)      ?   SCR_BASE_CL3_NOC_REQ_OPC_LSB + SCR_BASE_CL3_NOC_REQ_OPC_WIDTH - 1       :
                                                                                                SCR_BASE_CL3_NOC_REQ_OPC_LSB - 1;

parameter   SCR_BASE_CL3_NOC_REQ_SIZE_EN        =   1;
parameter   SCR_BASE_CL3_NOC_REQ_SIZE_LSB       =   SCR_BASE_CL3_NOC_REQ_OPC_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_SIZE_MSB       =   (SCR_BASE_CL3_NOC_REQ_SIZE_EN == 1)     ?   SCR_BASE_CL3_NOC_REQ_SIZE_LSB + SCR_BASE_CL3_NOC_REQ_SIZE_WIDTH - 1     :
                                                                                                SCR_BASE_CL3_NOC_REQ_SIZE_LSB - 1;

parameter   SCR_BASE_CL3_NOC_REQ_ADDR_EN        =   1;
parameter   SCR_BASE_CL3_NOC_REQ_ADDR_WIDTH     =   SCR_BASE_ADDR;
parameter   SCR_BASE_CL3_NOC_REQ_ADDR_LSB       =   SCR_BASE_CL3_NOC_REQ_SIZE_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_ADDR_MSB       =   (SCR_BASE_CL3_NOC_REQ_ADDR_EN == 1)     ?   SCR_BASE_CL3_NOC_REQ_ADDR_LSB + SCR_BASE_CL3_NOC_REQ_ADDR_WIDTH - 1     :
                                                                                                SCR_BASE_CL3_NOC_REQ_ADDR_LSB - 1;

parameter   SCR_BASE_CL3_NOC_REQ_RNID_EN        =   1;
parameter   SCR_BASE_CL3_NOC_REQ_RNID_WIDTH     =   SCR_BASE_CL3_NOC_DID_WIDTH;
parameter   SCR_BASE_CL3_NOC_REQ_RNID_LSB       =   SCR_BASE_CL3_NOC_REQ_ADDR_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_RNID_MSB       =   (SCR_BASE_CL3_NOC_REQ_RNID_EN == 1)     ?   SCR_BASE_CL3_NOC_REQ_RNID_LSB + SCR_BASE_CL3_NOC_REQ_RNID_WIDTH -1      :
                                                                                                SCR_BASE_CL3_NOC_REQ_RNID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_REQ_RTID_EN        =   1;
parameter   SCR_BASE_CL3_NOC_REQ_RTID_WIDTH     =   SCR_BASE_CL3_NOC_CID_WIDTH;
parameter   SCR_BASE_CL3_NOC_REQ_RTID_LSB       =   SCR_BASE_CL3_NOC_REQ_RNID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_RTID_MSB       =   (SCR_BASE_CL3_NOC_REQ_RTID_EN == 1)     ?   SCR_BASE_CL3_NOC_REQ_RTID_LSB + SCR_BASE_CL3_NOC_REQ_RTID_WIDTH - 1     :
                                                                                                SCR_BASE_CL3_NOC_REQ_RTID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_REQ_PCTYPE_EN      =   1;
parameter   SCR_BASE_CL3_NOC_REQ_PCTYPE_LSB     =   SCR_BASE_CL3_NOC_REQ_RTID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_PCTYPE_MSB     =   (SCR_BASE_CL3_NOC_REQ_PCTYPE_EN == 1)   ?   SCR_BASE_CL3_NOC_REQ_PCTYPE_LSB + SCR_BASE_CL3_NOC_REQ_PCTYPE_WIDTH     :
                                                                                                SCR_BASE_CL3_NOC_REQ_PCTYPE_LSB - 1;

parameter   SCR_BASE_CL3_NOC_REQ_MEMATTR_EN     =   1;
parameter   SCR_BASE_CL3_NOC_REQ_MEMATTR_LSB    =   SCR_BASE_CL3_NOC_REQ_PCTYPE_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_MEMATTR_MSB    =   (SCR_BASE_CL3_NOC_REQ_MEMATTR_EN == 1)  ?   SCR_BASE_CL3_NOC_REQ_MEMATTR_LSB + SCR_BASE_CL3_NOC_REQ_MEMATTR_WIDTH - 1   :
                                                                                                SCR_BASE_CL3_NOC_REQ_MEMATTR_LSB - 1;

parameter   SCR_BASE_CL3_NOC_REQ_SNPATTR_EN     =   1;
parameter   SCR_BASE_CL3_NOC_REQ_SNPATTR_LSB    =   SCR_BASE_CL3_NOC_REQ_MEMATTR_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_SNPATTR_MSB    =   (SCR_BASE_CL3_NOC_REQ_SNPATTR_EN == 1)  ?   SCR_BASE_CL3_NOC_REQ_SNPATTR_LSB + SCR_BASE_CL3_NOC_REQ_SNPATTR_WIDTH - 1   :
                                                                                                SCR_BASE_CL3_NOC_REQ_SNPATTR_LSB - 1;

parameter   SCR_BASE_CL3_NOC_REQ_EXCL_EN        =   1;
parameter   SCR_BASE_CL3_NOC_REQ_EXCL_LSB       =   SCR_BASE_CL3_NOC_REQ_SNPATTR_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_EXCL_MSB       =   SCR_BASE_CL3_NOC_REQ_EXCL_EN == 1       ?   SCR_BASE_CL3_NOC_REQ_EXCL_LSB + SCR_BASE_CL3_NOC_REQ_EXCL_WIDTH - 1         :
                                                                                                SCR_BASE_CL3_NOC_REQ_EXCL_LSB - 1;

parameter   SCR_BASE_CL3_NOC_REQ_FLIT_WIDTH     =   SCR_BASE_CL3_NOC_REQ_EXCL_MSB + 1;
parameter   SCR_BASE_CL3_NOC_REQ_FLIT_LSB       =   0;
parameter   SCR_BASE_CL3_NOC_REQ_FLIT_MSB       =   SCR_BASE_CL3_NOC_REQ_EXCL_MSB;

// RSP
parameter   SCR_BASE_CL3_NOC_RSP_TGTID_WIDTH    =   SCR_BASE_CL3_NOC_DID_WIDTH;
parameter   SCR_BASE_CL3_NOC_RSP_TGTID_LSB      =   0;
parameter   SCR_BASE_CL3_NOC_RSP_TGTID_MSB      =   SCR_BASE_CL3_NOC_RSP_TGTID_WIDTH - 1;

parameter   SCR_BASE_CL3_NOC_RSP_SRCID_EN       =   1;
parameter   SCR_BASE_CL3_NOC_RSP_SRCID_WIDTH    =   SCR_BASE_CL3_NOC_DID_WIDTH;
parameter   SCR_BASE_CL3_NOC_RSP_SRCID_LSB      =   SCR_BASE_CL3_NOC_RSP_TGTID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_RSP_SRCID_MSB      =   (SCR_BASE_CL3_NOC_RSP_TGTID_EN == 1)    ?   SCR_BASE_CL3_NOC_RSP_SRCID_LSB + SCR_BASE_CL3_NOC_RSP_SRCID_WIDTH - 1   :
                                                                                                SCR_BASE_CL3_NOC_RSP_SRCID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_RSP_TXNID_EN       =   1;
parameter   SCR_BASE_CL3_NOC_RSP_TXNID_WIDTH    =   SCR_BASE_CL3_NOC_CID_WIDTH;
parameter   SCR_BASE_CL3_NOC_RSP_TXNID_LSB      =   SCR_BASE_CL3_NOC_RSP_SRCID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_RSP_TXNID_MSB      =   (SCR_BASE_CL3_NOC_RSP_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_RSP_TXNID_LSB + SCR_BASE_CL3_NOC_RSP_TXNID_WIDTH - 1   :
                                                                                                SCR_BASE_CL3_NOC_RSP_TXNID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_RSP_OPC_EN         =   1;
parameter   SCR_BASE_CL3_NOC_RSP_OPC_LSB        =   SCR_BASE_CL3_NOC_RSP_TXNID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_RSP_OPC_MSB        =   (SCR_BASE_CL3_NOC_RSP_TXNID_EN == 1)    ?   SCR_BASE_CL3_NOC_RSP_OPC_LSB + SCR_BASE_CL3_NOC_RSP_OPC_WIDTH - 1   :
                                                                                        SCR_BASE_CL3_NOC_RSP_OPC_LSB - 1;

parameter   SCR_BASE_CL3_NOC_RSP_RESPERR_EN     =   1;
parameter   SCR_BASE_CL3_NOC_RSP_RESPERR_LSB    =   SCR_BASE_CL3_NOC_RSP_OPC_MSB + 1;
parameter   SCR_BASE_CL3_NOC_RSP_RESPERR_MSB    =   (SCR_BASE_CL3_NOC_REQ_OPC_EN == 1)      ?   SCR_BASE_CL3_NOC_RSP_RESPERR_LSB + SCR_BASE_CL3_NOC_RSP_RESPERR_WIDTH - 1   :
                                                                                                SCR_BASE_CL3_NOC_RSP_RESPERR_LSB - 1;

parameter   SCR_BASE_CL3_NOC_RSP_RESP_EN        =   1;
parameter   SCR_BASE_CL3_NOC_RSP_RESP_LSB       =   SCR_BASE_CL3_NOC_RSP_RESPERR_MSB + 1;
parameter   SCR_BASE_CL3_NOC_RSP_RESP_MSB       =   (SCR_BASE_CL3_NOC_RSP_RESPERR_EN == 1)  ?   SCR_BASE_CL3_NOC_RSP_RESP_LSB + SCR_BASE_CL3_NOC_RSP_RESP_WIDTH - 1 :
                                                                                                SCR_BASE_CL3_NOC_RSP_RESP_LSB - 1;

parameter   SCR_BASE_CL3_NOC_RSP_DBID_EN        =   1;
parameter   SCR_BASE_CL3_NOC_RSP_DBID_WIDTH     =   SCR_BASE_CL3_NOC_CID_WIDTH;
parameter   SCR_BASE_CL3_NOC_RSP_DBID_LSB       =   SCR_BASE_CL3_NOC_RSP_RESP_MSB + 1;
parameter   SCR_BASE_CL3_NOC_RSP_DBID_MSB       =   (SCR_BASE_CL3_NOC_RSP_RESP_EN == 1)     ?   SCR_BASE_CL3_NOC_RSP_DBID_LSB + SCR_BASE_CL3_NOC_RSP_DBID_WIDTH - 1 :
                                                                                                SCR_BASE_CL3_NOC_RSP_DBID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_RSP_PCTYPE_EN      =   1;
parameter   SCR_BASE_CL3_NOC_RSP_PCTYPE_LSB     =   SCR_BASE_CL3_NOC_RSP_DBID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_RSP_PCTYPE_MSB     =   (SCR_BASE_CL3_NOC_RSP_DBID_EN == 1)     ?   SCR_BASE_CL3_NOC_RSP_PCTYPE_LSB + SCR_BASE_CL3_NOC_RSP_PCTYPE_WIDTH - 1 :
                                                                                                SCR_BASE_CL3_NOC_RSP_PCTYPE_LSB - 1;

parameter   SCR_BASE_CL3_NOC_RSP_FLIT_WIDTH     =   SCR_BASE_CL3_NOC_RSP_PCTYPE_MSB + 1;
parameter   SCR_BASE_CL3_NOC_RSP_FLIT_LSB       =   0;
parameter   SCR_BASE_CL3_NOC_RSP_FLIT_MSB       =   SCR_BASE_CL3_NOC_RSP_PCTYPE_MSB;

// SNP
parameter   SCR_BASE_CL3_NOC_SNP_TGTVID_WIDTH   =   SCR_BASE_CL3_NOC_CORE_NUM;
parameter   SCR_BASE_CL3_NOC_SNP_TGTVID_LSB     =   0;
parameter   SCR_BASE_CL3_NOC_SNP_TGTVID_MSB     =   SCR_BASE_CL3_NOC_SNP_TGTVID_WIDTH - 1;

parameter   SCR_BASE_CL3_NOC_SNP_SRCID_EN       =   1;
parameter   SCR_BASE_CL3_NOC_SNP_SRCID_WIDTH    =   SCR_BASE_CL3_NOC_DID_WIDTH;
parameter   SCR_BASE_CL3_NOC_SNP_SRCID_LSB      =   SCR_BASE_CL3_NOC_SNP_TGTVID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_SNP_SRCID_MSB      =   (SCR_BASE_CL3_NOC_SNP_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_SNP_SRCID_LSB + SCR_BASE_CL3_NOC_SNP_SRCID_WIDTH - 1   :
                                                                                                SCR_BASE_CL3_NOC_SNP_SRCID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_SNP_TXNID_EN       =   1;
parameter   SCR_BASE_CL3_NOC_SNP_TXNID_WIDTH    =   SCR_BASE_CL3_NOC_CID_WIDTH;
parameter   SCR_BASE_CL3_NOC_SNP_TXNID_LSB      =   SCR_BASE_CL3_NOC_SNP_SRCID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_SNP_TXNID_MSB      =   (SCR_BASE_CL3_NOC_SNP_TXNID_EN == 1)    ?   SCR_BASE_CL3_NOC_SNP_TXNID_LSB + SCR_BASE_CL3_NOC_SNP_TXNID_WIDTH - 1   :
                                                                                                SCR_BASE_CL3_NOC_SNP_TXNID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_SNP_FNID_EN        =   1;
parameter   SCR_BASE_CL3_NOC_SNP_FNID_WIDTH     =   SCR_BASE_CL3_NOC_DID_WIDTH;
parameter   SCR_BASE_CL3_NOC_SNP_FNID_LSB       =   SCR_BASE_CL3_NOC_SNP_TXNID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_SNP_FNID_MSB       =   (SCR_BASE_CL3_NOC_SNP_FNID_EN == 1)     ?   SCR_BASE_CL3_NOC_SNP_FNID_LSB + SCR_BASE_CL3_NOC_SNP_FNID_WIDTH - 1     :
                                                                                                SCR_BASE_CL3_NOC_SNP_FNID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_SNP_FTXNID_EN      =   1;
parameter   SCR_BASE_CL3_NOC_SNP_FTXNID_WIDTH   =   SCR_BASE_CL3_NOC_CID_WIDTH;
parameter   SCR_BASE_CL3_NOC_SNP_FTXNID_LSB     =   SCR_BASE_CL3_NOC_SNP_FNID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_SNP_FTXNID_MSB     =   (SCR_BASE_CL3_NOC_SNP_FTXNID_EN == 1)   ?   SCR_BASE_CL3_NOC_SNP_FTXNID_LSB + SCR_BASE_CL3_NOC_SNP_FTXNID_WIDTH - 1 :
                                                                                                SCR_BASE_CL3_NOC_SNP_FTXNID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_SNP_OPC_EN         =   1;
parameter   SCR_BASE_CL3_NOC_SNP_OPC_LSB        =   SCR_BASE_CL3_NOC_SNP_FTXNID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_SNP_OPC_MSB        =   (SCR_BASE_CL3_NOC_SNP_OPC_EN == 1)      ?   SCR_BASE_CL3_NOC_SNP_OPC_LSB + SCR_BASE_CL3_NOC_SNP_OPC_WIDTH - 1       :
                                                                                                SCR_BASE_CL3_NOC_SNP_OPC_LSB - 1;

parameter   SCR_BASE_CL3_NOC_SNP_ADDR_EN        =   1;
parameter   SCR_BASE_CL3_NOC_SNP_ADDR_WIDTH     =   SCR_BASE_ADDR - 6;
parameter   SCR_BASE_CL3_NOC_SNP_ADDR_LSB       =   SCR_BASE_CL3_NOC_SNP_OPC_MSB + 1;
parameter   SCR_BASE_CL3_NOC_SNP_ADDR_MSB       =   (SCR_BASE_CL3_NOC_SNP_ADDR_EN == 1)     ?   SCR_BASE_CL3_NOC_SNP_ADDR_LSB + SCR_BASE_CL3_NOC_SNP_ADDR_WIDTH - 1     :
                                                                                                SCR_BASE_CL3_NOC_SNP_ADDR_LSB - 1;

parameter   SCR_BASE_CL3_NOC_SNP_RTOSRC_EN      =   1;
parameter   SCR_BASE_CL3_NOC_SNP_RTOSRC_LSB     =   SCR_BASE_CL3_NOC_SNP_ADDR_MSB + 1;
parameter   SCR_BASE_CL3_NOC_SNP_RTOSRC_MSB     =   (SCR_BASE_CL3_NOC_SNP_RTOSRC_EN == 1)   ?   SCR_BASE_CL3_NOC_SNP_RTOSRC_LSB + SCR_BASE_CL3_NOC_SNP_RTOSRC_WIDTH - 1 :
                                                                                                SCR_BASE_CL3_NOC_SNP_RTOSRC_LSB - 1;

parameter   SCR_BASE_CL3_NOC_SNP_FLIT_WIDTH     =   SCR_BASE_CL3_NOC_SNP_RTOSRC_MSB + 1;
parameter   SCR_BASE_CL3_NOC_SNP_FLIT_LSB       =   0;
parameter   SCR_BASE_CL3_NOC_SNP_FLIT_MSB       =   SCR_BASE_CL3_NOC_SNP_RTOSRC_MSB;

// DAT
parameter   SCR_BASE_CL3_NOC_DAT_TGTID_WIDTH    =   SCR_BASE_CL3_NOC_DID_WIDTH;
parameter   SCR_BASE_CL3_NOC_DAT_TGTID_LSB      =   0;
parameter   SCR_BASE_CL3_NOC_DAT_TGTID_MSB      =   SCR_BASE_CL3_NOC_DAT_TGTID_WIDTH - 1;

parameter   SCR_BASE_CL3_NOC_DAT_SRCID_EN       =   1;
parameter   SCR_BASE_CL3_NOC_DAT_SRCID_WIDTH    =   SCR_BASE_CL3_NOC_DID_WIDTH;
parameter   SCR_BASE_CL3_NOC_DAT_SRCID_LSB      =   SCR_BASE_CL3_NOC_DAT_TGTID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_SRCID_MSB      =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_SRCID_LSB + SCR_BASE_CL3_NOC_DAT_SRCID_WIDTH - 1   :
                                                                                                SCR_BASE_CL3_NOC_DAT_SRCID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_TXNID_EN       =   1;
parameter   SCR_BASE_CL3_NOC_DAT_TXNID_WIDTH    =   SCR_BASE_CL3_NOC_CID_WIDTH;
parameter   SCR_BASE_CL3_NOC_DAT_TXNID_LSB      =   SCR_BASE_CL3_NOC_DAT_SRCID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_TXNID_MSB      =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_TXNID_LSB + SCR_BASE_CL3_NOC_DAT_TXNID_WIDTH - 1   :
                                                                                                SCR_BASE_CL3_NOC_DAT_TXNID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_HNID_EN        =   1;
parameter   SCR_BASE_CL3_NOC_DAT_HNID_WIDTH     =   SCR_BASE_CL3_NOC_DID_WIDTH;
parameter   SCR_BASE_CL3_NOC_DAT_HNID_LSB       =   SCR_BASE_CL3_NOC_DAT_TXNID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_HNID_MSB       =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_HNID_LSB + SCR_BASE_CL3_NOC_DAT_HNID_WIDTH - 1     :
                                                                                                SCR_BASE_CL3_NOC_DAT_HNID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_DBID_EN        =   1;
parameter   SCR_BASE_CL3_NOC_DAT_DBID_WIDTH     =   SCR_BASE_CL3_NOC_CID_WIDTH;
parameter   SCR_BASE_CL3_NOC_DAT_DBID_LSB       =   SCR_BASE_CL3_NOC_DAT_HNID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_DBID_MSB       =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_DBID_LSB + SCR_BASE_CL3_NOC_DAT_DBID_WIDTH - 1     :
                                                                                                SCR_BASE_CL3_NOC_DAT_DBID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_OPC_EN         =   1;
parameter   SCR_BASE_CL3_NOC_DAT_OPC_LSB        =   SCR_BASE_CL3_NOC_DAT_DBID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_OPC_MSB        =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_OPC_LSB + SCR_BASE_CL3_NOC_DAT_OPC_WIDTH - 1       :
                                                                                                SCR_BASE_CL3_NOC_DAT_OPC_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_RESPERR_EN     =   1;
parameter   SCR_BASE_CL3_NOC_DAT_RESPERR_LSB    =   SCR_BASE_CL3_NOC_DAT_OPC_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_RESPERR_MSB    =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_RESPERR_LSB + SCR_BASE_CL3_NOC_DAT_RESPERR_WIDTH - 1:
                                                                                                SCR_BASE_CL3_NOC_DAT_RESPERR_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_RESP_EN        =   1;
parameter   SCR_BASE_CL3_NOC_DAT_RESP_LSB       =   SCR_BASE_CL3_NOC_DAT_RESPERR_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_RESP_MSB       =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_RESP_LSB + SCR_BASE_CL3_NOC_DAT_RESP_WIDTH - 1     :
                                                                                                SCR_BASE_CL3_NOC_DAT_RESP_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_BE_EN          =   1;
parameter   SCR_BASE_CL3_NOC_DAT_BE_WIDTH       =   SCR_BASE_CL3_NOC_DATA_WIDTH/8;
parameter   SCR_BASE_CL3_NOC_DAT_BE_LSB         =   SCR_BASE_CL3_NOC_DAT_RESP_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_BE_MSB         =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_BE_LSB + SCR_BASE_CL3_NOC_DAT_BE_WIDTH - 1         :
                                                                                                SCR_BASE_CL3_NOC_DAT_BE_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_DATA_EN        =   1;
parameter   SCR_BASE_CL3_NOC_DAT_DATA_WIDTH     =   SCR_BASE_CL3_NOC_DATA_WIDTH;
parameter   SCR_BASE_CL3_NOC_DAT_DATA_LSB       =   SCR_BASE_CL3_NOC_DAT_BE_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_DATA_MSB       =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_DATA_LSB + SCR_BASE_CL3_NOC_DAT_DATA_WIDTH - 1     :
                                                                                                SCR_BASE_CL3_NOC_DAT_DATA_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_FSTATE_EN      =   1;
parameter   SCR_BASE_CL3_NOC_DAT_FSTATE_LSB     =   SCR_BASE_CL3_NOC_DAT_DATA_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_FSTATE_MSB     =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_FSTATE_LSB + SCR_BASE_CL3_NOC_DAT_FSTATE_WIDTH - 1 :
                                                                                                SCR_BASE_CL3_NOC_DAT_FSTATE_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_CCID_EN        =   1;
parameter   SCR_BASE_CL3_NOC_DAT_CCID_LSB       =   SCR_BASE_CL3_NOC_DAT_FSTATE_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_CCID_MSB       =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_CCID_LSB + SCR_BASE_CL3_NOC_DAT_CCID_WIDTH - 1     :
                                                                                                SCR_BASE_CL3_NOC_DAT_CCID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_DATAID_EN      =   1;
parameter   SCR_BASE_CL3_NOC_DAT_DATAID_LSB     =   SCR_BASE_CL3_NOC_DAT_CCID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_DATAID_MSB     =   (SCR_BASE_CL3_NOC_DAT_SRCID_EN == 1)    ?   SCR_BASE_CL3_NOC_DAT_DATAID_LSB + SCR_BASE_CL3_NOC_DAT_DATAID_WIDTH - 1 :
                                                                                                SCR_BASE_CL3_NOC_DAT_DATAID_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_POISON_EN          =   1;
parameter   SCR_BASE_CL3_NOC_DAT_POISON_WIDTH   =   SCR_BASE_CL3_NOC_DATA_WIDTH/64;
parameter   SCR_BASE_CL3_NOC_DAT_POISON_LSB     =   SCR_BASE_CL3_NOC_DAT_DATAID_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_POISON_MSB     =   (SCR_BASE_CL3_NOC_DAT_POISON_EN == 1)   ?   SCR_BASE_CL3_NOC_DAT_POISON_LSB + SCR_BASE_CL3_NOC_DAT_POISON_WIDTH - 1  :
                                                                                                SCR_BASE_CL3_NOC_DAT_POISON_LSB - 1;

parameter   SCR_BASE_CL3_NOC_DAT_FLIT_WIDTH     =   SCR_BASE_CL3_NOC_DAT_POISON_MSB + 1;
parameter   SCR_BASE_CL3_NOC_DAT_FLIT_LSB       =   0;
parameter   SCR_BASE_CL3_NOC_DAT_FLIT_MSB       =   SCR_BASE_CL3_NOC_DAT_POISON_MSB;

//================================================================
// Defining values of some fields
//================================================================

`endif  // __SCR_BASE_CL3_NOC_CHIPKG_DEFINED__
