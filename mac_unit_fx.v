module mac_unit_fx( clk, inst_A, inst_B, inst_C, inst_TC, SUM_inst);

  parameter A_width = 8;
  parameter B_width = 8;
  parameter SUM_width = 22;

  input clk;
  input [A_width-1 : 0] inst_A;
  input [B_width-1 : 0] inst_B;
  input [SUM_width-1 : 0] inst_C;
  input inst_TC;
  output reg [SUM_width-1 : 0] SUM_inst;

  reg [A_width-1 : 0] inst_A_;
  reg [B_width-1 : 0] inst_B_;
  reg [SUM_width-1 : 0] inst_C_;
  reg inst_TC_;
  wire [SUM_width-1 : 0] SUM_inst_;
  
  always @ (*)
  begin
    inst_A_ <= inst_A;
    inst_B_ <= inst_B;
    inst_C_ <= inst_C;
    inst_TC_ <= inst_TC;
    SUM_inst <= SUM_inst_;
  end

  // Instance of DW02_prod_sum1
  DW02_prod_sum1 #(A_width, B_width, SUM_width) U1 ( .A(inst_A_), .B(inst_B_), .C(inst_C_), .TC(inst_TC_), .SUM(SUM_inst_) );

endmodule
