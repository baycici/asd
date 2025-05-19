module mac_unit_fp( clk, inst_a, inst_b, inst_c, inst_rnd, z_inst, status_inst );

parameter inst_sig_width = 23;
parameter inst_exp_width = 8;
parameter inst_ieee_compliance = 0;

input clk;
input [inst_sig_width+inst_exp_width : 0] inst_a;
input [inst_sig_width+inst_exp_width : 0] inst_b;
input [inst_sig_width+inst_exp_width : 0] inst_c;
input [2 : 0] inst_rnd;
output reg [inst_sig_width+inst_exp_width : 0] z_inst;
output reg [7 : 0] status_inst;

reg [inst_sig_width+inst_exp_width : 0] inst_a_;
reg [inst_sig_width+inst_exp_width : 0] inst_b_;
reg [inst_sig_width+inst_exp_width : 0] inst_c_;
reg [2 : 0] inst_rnd_;
wire [inst_sig_width+inst_exp_width : 0] z_inst_;
wire [7 : 0] status_inst_;

  always @ (*)
  begin
    inst_a_ <= inst_a;
    inst_b_ <= inst_b;
    inst_c_ <= inst_c;
    inst_rnd_ <= inst_rnd;
    z_inst <= z_inst_;
    status_inst <= status_inst_;
  end

// Instance of DW_fp_mac
DW_fp_mac #(inst_sig_width, inst_exp_width, inst_ieee_compliance) U1 (.a(inst_a_), .b(inst_b_), .c(inst_c_), .rnd(inst_rnd_), .z(z_inst_), .status(status_inst_) );

endmodule
