module decodLoad(
	input I2, I1, I0,
	output a, b, c, d, e, f, g
);
	wire nI2, nI1, nI0;
	wire AxorC, BxorC, ABC, nB_AxorC, AnB, BC, nA_BxorC, AnorB;
	
	not not0(nI2, I2);
	not not1(nI1, I1);
	not not2(nI0, I0);
	xor xor0(AxorC, I2, I0);
	xor xor1(BxorC, I1, I0);
	and and0(ABC, I2, I1, I0);
	and and1(nB_AxorC, nI1, AxorC);
	and and2(AnB, I2, nI1);
	and and3(BC, I1, I0);
	and and4(nA_BxorC, nI2, BxorC);
	nor nor0(AnorB, I2, I1);

	//output a
	and S_a(a, nI1, AxorC);
	
	//output b
	and S_b(b, I2, BxorC);
	
	//output c
	and S_c(c, nI2, I1, nI0);
	
	//output d
	or S_d(d, ABC, nB_AxorC);
	
	//output e
	or S_e(e, I0, AnB);

	//output f
	or S_f(f, BC, nA_BxorC);
	
	//otput g
	or S_g(g, AnorB, ABC);
	
endmodule