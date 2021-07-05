///
/// @file       <scr_base_l3_bk_vb.sv>
/// @brief      L3 Bank Victim Buffer
/// @author     esk-sc
///
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.


module scr_base_l3_bk_vb (

    // Clock/Reset
    input  logic                                            rst_n,
    input  logic                                            clk,

    input  logic                                            d1_val_i    ,
    input  logic                                            d1_addr_i   ,

    output logic                                            d2_hit_o    ,
    output logic                                            d2_cell_o   ,
    output logic                                            d2_way_blk_o,

    input  logic                                            d4_evict_i  ,
    input  logic                                            d4_cell_i   ,
    input  logic                                            d4_index_i  ,
    input  logic                                            d4_way_i    ,
);

//-------------------------------------------------------------------------------
// Local signals
//-------------------------------------------------------------------------------
genvar                                                  ii;


endmodule : scr_base_l3_bk_vb

