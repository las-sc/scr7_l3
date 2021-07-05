`ifndef __SCR_BASE_L3_TYPES_PKG_DEFINED__
`define __SCR_BASE_L3_TYPES_PKG_DEFINED__
///
/// @file       <scr_base_l3_types_pkg.svh>
/// @brief      L3 Bank Types declaration
///
/// @authors    esk-sc
////
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.
///

`include "scr_base_l3_params_pkg.svh"


// Bank Address
typedef struct packed {
    logic  [SCR_BASE_L3_BK_TAG_WIDTH    -1:0]   tag;
    logic  [SCR_BASE_L3_BK_INDEX_WIDTH  -1:0]   idx;
    logic  [SCR_BASE_L3_BK_OFFSET_WIDTH -1:0]   offset;
} type_scr_base_l3_bk_addr;

typedef struct packed {
    logic  [SCR_BASE_L3_BK_TAG_WIDTH    -1:0]   tag;
    logic  [SCR_BASE_L3_BK_INDEX_WIDTH  -1:0]   idx;
} type_scr_base_l3_bk_ld_addr;

`endif //__SCR_BASE_L3_TYPES_PKG_DEFINED__

