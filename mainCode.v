module mainCode(
	input b_up, clk_in, CHX, CH1, CH2, CH3,
	output [6:0] seg_out, mat_lines,
	output [4:0] seg_ctrl, mat_collumns,
	output alarm, rgb_red, rgb_green
);
	wire [6:0] segA, segB;
	wire [2:0] load_out;
	wire [1:0] floor_out, direct;
	wire clk_26, clk_21, clk_16, clk_15, n_up, up, w_alarm, w_door, MU, MM, MD;
	not(n_up, b_up);
	
	//divisor de clock
	clkDivisor clkdiv(
		.clk_50MHz(clk_in), .clk_24Hz(clk_21),
		.clk_1525Hz(clk_15), .clk_1Hz(clk_26),
		.clk_762Hz(clk_16)
	);
	
	//level to pulse
	debouncer db1(
		.reset(1'b0), .L(n_up), .clk(clk_21), .y(up)
	);
	
	//contador de pessoas no elevador
	contLoad contp(
		.clk(up), .X(CHX), .A(w_alarm),
		.reset(1'b0), .Q(load_out), .P(w_door)
	);
	
	//decodificador de 7 seg do numero de pessoas
	decodLoad decodp(
		.I2(load_out[2]), .I1(load_out[1]), .I0(load_out[0]),
		.a(segA[6]), .b(segA[5]), .c(segA[4]), .d(segA[3]),
		.e(segA[2]), .f(segA[1]), .g(segA[0])
	);
	
	//maquina de estados dos andares
	mefFloor mefloor(
		.P(w_door), .A(w_alarm), .clk(clk_26),
		.reset(1'b0), .CH1(CH1), .CH2(CH2),
		.CH3(CH3), .F(floor_out)
	);
	
	//decodificador do numero do andar
	decodFloor decodf(
		.A(floor_out[1]), .B(floor_out[0]), .a(segB[6]),
		.b(segB[5]), .c(segB[4]), .d(segB[3]),
		.e(segB[2]), .f(segB[1]), .g(segB[0])
	);
	
	//multiplexador do display
	muxSeg multi(
		.S(clk_15), .A(segA), .B(segB), .X(seg_out),
		.AX(seg_ctrl[3]), .BX(seg_ctrl[0])
	);
	
	//maquina de estados do sentido do elevador (matriz)
	directLogic(
		.P(w_door), .CH1(CH1), .CH2(CH2), .CH3(CH3),
		.A(floor_out), .MU(MU), .MM(MM), .MD(MD)
	);
	
	//controle de matriz
	assign mat_collumns = 5'b11111;
	assign mat_lines[6] = MD;
	assign mat_lines[5] = MD;
	assign mat_lines[4] = MM;
	assign mat_lines[3] = MM;
	assign mat_lines[2] = MM;
	assign mat_lines[1] = MU;
	assign mat_lines[0] = MU;
	
	//controle de LED RGB
	assign rgb_red = w_alarm | !w_door;
	assign rgb_green = !w_alarm;
	
	//Alarme
	assign alarm = w_alarm & clk_16;
	
	//Controle do display
	assign seg_ctrl[4] = 1'b1;
	assign seg_ctrl[2] = 1'b1;
	assign seg_ctrl[1] = 1'b1;
	
endmodule
