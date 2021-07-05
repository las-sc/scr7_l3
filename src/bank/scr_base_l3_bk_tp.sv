///
/// @file       <scr_base_l3_bk_tp.sv>
/// @brief      L3 Bank Tag Pipe
/// @author     esk-sc
///
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.


module scr_base_l3_bk_tp (

    // Clock/Reset
    input  logic                                            rst_n,
    input  logic                                            clk,

    input  logic                                            d0_val_i                ,
    input  logic                                            d0_req_val_i            ,
    input  logic                                            d0_snp_val_i            ,
    input  logic                                            d0_retry_i              ,
    input  logic                                            d0_scrid_i              ,
    input  logic                                            d0_txnid_i              ,
    input  logic                                            d0_opc_i                ,
    input  logic                                            d0_addr_i               ,

    output logic                                            d1_val_o                ,
    output logic                                            d1_addr_o               ,
    
    input  logic                                            d2_rob_hit_i            ,
    input  logic                                            d2_rob_hit_cell_f_i     ,
    input  logic                                            d2_rob_hit_cell_l_i     ,
    input  logic                                            d2_rob_way_blk_i        ,

    input  logic                                            d2_vb_hit_i             ,
    input  logic                                            d2_vb_hit_cell_i        ,

    input  logic                                            d3_rob_full_i           ,
    input  logic                                            d3_cell_i               ,

    output logic                                            d4_val_o                ,
    output logic                                            d4_req_val_o            ,
    output logic                                            d4_snp_val_o            ,
    output logic                                            d4_retry_val_o          ,
    output logic                                            d4_scrid_o              ,
    output logic                                            d4_txnid_o              ,
    output logic                                            d4_opc_o                ,
    output logic                                            d4_addr_o               ,
    output logic                                            d4_state_wr_o           ,
    output logic                                            d4_new_state_o          ,
    output logic                                            d4_wait_evict_o         ,
    output logic                                            d4_evict_cell_o         ,
    output logic                                            d4_need_retry_o         ,
    output logic                                            d4_trans_state_o        ,
    output logic                                            d4_snp_out_dst_o        ,
    output logic                                            d4_snp_out_opc_o       ,
);

//-------------------------------------------------------------------------------
// Local signals
//-------------------------------------------------------------------------------
genvar                                                  ii;


endmodule : scr_base_l3_bk_tp

