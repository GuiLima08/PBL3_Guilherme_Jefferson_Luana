module contLoad(
	input clk, X, reset, P,
	output A,
	output [2:0] Q
);
	wire w_clk;
	reg [2:0] state, nextstate;
	
	parameter S0 = 3'b000;
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;
	parameter S5 = 3'b101;
	parameter S6 = 3'b110;
	parameter S7 = 3'b111;
	
	assign w_clk = clk & P;
	
	always @ (posedge w_clk, posedge reset)
		if (reset) state <= S0;
		else state <= nextstate;
	
	always @ (*)
		case (state)
			S0 : if (X) nextstate = S1;
			else nextstate = S0;
			S1 : if (X) nextstate = S2;
			else nextstate = S0;
			S2 : if (X) nextstate = S3;
			else nextstate = S1;
			S3 : if (X) nextstate = S4;
			else nextstate = S2;
			S4 : if (X) nextstate = S5;
			else nextstate = S3;
			S5 : if (X) nextstate = S6;
			else nextstate = S4;
			S6 : if (X) nextstate = S7;
			else nextstate = S5;
			S7 : if (X) nextstate = S7;
			else nextstate = S6;
			default : nextstate = nextstate;
		endcase

	assign Q = state;
	assign A = (state == S7);
endmodule
