///
/// @file       <scr_base_l3_bk_tp_arb.sv>
/// @brief      L3 Bank Tag Pipe Arbiter
/// @author     esk-sc
///
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.


module scr_base_l3_bk_tp_arb (

    // Clock/Reset
    input  logic                                            rst_n,
    input  logic                                            clk,

    input  logic                                            req_2tp_val_i      ,
    input  logic                                            req_2tp_scrid_i    ,
    input  logic                                            req_2tp_txnid_i    ,
    input  logic                                            req_2tp_opc_i      ,
    input  logic                                            req_2tp_size_i     ,
    input  logic                                            req_2tp_addr_i     ,

`ifdef SCR_BASE_L3_EXTERNAL_SNP
    input  logic                                            snp_2tp_val_i      ,
    input  logic                                            snp_2tp_scrid_i    ,
    input  logic                                            snp_2tp_txnid_i    ,
    input  logic                                            snp_2tp_opc_i      ,
    input  logic                                            snp_2tp_addr_i     ,
'endif

    input  logic                                            rob_retry_val_i    ,
    input  logic                                            rob_retry_cell_i   ,
    input  logic                                            rob_retry_opc_i    ,
    input  logic                                            rob_retry_addr_i   ,

    output logic                                            d0_val_o           ,
    output logic                                            d0_req_val_o       ,
    output logic                                            d0_snp_val_o       ,
    output logic                                            d0_retry_o         ,
    output logic                                            d0_scrid_o         ,
    output logic                                            d0_txnid_o         ,
    output logic                                            d0_opc_O           ,
    output logic                                            d0_addr_o          ,
);

//-------------------------------------------------------------------------------
// Local signals
//-------------------------------------------------------------------------------
genvar                                                  ii;


endmodule : scr_base_l3_bk_tp_arb

