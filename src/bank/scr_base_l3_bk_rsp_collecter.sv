///
/// @file       <scr_base_l3_bk_rsp_collecter.sv>
/// @brief      L3 Bank Responses collecter
/// @author     esk-sc
///
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.


module scr_base_l3_bk_rsp_collecter (

    // Clock/Reset
    input  logic                                            rst_n,
    input  logic                                            clk,

    input   logic                                           allocation_i                ,
    input   logic                                           cell_allocation_i           ,
    input   logic                                           cell_ack_need_i             ,
    input   logic                                           cell_comp_ack_need_i        ,
    input   logic                                           cell_dbid_need_i            ,

    input  logic                                            rsp_in_val_i                ,
    input  logic                                            rsp_in_flit_i               ,
    output logic                                            rsp_in_crdt_o               ,

    input  logic                                            dat_in_val_i                ,
    input  logic                                            dat_in_srcid_i              ,
    input  logic                                            dat_in_opc_i                ,

    output logic                                            snp_ack_collected_vect_o    ,
    output logic                                            comp_ack_collected_vect_o   ,
    output logic                                            comp_dbid_collected_vect_o  ,
);

//-------------------------------------------------------------------------------
// Local signals
//-------------------------------------------------------------------------------
genvar                                                  ii;

// Input Flit
logic                                                   rsp_in_srcid;
logic                                                   rsp_in_txnid;
logic                                                   rsp_in_opc;
logic                                                   rsp_in_srcid;

logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_ack_wait_ff;   // Num of wait ack from cores
logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_ack_recd_ff;   // Num of received back from cores
logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_ack_wait_next; // Num of wait ack from cores
logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_ack_recd_next; // Num of received back from cores
logic                                                   cell_ack_wait_en;   // Num of wait ack from cores
logic                                                   cell_ack_recd_en;   // Num of received back from cores

logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_comp_ack_wait_ff;  // Num of wait comp ack
logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_comp_ack_recd_ff;  // Num of received comp ack
logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_comp_ack_wait_next;// Num of wait comp ack
logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_comp_ack_recd_next;// Num of received comp ack
logic                                                   cell_comp_ack_wait_en;  // Num of wait comp ack
logic                                                   cell_comp_ack_recd_en;  // Num of received comp ack

logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_dbid_wait_ff;  // Num of wait ack from cores
logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_dbid_recd_ff;  // Num of received back from cores
logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_dbid_wait_next;  // Num of wait ack from cores
logic   [SCR_BASE_L3_BK_RSPC_DEPTH-1 : 0]               cell_dbid_recd_next;  // Num of received back from cores
logic                                                   cell_dbid_wait_en;  // Num of wait ack from cores
logic                                                   cell_dbid_recd_en;  // Num of received back from cores

  generate
  for (genvar ii =0; ii < SCR_BASE_L2_WAY_NUM; ii = ii + 1) begin : entry_update
    assign  cell_ack_wait_next[ii] = allocation & (cell_allocation == ii) & cell_ack_need;
    assign  cell_ack_recd_next[ii] = cell_ack_recd_next[ii] + rsp_in_val_i & (rsp_in_txnid == ii);
  end
  endgenerate

endmodule : scr_base_l3_bk_rsp_collecter