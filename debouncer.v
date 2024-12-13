module debouncer(
	input clk, reset, L, 
	output y
);
	reg [1:0] state, nextstate;

	parameter A = 2'b00;
	parameter B = 2'b01;
	parameter C = 2'b11;

	always @ (posedge clk, posedge reset)
		if (reset) state <= A;
		else state <= nextstate;
	
	always @ (*)
		case (state)
			A : if (L) nextstate = B;
			else nextstate = A;
			B : if (L) nextstate = C;
			else nextstate = A;
			C : if (L) nextstate = C;
			else nextstate = A;
			default : nextstate = nextstate;
		endcase
	assign y = (state == B);

endmodule
