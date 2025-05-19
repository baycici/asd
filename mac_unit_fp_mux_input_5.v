module mac_unit_fp_mux_input_5( clk, select, inst_a, inst_b, inst_c, inst_rnd, z_inst, status_inst );

parameter inst_sig_width = 23;
parameter inst_exp_width = 8;
parameter inst_ieee_compliance = 0;
parameter A_width = inst_sig_width+inst_exp_width+1;

input clk;
input [2:0] select;
input [A_width*5-1 : 0] inst_a;
input [inst_sig_width+inst_exp_width : 0] inst_b;
input [inst_sig_width+inst_exp_width : 0] inst_c;
input [2 : 0] inst_rnd;
output reg [inst_sig_width+inst_exp_width : 0] z_inst;
output reg [7 : 0] status_inst;

reg [2:0] select_;
reg [A_width*5-1 : 0] inst_a_;
reg [inst_sig_width+inst_exp_width : 0] _a;
reg [inst_sig_width+inst_exp_width : 0] inst_b_;
reg [inst_sig_width+inst_exp_width : 0] inst_c_;
reg [2 : 0] inst_rnd_;
wire [inst_sig_width+inst_exp_width : 0] z_inst_;
wire [7 : 0] status_inst_;

  always @ (*)
  begin
    select_ <= select;
    inst_a_ <= inst_a;
    inst_b_ <= inst_b;
    inst_c_ <= inst_c;
    inst_rnd_ <= inst_rnd;
    z_inst <= z_inst_;
    status_inst <= status_inst_;
  end

  always @(*)
  begin
    case (select_)
      3'b000   : _a = inst_a_[A_width*0 +: A_width];
      3'b001   : _a = inst_a_[A_width*1 +: A_width];
      3'b010   : _a = inst_a_[A_width*2 +: A_width];
      3'b011   : _a = inst_a_[A_width*3 +: A_width];
      3'b100   : _a = inst_a_[A_width*4 +: A_width];
    endcase
  end

// Instance of DW_fp_mac
DW_fp_mac #(inst_sig_width, inst_exp_width, inst_ieee_compliance) U1 (.a(_a), .b(inst_b_), .c(inst_c_), .rnd(inst_rnd_), .z(z_inst_), .status(status_inst_) );

endmodule
