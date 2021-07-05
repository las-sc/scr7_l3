///
/// @file       <scr_base_l3_bk_rob.sv>
/// @brief      L3 Bank Reguest Ongoing Buffer
/// @author     esk-sc
///
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.


module scr_base_l3_bk_rob (

    // Clock/Reset
    input  logic                                            rst_n                       ,
    input  logic                                            clk                         ,

    output logic                                            rob_retry_val_o             ,
    output logic                                            rob_retry_opc_o             ,
    output logic                                            rob_retry_addr_o            ,
    output logic                                            rob_retry_cell_o            ,

    output logic                                            ld_wr_val_o                 ,
    output logic                                            ld_wr_way_o                 ,
    output logic                                            ld_wr_index_o               ,
    output logic                                            ld_wr_tag_o                 ,
    output logic                                            ld_wr_state_o               ,
    input  logic                                            ld_wr_ready_i               ,

    input  logic                                            d1_val_i                    ,
    input  logic                                            d1_addr_i                   ,
    
    output logic                                            d2_hit_o                    ,
    output logic                                            d2_hit_cell_f_o             ,
    output logic                                            d2_hit_cell_l_o             ,
    output logic                                            d2_way_blk_o                ,

    output logic                                            d3_rob_full_o               ,
    output logic                                            d3_cell_o                   ,

    input  logic                                            d4_val_i                    ,
    input  logic                                            d4_req_val_i                ,
    input  logic                                            d4_snp_val_i                ,
    input  logic                                            d4_retry_val_i              ,
    input  logic                                            d4_scrid_i                  ,
    input  logic                                            d4_txnid_i                  ,
    input  logic                                            d4_opc_i                    ,
    input  logic                                            d4_addr_i                   ,
    input  logic                                            d4_state_wr_i               ,
    input  logic                                            d4_new_state_i              ,
    input  logic                                            d4_wait_evict_i             ,
    input  logic                                            d4_evict_cell_i             ,
    input  logic                                            d4_need_retry_i             ,
    input  logic                                            d4_trans_state_i            ,
    input  logic                                            d4_snp_out_dst              ,
    input  logic                                            d4_snp_out_flit             ,

    output logic                                            rob_req_out_val_o           ,
    output logic                                            rob_req_out_flit_o          ,
    input  logic                                            rob_req_out_ready_i         ,

    output logic                                            rob_rsp_out_val_o           ,
    output logic                                            rob_rsp_out_flit_o          ,
    input  logic                                            rob_rsp_out_ready_i         ,

    output logic                                            rob_snp_out_val_o           ,
    output logic                                            rob_snp_out_flit_o          ,
    input  logic                                            rob_snp_out_ready_i         ,

    input  logic                                            snp_ack_collected_vect_i    ,
    input  logic                                            comp_ack_collected_vect_i   ,
    input  logic                                            comp_dbid_collected_vect_i  ,

);

//-------------------------------------------------------------------------------
// Local signals
//-------------------------------------------------------------------------------
genvar                                                  ii;

// ROB State
// Cell valid
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_val_ff      ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_val_next    ;
logic                                                   rob_val_en      ;

// Retry val
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_retry_ff    ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_retry_next  ;
logic                                                   rob_retry_en    ;

// Cell positions
logic   [SCR_BASE_L3_BK_ROB_POS_WIDTH-1 : 0]            rob_pos_ff      [0:SCR_BASE_L3_BK_ROB_DEPTH-1];
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_pos_f       ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_pos_l       ;
// Link to next cell with same address
logic   [SCR_BASE_L3_BK_ROB_PTR_SIZE-1 : 0]             rob_pos_n       [0:SCR_BASE_L3_BK_ROB_DEPTH-1];
logic   [SCR_BASE_L3_BK_ROB_POS_WIDTH-1 : 0]            rob_pos_next    [0:SCR_BASE_L3_BK_ROB_DEPTH-1];
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_pos_f_next  ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_pos_l_next  ;
// Link to next cell with same address
logic   [SCR_BASE_L3_BK_ROB_PTR_SIZE-1 : 0]             rob_pos_n_next  [0:SCR_BASE_L3_BK_ROB_DEPTH-1];
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_pos_en      ;

// ROB cells Address
type_scr_base_l3_bk_ld_addr                             rob_addr_ff     [0:SCR_BASE_L3_BK_ROB_DEPTH-1];
type_scr_base_l3_bk_ld_addr                             rob_addr_next   [0:SCR_BASE_L3_BK_ROB_DEPTH-1];
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_addr_en     ;

// ROB cells Ways
logic   [SCR_BASE_L3_BK_WAY_NUM-1 : 0]                  rob_way_ff      [0:SCR_BASE_L3_BK_ROB_DEPTH-1];
logic   [SCR_BASE_L3_BK_WAY_NUM-1 : 0]                  rob_way_next    [0:SCR_BASE_L3_BK_ROB_DEPTH-1];
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_way_en      ;

// ROB transient state
logic   [SCR_BASE_L3_BK_ROB_TSTATE-1 : 0]               rob_tstate_ff   [0:SCR_BASE_L3_BK_ROB_DEPTH-1];
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_ldwr ;   // Need Local Directory new state write
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_compack; // Need Comp Response to requester
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_ldatr;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_ldatw;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_reqr ;   // Need read from MEM
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_reqw ;   // Need write to MEM ???
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_gdatr;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_gdatw;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_grspr;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_grspw;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_snp  ;   // Need SNP to RN-F
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_lack ;

logic   [SCR_BASE_L3_BK_ROB_TSTATE-1 : 0]               rob_tstate_next [0:SCR_BASE_L3_BK_ROB_DEPTH-1];
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_ldwr_next    ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_lrsp_next    ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_ldat_next    ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_grsp_next    ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_gdat_next    ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_lsnp_next    ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_lack_next    ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_tstate_en   ;

// ROB Current action
logic   [SCR_BASE_L3_BK_ROB_CACT-1 : 0]                 rob_cact_ff     [0:SCR_BASE_L3_BK_ROB_DEPTH-1];
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_cact_req    ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_cact_snp    ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_cact_rsp    ;
logic   [SCR_BASE_L3_BK_ROB_DEPTH-1 : 0]                rob_cact_dat    ;

endmodule : scr_base_l3_bk_rob

