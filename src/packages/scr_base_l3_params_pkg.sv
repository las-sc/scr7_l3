`ifndef __SCR_BASE_L3_PARAMS_PKG_DEFINED__
`define __SCR_BASE_L3_PARAMS_PKG_DEFINED__
///
/// @file       <scr_base_l3_params_pkg.svh>
/// @brief      L3 Parameters declaration
///
/// @authors    esk-sc
////
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.
///

package  scr_base_l3_params_pkg;

parameter   SCR_BASE_L3_CL_IL0_BASE         =   6;
parameter   SCR_BASE_L3_CL_IL1_BASE         =   7;
parameter   SCR_BASE_L3_CL_IL2_BASE         =   8;

parameter   SCR_BASE_L3_BANK_NUM            =   `SCR_BASE_L3_BANK_NUM;
parameter   SCR_BASE_L3_BANK_NUM_WIDTH      =   $clog2(SCR_BASE_L3_BANK_NUM);

parameter   SCR_BASE_L3_CORE_NUM_WIDTH      =   $clog2(`SCR_BASE_L3_CORE_NUM);

parameter   SCR_BASE_L3_BANK_WAY_NUM        =   `SCR_BASE_L3_BANK_WAY_NUM;
parameter   SCR_BASE_L3_BANK_WAY_NUM        =   16;

parameter   SCR_BASE_L3_BANK_OFFSET_WIDTH   =   6;
parameter   SCR_BASE_L3_BANK_INDEX_WIDTH    =   11;
parameter   SCR_BASE_L3_BANK_TAG_WIDTH      =   SCR_BASE_L3_ADDR - SCR_BASE_L3_BANK_OFFSET_WIDTH - SCR_BASE_L3_BANK_NUM_WIDTH - SCR_BASE_L3_BANK_INDEX_WIDTH;

parameter   SCR_BASE_L3_BANK_C_STATE_WIDTH  =   3;
parameter   SCR_BASE_L3_BANK_V_STATE_WIDTH  =   SCR_BASE_L3_CORE_NUM_WIDTH;
parameter   SCR_BASE_L3_BANK_L_STATE_WIDTH  =   SCR_BASE_L3_BANK_C_STATE_WIDTH + SCR_BASE_L3_BANK_V_STATE_WIDTH;
parameter   SCR_BASE_L3_BANK_STATE_WIDTH    =   SCR_BASE_L3_BANK_TAG_WIDTH + SCR_BASE_L3_BANK_V_STATE_WIDTH + SCR_BASE_L3_BANK_C_STATE_WIDTH;
// L3 Bank ROB Parameters
parameter   SCR_BASE_L3_BANK_ROB_DEPTH      =   32;
parameter   SCR_BASE_L3_BANK_ROB_PTR_SIZE   =   $clog2(SCR_BASE_L3_BANK_ROB_DEPTH);

parameter   SCR_BASE_L3_BANK_ROB_ADDR_WIDTH =   SCR_BASE_L3_ADDR - SCR_BASE_L3_BANK_OFFSET_WIDTH - SCR_BASE_L3_BANK_NUM_WIDTH;

// L3 Bank VB Parameters
parameter   SCR_BASE_L3_BANK_VB_DEPTH       =   16;
parameter   SCR_BASE_L3_BANK_VB_PTR_SIZE    =   $clog2(SCR_BASE_L3_BANK_VB_DEPTH);

// L3 Bank DBUFF Parameters
parameter   SCR_BASE_L3_BANK_DBUFF_DEPTH    =   SCR_BASE_L3_BANK_ROB_DEPTH + SCR_BASE_L3_BANK_VB_DEPTH;
parameter   SCR_BASE_L3_BANK_DBUFF_PTR_SIZE =   $clog2(SCR_BASE_L3_BANK_DBUFF_DEPTH);

// L3 Bank Response Collecter Parameters
parameter   SCR_BASE_L3_BANK_RSPC_DEPTH     =   SCR_BASE_L3_BANK_ROB_DEPTH + SCR_BASE_L3_BANK_VB_DEPTH;
parameter   SCR_BASE_L3_BANK_RSPC_PTR_SIZE  =   $clog2(SCR_BASE_L3_BANK_RSPC_DEPTH);



endpackage:  scr_base_l3_params_pkg
`endif //__SCR_BASE_L3_PARAMS_PKG_DEFINED__

