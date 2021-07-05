///
/// @file       <scr_base_l3_bk_snp_que.sv>
/// @brief      L3 Bank Snoop Queue
/// @author     esk-sc
///
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.


module scr_base_l3_bk_snp_que (

    // Clock/Reset
    input  logic                                            rst_n,
    input  logic                                            clk,

    input  logic                                            snp_in_val_i       ,
    input  logic                                            snp_in_flit_i      ,
    output logic                                            snp_in_crdt_o      ,

    output logic                                            snp_2tp_val_o      ,
    output logic                                            snp_2tp_scrid_o    ,
    output logic                                            snp_2tp_txnid_o    ,
    output logic                                            snp_2tp_opc_o      ,
    output logic                                            snp_2tp_size_o     ,
    output logic                                            snp_2tp_addr_o     ,
    input  logic                                            snp_2tp_ready_i    ,
    input  logic                                            snp_2tp_rlbk_i     ,
);

//-------------------------------------------------------------------------------
// Local signals
//-------------------------------------------------------------------------------
genvar                                                  ii;


endmodule : scr_base_l3_bk_snp_que