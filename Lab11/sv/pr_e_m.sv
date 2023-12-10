module pr_e_m(
  input logic clk, reset,
  input logic [31:0] pcplus4_e,
  input logic regwrite_e, memwrite_e,
  input logic [1:0] memtoreg_e,
  input logic [31:0] aluout_e,
  input logic [31:0] writedata_e,
  input logic [4:0] writereg_e,
  output logic regwrite_m, memwrite_m,
  output logic [31:0] aluout_m,
  output logic [1:0] memtoreg_m,
  output logic [31:0] writedata_m, pcplus4_m,
  output logic [4:0] writereg_m
  );

  always_ff @ (posedge clk)
  if (reset) begin
    regwrite_m <= '0;
    memtoreg_m <= '0;
    memwrite_m <= '0;
    aluout_m <= '0;
    writedata_m <= '0;
    writereg_m <= '0;
  end
  else begin
    regwrite_m <= regwrite_e;
    memtoreg_m <= memtoreg_e;
    memwrite_m <= memwrite_e;
    aluout_m <= aluout_e;
    writedata_m <= writedata_e;
    writereg_m <= writereg_e;
    pcplus4_m <= pcplus4_e;
  end
endmodule: pr_e_m