module directLogic(
	input P, CH1, CH2, CH3,
	input [1:0] A,
	output MU, MM, MD
);
	reg [1:0] D;
	parameter A1 = 2'b00;
	parameter A2 = 2'b01;
	parameter A3 = 2'b10;
	parameter De = A1;
	parameter Su = A2;
	parameter Pa = A3;
	
	always @ (*)
		if ((P) | (!CH1 & !CH2 & !CH3)) D <= Pa;
		else begin
			case (A)
				A1: if (CH1) D <= Pa;
				else D <= Su;
				
				A2: if (CH2) D <= Pa;
				else if (CH1) D <= De;
				else D <= Su;
				
				A3: if (CH3) D <= Pa;
				else D <= De;
				
				default: D <= Pa;
			endcase
		end
	
	assign MU = !D[0];
	assign MM = !D[1];
	assign MD = (D[1] | D[0]);
	
endmodule
