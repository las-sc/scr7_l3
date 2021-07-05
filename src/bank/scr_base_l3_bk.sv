///
/// @file       <scr_base_l3.sv>
/// @brief      L3$ Bank Top
/// @author     esk-sc
///
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.

`include "scr_base_l3_params_pkg.svh"
`include "scr_base_l3_types_pkg.svh"
`include "scr_base_l3_funcs_pkg.svh"

module scr_base_l3_bk (

    // Clock/Reset
    input  logic                                            rst_n,
    input  logic                                            clk,
    output logic                                            idle,

    // DFT
    input  logic                                            test_mode,
    input  logic                                            test_rst_n,
    input  logic                                            test_se,

    // NoC Interface
    // REQ to L3 BANK
    input  logic                                            req_in_val_i,
    input  logic  [SCR_BASE_L3_REQ_FLIT_WIDTH   -1:0]       req_in_flit_i,
    output logic                                            req_in_crdt_o,

    // REQ from L3 BANK
    output logic                                            req_out_val_o,
    output logic  [SCR_BASE_L3_REQ_FLIT_WIDTH   -1:0]       req_out_flit_o,
    input  logic                                            req_out_crdt_i,

    // DAT to L3 BANK
    input  logic                                            dat_in_val_i,
    input  logic  [SCR_BASE_L3_DAT_FLIT_WIDTH   -1:0]       dat_in_flit_i,
    output logic                                            dat_in_crdt_o,

    // DAT from L3 BANK
    output logic                                            dat_out_val_o,
    output logic  [SCR_BASE_L3_DAT_FLIT_WIDTH   -1:0]       dat_out_flit_o,
    input  logic                                            dat_out_crdt_i,

    // RSP to L3 BANK
    input  logic                                            rsp_in_val_i,
    input  logic  [SCR_BASE_L3_RSP_FLIT_WIDTH   -1:0]       rsp_in_flit_i,
    output logic                                            rsp_in_crdt_o,

    // RSP from L3 BANK
    output logic                                            rsp_out_val_o,
    output logic  [SCR_BASE_L3_RSP_FLIT_WIDTH   -1:0]       rsp_out_flit_o,
    input  logic                                            rsp_out_crdt_i,

`ifdef SCR_BASE_L3_EXTERNAL_SNP
    // SNP to L3 BANK
    input  logic                                            snp_in_val_i,
    input  logic  [SCR_BASE_L3_SNP_FLIT_WIDTH   -1:0]       snp_in_flit_i,
    output logic                                            snp_in_crdt_o,
'endif    

    // SNP from L3 BANK
    output logic                                            snp_out_val_o,
    output logic  [SCR_BASE_L3_SNP_FLIT_WIDTH   -1:0]       snp_out_flit_o,
    output logic  [SCR_BASE_L3_SNP_DST_WIDTH    -1:0]       snp_out_dst_o,
    input  logic                                            snp_out_crdt_i
);

//-------------------------------------------------------------------------------
// Local signals
//-------------------------------------------------------------------------------
genvar                                                  ii;

// Queue of input REQ
scr_base_l3_bk_req_que  i_l3_bk_req_que
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .req_in_val_i       (req_in_val_i       ),
    .req_in_flit_i      (req_in_flit_i      ),
    .req_in_crdt_o      (req_in_crdt_o      ),

    .req_2tp_val_o      (req_2tp_val        ),
    .req_2tp_scrid_o    (req_2tp_scrid      ),
    .req_2tp_txnid_o    (req_2tp_txnid      ),
    .req_2tp_opc_o      (req_2tp_opc        ),
    .req_2tp_size_o     (req_2tp_size       ),
    .req_2tp_addr_o     (req_2tp_addr       ),
    .req_2tp_ready_i    (req_2tp_ready_i    ),
    .req_2tp_rlbk_i     (req_2tp_rlbk_i     ),
);

// Queue of input SNP
`ifdef SCR_BASE_L3_EXTERNAL_SNP
scr_base_l3_bk_snp_que  i_l3_bk_snp_que
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .snp_in_val_i       (snp_in_val_i       ),
    .snp_in_flit_i      (snp_in_flit_i      ),
    .snp_in_crdt_o      (snp_in_crdt_o      ),

    .snp_2tp_val_o      (snp_2tp_val        ),
    .snp_2tp_scrid_o    (snp_2tp_scrid      ),
    .snp_2tp_txnid_o    (snp_2tp_txnid      ),
    .snp_2tp_opc_o      (snp_2tp_opc        ),
    .snp_2tp_size_o     (snp_2tp_size       ),
    .snp_2tp_addr_o     (snp_2tp_addr       ),
    .snp_2tp_ready_i    (snp_2tp_ready_i    ),
    .snp_2tp_rlbk_i     (snp_2tp_rlbk_i     ),
);
'endif

// Arbiter between input REQ, input REQ, retry ROB cell 
scr_base_l3_bk_tp_arb   i_l3_bk_tp_arb
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .req_2tp_val_i      (req_2tp_val        ),
    .req_2tp_scrid_i    (req_2tp_scrid      ),
    .req_2tp_txnid_i    (req_2tp_txnid      ),
    .req_2tp_opc_i      (req_2tp_opc        ),
    .req_2tp_size_i     (req_2tp_size       ),
    .req_2tp_addr_i     (req_2tp_addr       ),

`ifdef SCR_BASE_L3_EXTERNAL_SNP
    .snp_2tp_val_i      (snp_2tp_val        ),
    .snp_2tp_scrid_i    (snp_2tp_scrid      ),
    .snp_2tp_txnid_i    (snp_2tp_txnid      ),
    .snp_2tp_opc_i      (snp_2tp_opc        ),
    .snp_2tp_addr_i     (snp_2tp_addr       ),
'endif

    .rob_retry_val_i    (rob_retry_val      ),
    .rob_retry_cell_i   (rob_retry_cell     ),
    .rob_retry_opc_i    (rob_retry_opc      ),
    .rob_retry_addr_i   (rob_retry_addr     ),

    .d0_val_o           (d0_val             ),
    .d0_req_val_o       (d0_req_val         ),
    .d0_snp_val_o       (d0_snp_val         ),
    .d0_retry_o         (d0_retry           ),
    .d0_scrid_o         (d0_scrid           ),
    .d0_txnid_o         (d0_txnid           ),
    .d0_opc_O           (d0_opc             ),
    .d0_addr_o          (d0_addr            ),
);

// Tag Pipe. Stages d0, d1, d2, d3, d4
scr_base_l3_bk_tp   i_l3_bk_tp
(
    .rst_n                      (rst_n                      ),
    .clk                        (clk                        ),

    .d0_val_i                   (d0_val                     ),
    .d0_req_val_i               (d0_req_val                 ),
    .d0_snp_val_i               (d0_snp_val                 ),
    .d0_retry_i                 (d0_retry                   ),
    .d0_scrid_i                 (d0_scrid                   ),
    .d0_txnid_i                 (d0_txnid                   ),
    .d0_opc_i                   (d0_opc                     ),
    .d0_addr_i                  (d0_addr                    ),

    .d1_val_o                   (d1_val                     ),
    .d1_addr_o                  (d1_addr                    ),
    
    .d2_rob_hit_i               (d2_rob_hit                 ),
    .d2_rob_hit_cell_f_i        (d2_rob_hit_cell_f          ),
    .d2_rob_hit_cell_l_i        (d2_rob_hit_cell_l          ),
    .d2_rob_way_blk_i           (d2_rob_way_blk             ),

    .d3_rob_full_i              (d3_rob_full                ),
    .d3_cell_i                  (d3_cell                    ),

    .d4_val_o                   (d4_val                     ),
    .d4_req_val_o               (d4_req_val                 ),
    .d4_snp_val_o               (d4_snp_val                 ),
    .d4_retry_val_o             (d4_retry_val               ),
    .d4_scrid_o                 (d4_scrid                   ),
    .d4_txnid_o                 (d4_txnid                   ),
    .d4_opc_o                   (d4_opc                     ),
    .d4_addr_o                  (d4_addr                    ),
    .d4_state_wr_o              (d4_state_wr                ),
    .d4_new_state_o             (d4_new_state               ),
    .d4_wait_evict_o            (d4_wait_evict              ),
    .d4_evict_cell_o            (d4_evict_cell              ),
    .d4_need_retry_o            (d4_need_retry              ),
    .d4_trans_state_o           (d4_trans_state             ),
    .d4_snp_out_dst_o           (d4_snp_out_dst             ),
    .d4_snp_out_flit_o          (d4_snp_out_flit            ),    
);

// Request OnGoing Buffer (ROB). Allocates all REQ & SNP. Dont allocate evict
scr_base_l3_bk_rob  i_l3_bk_rob
(
    .rst_n                      (rst_n                      ),
    .clk                        (clk                        ),

    .rob_retry_val_o            (rob_retry_val              ),
    .rob_retry_opc_o            (rob_retry_opc              ),
    .rob_retry_addr_o           (rob_retry_addr             ),
    .rob_retry_cell_o           (rob_retry_cell             ),

    .d1_val_i                   (d1_val                     ),
    .d1_addr_i                  (d1_addr                    ),
    
    .d2_rob_hit_o               (d2_rob_hit                 ),
    .d2_rob_hit_cell_f_o        (d2_rob_hit_cell_f          ),
    .d2_rob_hit_cell_l_o        (d2_rob_hit_cell_l          ),
    .d2_rob_way_blk_o           (d2_rob_way_blk             ),

    .d3_rob_full_o              (d3_rob_full                ),
    .d3_cell_o                  (d3_cell                    ),

    .d4_val_i                   (d4_val                     ),
    .d4_req_val_i               (d4_req_val                 ),
    .d4_snp_val_i               (d4_snp_val                 ),
    .d4_retry_val_i             (d4_retry_val               ),
    .d4_scrid_i                 (d4_scrid                   ),
    .d4_txnid_i                 (d4_txnid                   ),
    .d4_opc_i                   (d4_opc                     ),
    .d4_addr_i                  (d4_addr                    ),
    .d4_state_wr_i              (d4_state_wr                ),
    .d4_new_state_i             (d4_new_state               ),
    .d4_wait_evict_i            (d4_wait_evict              ),
    .d4_evict_cell_i            (d4_evict_cell              ),
    .d4_need_retry_i            (d4_need_retry              ),
    .d4_trans_state_i           (d4_trans_state             ),
    .d4_snp_out_dst_i           (d4_snp_out_dst             ),
    .d4_snp_out_flit_i          (d4_snp_out_flit            ),

    .rob_req_out_val_o          (rob_req_out_val            ),
    .rob_req_out_flit_o         (rob_req_out_flit           ),
    .rob_req_out_ready_i        (rob_req_out_ready          ),

    .rob_rsp_out_val_o          (rob_rsp_out_val            ),
    .rob_rsp_out_flit_o         (rob_rsp_out_flit           ),
    .rob_rsp_out_ready_i        (rob_rsp_out_ready          ),

    .rob_snp_out_val_o          (rob_snp_out_val            ),
    .rob_snp_out_flit_o         (rob_snp_out_flit           ),
    .rob_snp_out_ready_i        (rob_snp_out_ready          ),

    .snp_ack_collected_vect_i   (snp_ack_collected_vect     ),
    .comp_ack_collected_vect_i  (comp_ack_collected_vect    ),
    .comp_dbid_collected_vect_i (comp_dbid_collected_vect   ),

    .
);

// Data Pipe. 2 direction: TP d4, DBUFF
scr_base_l3_bk_dp   i_l3_bk_dp
(
    .rst_n                  (rst_n              ),
    .clk                    (clk                ),

    .dp_d4_val_i            (),
    .dp_d4_cell_i           (),
    .dp_d4_way_i            (),
    .dp_d4_opc_i            (),
    .dp_d4_index_i          (),
    .dp_d4_data_i           (),
    .dp_d4_ready_o          (),

    .dbuff2dp_val_i         (),
    .dbuff2dp_cell_i        (),
    .dbuff2dp_way_i         (),
    .dbuff2dp_opc_i         (),
    .dbuff2dp_index_i       (),
    .dbuff2dp_data_i        (),

    .dp_d9_val_o            (),
    .dp_d9_cell_o           (),
    .dp_d9_data_o           (),
);

// In fifo for DAT from NoC
scr_base_l3_bk_1w1r_incrdt_fifo #(
    .SCR_BASE_DWIDTH    (SCR_BASE_L3_DAT_FLIT_WIDTH ),
    .SCR_BASE_DEPTH     (SCR_BASE_L3_DAT_N2B_CRDT   )
)   i_l3_bk_dat_out
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .wr_val_i           (dat_in_val_i       )
    .wr_data_i          (dat_in_flit_i      )
    .wr_ready_o         (dat_in_crdt_o      )

    .rd_val_o           (dbuff_in_val       ),
    .rd_data_o          (dbuff_in_flit      ),
    .rd_crdt_i          (dbuff_in_ready     )
);

// Data Buffer. Direct allocation. Little for ROB cells. Big for VB
scr_base_l3_bk_dbuff    i_l3_bk_dbuff
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .d4_val_i           (),
    .d4_val_cell_i      (),

    .dbuff_in_val_i     (dbuff_in_val       ),
    .dbuff_in_flit_i    (dbuff_in_flit      ),
    .dbuff_in_ready_o   (dbuff_in_ready     ),

    .dbuff_out_val_i    (dbuff_out_val      ),
    .dbuff_out_flit_i   (dbuff_out_flit     ),
    .dbuff_out_ready_o  (dbuff_out_ready    ),

    .dbuff2dp_val_o     (),
    .dbuff2dp_cell_o    (),
    .dbuff2dp_way_o     (),
    .dbuff2dp_index_o   (),
    .dbuff2dp_data_o    (),
    .dbuff2dp_rd_o      (),
    .dbuff2dp_wr_o      (),
    .dbuff2dp_ready_i   (),

    .dp_d9_val_i        (),
    .dp_d9_cell_i       (),
    .dp_d9_data_i       (),
);

// Victim buffer. For all evicted cells.
scr_base_l3_bk_vb   i_l3_bk_vb
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .d1_val_i           ()
    .d1_addr_i          ()

    .d2_hit_o           ()
    .d2_cell_o          ()

    .d4_evict_i         ()
    .d4_cell_i          ()
    .d4_index_i         ()
    .d4_way_i           ()
);

// Response collect buffer. according DBUFF cells
scr_base_l3_bk_rsp_collecter   i_l3_bk_rsp_collecter
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .rsp_in_val_i       (rsp_in_val_i       ),
    .rsp_in_flit_i      (rsp_in_flit_i      ),
    .rsp_in_crdt_o      (rsp_in_crdt_o      ),

    .dat_in_val_i       (dat_in_val_i       ),
    .dat_in_srcid_i     (dat_in_srcid       ),
    .dat_in_opc_i       (dat_in_opc         ),

    .snp_ack_collected_vect_o   (snp_ack_collected_vect     ),
    .comp_ack_collected_vect_o  (comp_ack_collected_vect    ),
    .comp_dbid_collected_vect_o (comp_dbid_collected_vect   ),
);


// REQ out interface
// REQ arb beetwin tp out & ROB
scr_base_l3_bk_arb_2way #(
    .SCR_BASE_DWIDTH    (SCR_BASE_L3_REQ_FLIT_WIDTH )
)   i_l3_bk_snp_out_arb
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .in0_val_i          (d4_req_out_val     ),
    .in0_data_i         (d4_req_out_flit    ),
    .in0_ready_o        (d4_snp_out_ready   ),

    .in1_val_i          (rob_req_out_val    ),
    .in1_data_i         (rob_req_out_flit   ),
    .in1_ready_o        (rob_snp_out_ready  ),

    .out_val_o          (req_out_arb_val    ),
    .out_data_o         (req_out_arb_flit   ),
    .out_ready_i        (req_out_arb_ready  )
);

// Out fifo for SNP to NoC
scr_base_l3_bk_1w1r_outcrdt_fifo #(
    .SCR_BASE_DWIDTH    (SCR_BASE_L3_REQ_FLIT_WIDTH ),
    .SCR_BASE_CRDT      (SCR_BASE_L3_REQ_B2N_CRDT   )
)   i_l3_bk_req_out
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .wr_val_i           (req_out_arb_val    )
    .wr_data_i          (req_out_arb_flit   )
    .wr_ready_o         (req_out_arb_ready  )

    .rd_val_o           (req_out_val_o      ),
    .rd_data_o          (req_out_flit_o     ),
    .rd_crdt_i          (req_out_crdt_i     )
);

// Out fifo for DAT to NoC
scr_base_l3_bk_1w1r_outcrdt_fifo #(
    .SCR_BASE_DWIDTH    (SCR_BASE_L3_DAT_FLIT_WIDTH ),
    .SCR_BASE_CRDT      (SCR_BASE_L3_DAT_B2N_CRDT   )
)   i_l3_bk_dat_out
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .wr_val_i           (dbuff_out_val      )
    .wr_data_i          (dbuff_out_dat      )
    .wr_ready_o         (dbuff_out_ready    )

    .rd_val_o           (dat_out_val_o      ),
    .rd_data_o          (dat_out_flit_o     ),
    .rd_crdt_i          (dat_out_crdt_i     )
);

// SNP out interface
// SNP arb beetwin tp out & ROB
scr_base_l3_bk_arb_2way #(
    .SCR_BASE_DWIDTH    (SCR_BASE_L3_SNP_FLIT_WIDTH + SCR_BASE_L3_SNP_DST_WIDTH)
)   i_l3_bk_snp_out_arb
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .in0_val_i          (d4_snp_out_val     ),
    .in0_data_i         ({d4_snp_out_flit, d4_snp_out_dst}),
    .in0_ready_o        (d4_snp_out_ready   ),

    .in1_val_i          (rob_snp_out_val    ),
    .in1_data_i         ({rob_snp_out_flit, rob_snp_out_dst}),
    .in1_ready_o        (rob_snp_out_ready  ),

    .out_val_o          (snp_out_arb_val    ),
    .out_data_o         ({snp_out_arb_flit, snp_out_arb_dst}),
    .out_ready_i        (snp_out_arb_ready  )
);

// Out fifo for SNP to NoC
scr_base_l3_bk_1w1r_outcrdt_fifo #(
    .SCR_BASE_DWIDTH    (SCR_BASE_L3_SNP_FLIT_WIDTH + SCR_BASE_L3_SNP_DST_WIDTH),
    .SCR_BASE_CRDT      (SCR_BASE_L3_SNP_B2N_CRDT   )
)   i_l3_bk_snp_out
(
    .rst_n              (rst_n              ),
    .clk                (clk                ),

    .wr_val_i           (snp_out_arb_val    ),
    .wr_data_i          ({snp_out_arb_flit, snp_out_arb_dst}),
    .wr_ready_o         (snp_out_arb_ready  ),

    .rd_val_o           (snp_out_val_o      ),
    .rd_data_o          ({snp_out_flit_o, snp_out_dst_o}),
    .rd_crdt_i          (snp_out_crdt_i     )
);

endmodule : scr_base_l3_bk

