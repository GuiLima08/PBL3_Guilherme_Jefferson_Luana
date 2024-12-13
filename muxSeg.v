module muxSeg(
	input S, 
	output AX, BX,
	input [6:0] A, B,
	output [6:0] X
);
	
	assign X[0] = ((A[0] & S) | (B[0] & !S));
	assign X[1] = ((A[1] & S) | (B[1] & !S));
	assign X[2] = ((A[2] & S) | (B[2] & !S));
	assign X[3] = ((A[3] & S) | (B[3] & !S));
	assign X[4] = ((A[4] & S) | (B[4] & !S));
	assign X[5] = ((A[5] & S) | (B[5] & !S));
	assign X[6] = ((A[6] & S) | (B[6] & !S));
	
	assign AX = (S);
	assign BX = (!S);

endmodule
