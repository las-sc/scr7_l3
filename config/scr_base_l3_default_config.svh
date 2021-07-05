`ifndef __SCR_BASE_l3_DEFAULT_CONFIG__
`define __SCR_BASE_l3_DEFAULT_CONFIG__
///
/// @file     <scr_base_l3_default_config.svh>
/// @brief    Default parameters file
/// @authors  esk-sc
///
/// Copyright by Syntacore LLC (C) (2016 - 2021). ALL RIGHTS RESERVED. STRICTLY CONFIDENTIAL.
/// Information contained in this material is confidential and proprietary to Syntacore LLC
/// and its affiliates and may not be modified, copied, published, disclosed, distributed,
/// displayed or exhibited, in either electronic or printed formats without written
/// authorization of the Syntacore LLC. Subject to License Agreement.
///

// L3 Address
`define   SCR_BASE_L3_ADDR_WIDTH        48

// L3 State Parameters
`define   SCR_BASE_L3_BANK_NUM          8

// Core numbers
`define   SCR_BASE_L3_CORE_NUM          8

// Core numbers
`define   SCR_BASE_L3_BANK_WAY_NUM      8

// DATA width in DAT Flit
`define   SCR_BASE_L3_NOC_DAT_WIDTH     256


// NOC routing
`define SCR_BASE_L3_NOC_BANK2NOCID(BANK_NUM)    {3'h1, BANK_NUM[3:0]}
`define SCR_BASE_L3_NOC_CORE2NOCID(CORE_NUM)    {3'h0, CORE_NUM[3:0]}
`define SCR_BASE_L3_NOC_MC2NOCID(MC_NUM)        (MC_NUM == 0)   ?   {3'h0, 4'h8}    :   \
                                                (MC_NUM == 1)   ?   {3'h1, 4'h8}    :   \
                                                (MC_NUM == 2)   ?   {3'h0, 4'h9}    :   \
                                                                    {3'h1, 4'h9}
`define SCR_BASE_L3_NOC_IO2NOCID(IO_NUM)        {3'h0, 4'h9}

`define SCR_BASE_L3_NOC_RIGHT(NOC_COM_NUM, NOC_PNUM)      ((NOC_COM_NUM == 8) & (NOC_PNUM == 0))  ?   0   :   \
                                                (NOC_COM_NUM == 9)  ?   3   :   \
                                                (NOC_COM_NUM[1:0] == 2'h3)  ?   9   :   NOC_COM_NUM + 1
//`define SCR_BASE_L3_NOC_LEFT(NOC_COM_NUM, NOC_PNUM)       (NOC_COM_NUM == 8)  ?   4   :   (NOC_COM_NUM == 9)  ?   7   :   (NOC_COM_NUM[1:0] == 2'h0)  ?   8   :   NOC_COM_NUM - 1

`endif // __SCR_BASE_l3_DEFAULT_CONFIG__
