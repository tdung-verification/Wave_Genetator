module IIR2(
	input clk,
	input [15:0] din, 
	output [15:0] dout
);

	reg signed [15:0] b0 = 163;
	reg signed [15:0] b1 = -325;
	reg signed [15:0] b2 = 163;
	reg signed [15:0] a1 = -32585;
	reg signed [15:0] a2 = 16203;
	
	reg signed [15:0] x0 = 0;
	reg signed [15:0] x1 = 0;
	reg signed [15:0] x2 = 0;
	reg signed [15:0] y1 = 0;
	reg signed [15:0] y2 = 0;
	reg signed [15:0] x3 = 0;
	reg signed [15:0] x4 = 0;
	reg signed [15:0] x5 = 0;
	reg signed [15:0] y3 = 0;
	reg signed [15:0] y4 = 0;
	
	wire [31:0] sum1;
	wire [31:0] sum;
	wire [15:0] dout1;
	always @ (posedge clk) begin
		x2 <= x1;
		x1 <= x0;
		x0 <= din;
		y2 <= y1;
		y1 <= dout1;
		
		x5 <= x4;
		x4 <= x3; 
		x3 <= dout1;
		y4 <= y3;
		y3 <= dout;
	end
	
	assign sum1 = x0 * b0 + x1 * b1 + x2 * b2 + y1 * (-a1) + y2 * (-a2);
	assign dout1 = sum1 >>> 14;
	
	assign sum = x3 * b0 + x4 * b1 + x5 * b2 + y3 * (-a1) + y4 * (-a2);
	assign dout = sum >>> 14;
	
endmodule