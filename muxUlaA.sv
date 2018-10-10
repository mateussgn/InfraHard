module main
	(input clk,
	 output wire [63:0]atualREGA,
	 output wire [63:0]atualREGB,
	 output wire [1:0]SelMuxPC
	);

register regPC(clk, 0, loadPC);
register regA(clk, 0, writeA, );
register regB(clk, 0, writeB, );



endmodule: main