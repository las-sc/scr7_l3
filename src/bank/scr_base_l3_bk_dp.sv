///
/// @file       <scr_base_l3_bk_dp.sv>
/// @brief      L3 Bank Data Pipe
/// @author     esk-sc
///
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.


module scr_base_l3_bk_dp (

    // Clock/Reset
    input  logic                                            rst_n,
    input  logic                                            clk,

    input  logic                                            dp_d4_val_i            ,
    input  logic                                            dp_d4_cell_i           ,
    input  logic                                            dp_d4_way_i            ,
    input  logic                                            dp_d4_opc_i            ,
    input  logic                                            dp_d4_index_i          ,
    input  logic                                            dp_d4_data_i           ,
    output logic                                            dp_d4_ready_o          ,

    input  logic                                            dbuff2dp_val_i         ,
    input  logic                                            dbuff2dp_cell_i        ,
    input  logic                                            dbuff2dp_way_i         ,
    input  logic                                            dbuff2dp_opc_i         ,
    input  logic                                            dbuff2dp_index_i       ,
    input  logic                                            dbuff2dp_data_i        ,

    output logic                                            dp_d9_val_o            ,
    output logic                                            dp_d9_cell_o           ,
    output logic                                            dp_d9_data_o           ,
);

//-------------------------------------------------------------------------------
// Local signals
//-------------------------------------------------------------------------------
genvar                                                  ii;


endmodule : scr_base_l3_bk_dp

