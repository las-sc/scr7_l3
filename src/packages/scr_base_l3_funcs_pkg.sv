`ifndef __SCR_BASE_L3_FUNCS_PKG_DEFINED__
`define __SCR_BASE_L3_FUNCS_PKG_DEFINED__
///
/// @file       <scr_base_l3_funcs_pkg.svh>
/// @brief      L3 Function decloration
///
/// @authors    esk-sc
////
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.
///

// Calculate L3 Bank number using address
function automatic logic [SCR_BASE_L3_BANK_NUM_WIDTH-1:0] scr_base_l3_addr2banknum_calc_f(
    input logic [SCR_BASE_L3_ADDR_WIDTH-1:0] addr
);
    scr_base_l3_bnknum_calc_f[0] = addr[SCR_BASE_L3_CL_IL0_BASE];
    scr_base_l3_bnknum_calc_f[1] = addr[SCR_BASE_L3_CL_IL1_BASE];
    scr_base_l3_bnknum_calc_f[2] = addr[SCR_BASE_L3_CL_IL2_BASE];

endfunction

// Calculate hit in address diapason between mem_low, mem_high
function automatic logic scr_base_l3_addr_hit_f(
    input logic [SCR_BASE_L3_ADDR_WIDTH-1:0] addr,
    input logic [SCR_BASE_L3_ADDR_WIDTH-1:0] mem_low,
    input logic [SCR_BASE_L3_ADDR_WIDTH-1:0] mem_high
);
    scr_base_l3_addr_hit_f  =   (addr >= mem_low) & (addr <= mem_high);

endfunction

// Translation to ID
// Translation bank number to NOC ID
function automatic logic [SCR_BASE_CL3_NOC_DID_WIDTH-1:0] scr_base_l3_banknum2id_calc_f(
    input logic [SCR_BASE_L3_BANK_NUM_WIDTH-1:0] banknum
);
scr_base_l3_banknum2id_calc_f = SCR_BASE_CL3_NOC_DID_WIDTH'(0);
for (int ii = 0; ii < SCR_BASE_L3_BANK_NUM; ii=ii+1) begin
    scr_base_l3_banknum2id_calc_f   |=  (banknum ==  ii) ? `SCR_BASE_L3_NOC_BANK2NOCID(ii);
end

endfunction

// Translate MC vector with max one 1 to ID. In case zero vector, the result must be zero
function automatic logic [SCR_BASE_CL3_NOC_DID_WIDTH-1:0] scr_base_l3_mcv2id_calc_f(
    input logic [SCR_BASE_CL3_NOC_MC_NUM-1:0] mc_v
);
scr_base_l3_mcv2id_calc_f = SCR_BASE_CL3_NOC_DID_WIDTH'(0);
for (int ii = 0; ii < SCR_BASE_CL3_NOC_MC_NUM; ii=ii+1) begin
    scr_base_l3_mcv2id_calc_f   |=  mc_v[ii] ? `SCR_BASE_L3_NOC_MC2NOCID(ii);
end

endfunction

// Translate IO vector with max one 1 to ID. In case zero vector, the result must be zero
function automatic logic [SCR_BASE_CL3_NOC_DID_WIDTH-1:0] scr_base_l3_iov2id_calc_f(
    input logic [SCR_BASE_CL3_NOC_IO_NUM-1:0] io_v
);
scr_base_l3_iov2id_calc_f = SCR_BASE_CL3_NOC_DID_WIDTH'(0);
for (int ii = 0; ii < SCR_BASE_CL3_NOC_IO_NUM; ii=ii+1) begin
    scr_base_l3_iov2id_calc_f   |=  io_v[ii] ? `SCR_BASE_L3_NOC_IO2NOCID(ii);
end

endfunction

// Function, which calculate TGT ID, using calculated valid vectors for mem spaces, ID for MEM spaces
function automatic logic [SCR_BASE_CL3_NOC_DID_WIDTH-1:0] scr_base_l3_setid2tgtid_calc_f(
    input logic src_type, // Core - , Bank - , IO -
    input logic mc_v,
    input logic io_v,
    input logic cfg_v,
    input logic [SCR_BASE_CL3_NOC_DID_WIDTH-1:0] bank_id,
    input logic [SCR_BASE_CL3_NOC_DID_WIDTH-1:0] mc_id,
    input logic [SCR_BASE_CL3_NOC_DID_WIDTH-1:0] io_id,
    input logic [SCR_BASE_CL3_NOC_DID_WIDTH-1:0] cfg_id,
);
    scr_base_l3_setid2tgtid_calc_f  =   cfg_v   ?   cfg_id  :
                                        (src_type   ==  CORE) | (src_type   ==  IO)    ?   bank_id  :   ({SCR_BASE_CL3_NOC_DID_WIDTH{|mc_v}} & mc_id) | ({SCR_BASE_CL3_NOC_DID_WIDTH{|io_v}} & io_id);

endfunction

`endif //__SCR_BASE_L3_FUNCS_PKG_DEFINED__

