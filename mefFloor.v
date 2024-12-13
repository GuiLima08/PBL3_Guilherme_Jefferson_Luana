module mefFloor(
	input clk, reset, A, CH1, CH2, CH3,
	output [1:0] F,
	output P
);
	wire [3:0] E;
	assign E[3] = A;
	assign E[2] = CH1;
	assign E[1] = CH2;
	assign E[0] = CH3;
	reg [2:0] S, NS;
	
	parameter A0 = 3'b000;
	parameter A1 = 3'b001;
	parameter B0 = 3'b010;
	parameter B1 = 3'b011;
	parameter C0 = 3'b100;
	parameter C1 = 3'b101;
	
	
	always @ (posedge clk, posedge reset)
		if (reset) S <= NS;
		else S <= NS;
	
	always @ (*)
		case (S)
			A0 : if (E == 4'b0000) NS = A0;
			else if (E[3] | E[2]) NS = A1;
			else NS = B0;
			
			A1 : if (E[3] | E[2]) NS = A1;
			else NS = A0;
			
			B0 : if (E == 4'b0000) NS = B0;
			else if (E[3] | E[1]) NS = B1;
			else if (E == 4'b0001) NS = C0;
			else NS = A0;
			
			B1 : if (E[3] | E[1]) NS = B1;
			else NS = B0;
			
			C0 : if (E == 4'b0000) NS = C0;
			else if (E[3] | E[0]) NS = C1;
			else NS = B0;
			
			C1 : if (E[3] | E[0]) NS = C1;
			else NS = C0;
			
			default : NS = A0;
		endcase
		
	assign P = (S[0]);
	assign F = (S[2:1]);

endmodule
