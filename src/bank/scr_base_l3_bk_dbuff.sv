///
/// @file       <scr_base_l3_bk_dbuff.sv>
/// @brief      L3 Bank Data Buffer
/// @author     esk-sc
///
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.


module scr_base_l3_bk_dbuff (

    // Clock/Reset
    input  logic                                            rst_n,
    input  logic                                            clk,

    input  logic                                            d4_val_i           ,
    input  logic                                            d4_val_cell_i      ,

    input  logic                                            dbuff_in_val_i     ,
    input  logic                                            dbuff_in_flit_i    ,
    output logic                                            dbuff_in_ready_o   ,

    input  logic                                            dbuff_out_val_i    ,
    input  logic                                            dbuff_out_flit_i   ,
    output logic                                            dbuff_out_ready_o  ,

    output logic                                            dbuff2dp_val_o     ,
    output logic                                            dbuff2dp_cell_o    ,
    output logic                                            dbuff2dp_way_o     ,
    output logic                                            dbuff2dp_index_o   ,
    output logic                                            dbuff2dp_data_o    ,
    output logic                                            dbuff2dp_rd_o      ,
    output logic                                            dbuff2dp_wr_o      ,
    input  logic                                            dbuff2dp_ready_i   ,

    input  logic                                            dp_d9_val_i        ,
    input  logic                                            dp_d9_cell_i       ,
    input  logic                                            dp_d9_data_i       ,
);

//-------------------------------------------------------------------------------
// Local signals
//-------------------------------------------------------------------------------
genvar                                                  ii;


endmodule : scr_base_l3_bk_dbuff