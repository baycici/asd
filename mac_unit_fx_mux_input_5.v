module mac_unit_fx_mux_input_8( clk, select, inst_A, inst_B, inst_C, inst_TC, SUM_inst);

  parameter A_width = 8;
  parameter B_width = 8;
  parameter SUM_width = 22;

  input clk;
  input [2:0] select;
  input [A_width*5-1 : 0] inst_A;
  input [B_width-1 : 0] inst_B;
  input [SUM_width-1 : 0] inst_C;
  input inst_TC;
  output reg [SUM_width-1 : 0] SUM_inst;

  reg [2:0] select_;
  reg [A_width*5-1 : 0] inst_A_;
  reg [A_width-1 : 0] _a;
  reg [B_width-1 : 0] inst_B_;
  reg [SUM_width-1 : 0] inst_C_;
  reg inst_TC_;
  wire [SUM_width-1 : 0] SUM_inst_;
  
  always @ (*)
  begin
    select_ <= select;
    inst_A_ <= inst_A;
    inst_B_ <= inst_B;
    inst_C_ <= inst_C;
    inst_TC_ <= inst_TC;
    SUM_inst <= SUM_inst_;
  end

  always @(*)
  begin
    case (select_)
      3'b000   : _a = inst_A_[A_width*0 +: A_width];
      3'b001   : _a = inst_A_[A_width*1 +: A_width];
      3'b010   : _a = inst_A_[A_width*2 +: A_width];
      3'b011   : _a = inst_A_[A_width*3 +: A_width];
      3'b100   : _a = inst_A_[A_width*4 +: A_width];
    endcase
  end

  // Instance of DW02_prod_sum1
  DW02_prod_sum1 #(A_width, B_width, SUM_width) U1 ( .A(_a), .B(inst_B_), .C(inst_C_), .TC(inst_TC_), .SUM(SUM_inst_) );

endmodule
