module clkDivisor(
	input clk_50MHz,
	output clk_24Hz, clk_1525Hz, clk_1Hz, clk_762Hz
);
	wire [24:0] Q;
	wire n21, n15, n16;

	fft ff0(.T(1'b1), .clk(clk_50MHz), .Q(Q[0]));
	fft ff1(.T(1'b1), .clk(Q[0]), .Q(Q[1]));
	fft ff2(.T(1'b1), .clk(Q[1]), .Q(Q[2]));
	fft ff3(.T(1'b1), .clk(Q[2]), .Q(Q[3]));
	fft ff4(.T(1'b1), .clk(Q[3]), .Q(Q[4]));
	fft ff5(.T(1'b1), .clk(Q[4]), .Q(Q[5]));
	fft ff6(.T(1'b1), .clk(Q[5]), .Q(Q[6]));
	fft ff7(.T(1'b1), .clk(Q[6]), .Q(Q[7]));
	fft ff8(.T(1'b1), .clk(Q[7]), .Q(Q[8]));
	fft ff9(.T(1'b1), .clk(Q[8]), .Q(Q[9]));
	fft ff10(.T(1'b1), .clk(Q[9]), .Q(Q[10]));
	fft ff11(.T(1'b1), .clk(Q[10]), .Q(Q[11]));
	fft ff12(.T(1'b1), .clk(Q[11]), .Q(Q[12]));
	fft ff13(.T(1'b1), .clk(Q[12]), .Q(Q[13]));
	fft ff14(.T(1'b1), .clk(Q[13]), .Q(Q[14]));
	fft ff15(.T(1'b1), .clk(Q[14]), .Q(Q[15]));
	fft ff16(.T(1'b1), .clk(Q[15]), .Q(Q[16]));
	fft ff17(.T(1'b1), .clk(Q[16]), .Q(Q[17]));
	fft ff18(.T(1'b1), .clk(Q[17]), .Q(Q[18]));
	fft ff19(.T(1'b1), .clk(Q[18]), .Q(Q[19]));
	fft ff20(.T(1'b1), .clk(Q[19]), .Q(Q[20]));
	fft ff21(.T(1'b1), .clk(Q[20]), .Q(Q[21]));
	fft ff22(.T(1'b1), .clk(Q[21]), .Q(Q[22]));
	fft ff23(.T(1'b1), .clk(Q[22]), .Q(Q[23]));
	fft ff24(.T(1'b1), .clk(Q[23]), .Q(Q[24]));
	fft ff25(.T(1'b1), .clk(Q[24]), .Q(clk_1Hz));
	
	not(n21, Q[20]);
	not(n15, Q[14]);
	not(n16, Q[15]);
	not(clk_24Hz, n21);
	not(clk_1525Hz, n15);
	not(clk_762Hz, n16);

endmodule
