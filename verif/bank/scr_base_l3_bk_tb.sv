///
/// @file       <scr_base_l3_bk_tb.sv>
/// @brief      L3$ Bank test bench
/// @author     esk-sc
///
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.

`include "scr_base_l2_params.svh"
`include "scr_base_l2_types.svh"
`include "scr_base_l2_funcs.svh"
`include "scr_base_mtimer_core_params.svh"

module scr_base_l3_bk (
);

scr_base_l3_bk  i_l3_bk
(
    // Clock/Reset
    .rst_n              (),
    .clk                (),
    .idle               (),

    // DFT
    .test_mode          (),
    .test_rst_n         (),
    .test_se            (),

    // NoC Interface
    // REQ to L3 BANK
    .req_in_val_i       (),
    .req_in_flit_i      (),
    .req_in_crdt_o      (),

    // REQ from L3 BANK
    .req_out_val_o      (),
    .req_out_flit_o     (),
    .req_out_crdt_i     (),

    // DAT to L3 BANK
    .dat_in_val_i       (),
    .dat_in_flit_i      (),
    .dat_in_crdt_o      (),

    // DAT from L3 BANK
    .dat_out_val_o      (),
    .dat_out_flit_o     (),
    .dat_out_crdt_i     (),

    // RSP to L3 BANK
    .rsp_in_val_i       (),
    .rsp_in_flit_i      (),
    .rsp_in_crdt_o      (),

    // RSP from L3 BANK
    .rsp_out_val_o      (),
    .rsp_out_flit_o     (),
    .rsp_out_crdt_i     (),

`ifdef SCR_BASE_L3_EXTERNAL_SNP
    // SNP to L3 BANK
    .snp_in_val_i       (),
    .snp_in_flit_i      (),
    .snp_in_crdt_o      (),
'endif    

    // SNP from L3 BANK
    .snp_out_val_o      (),
    .snp_out_flit_o     (),
    .snp_out_dst_o      (),
    .snp_out_crdt_i     ()
);

endmodule : scr_base_l3_bk