module fft(
	input clk, T, //rst,
	output reg Q,
	output Qn
);

  always @ (posedge clk) begin
    //if (rst)
      //Q <= 1'b0;
    //else
    	if (T)
      		Q <= ~Q;
    	else
      		Q <= Q;
  end
  assign Qn = ~Q;
endmodule
