module decodFloor(
	input A, B,
	output a, b, c, d, e, f, g
);
	wire AnorB, nB;

	or or0(AnorB, A, B);
	not not0(nB, B);
	
	//output a
	not S_a(a, AnorB);
	
	//output b
	not S_b(b, 1'b1);
	
	//output c
	not S_c(c, nB);
	
	//output d
	not S_d(d, AnorB);
	
	//output e
	not S_e(e, B);
	
	//output f
	not S_f(f, 1'b0);
	
	//output g
	not S_g(g, AnorB);

endmodule
