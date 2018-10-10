module fetch
	(input clk,
	output wire [63:0]atualREGA,
	output wire [63:0]atualREGB,
	output wire atualPC;
	output wire [1:0]SelMuxPC,
	);


wire [63:0]regULAout;
wire Z;
wire LT;
wire GT;
wire EG;
wire writeA;
wire writeB;
wire loadPC;
wire SellMuxPC;
wire tempA;
wire tempB;
wire atualREGA;
wire atualREGB;
wire atualREGEPC;
wire writeEPC;
wire SellMuxUlaA;
wire SellMuxUlaB;
wire SellMuxPC;
wire sulaA;
wire sulaB;
wire aluResult;
wire aluOut;
wire muxPCout;
wire radress;
wire wadress;
wire dataIn;
wire dataOut;
wire load_ir;
wire Entrada;
wire Instr19_15;
wire Instr24_20;
wire Instr11_7;
wire Instr6_0;
wire Instr31_0;
wire regreader1;
wire regreader2;
wire regwriteadress;
wire datain;
wire dataout1;
wire dataout2;
wire A;
wire B;
wire Seletor;
wire S;
wire Overflow;
wire Negativo;
wire z;
wire Igual;
wire Maior;
wire Menor;

register regPC(clk, 0, loadPC, SelMuxPC, atualPC);
register regA(clk, 0, writeA, tempA, atualREGA);
register regB(clk, 0, writeB, tempB, atualREGB);
register regULAout(clk, 0, writeEPC, atualPC, atualREGEPC);

muxUlaA muxulaA(SellMuxUlaA, atualPC, atualREGA, sulaA);
muxUlaA muxulaB(SellMuxUlaB, atualREGB, atualREGB, sulaB);
muxPC muxPC(SellMuxPC, aluResult, aluOut, muxPCout);

memoria32 memInst(radress, wadress, clk, dataIn, dataOut);
Instr_Reg_RISC_V(clk, 0, load_ir, Entrada, Instr19_15, Instr24_20, Instr11_7, Instr6_0, Instr31_0);
bancoReg(write, clk, 0, regreader1, regreader2, regwriteadress, datain, dataout1, dataout2);
Ula64(A, B, Seletor, S, Overflow, Negativo, z, Igual, Maior, Menor);

endmodule: main