module triangleLUT (
  input  logic [9:0] i_addr,
  input  logic [3:0] i_sel,
  output logic [15:0] o_data
);
  parameter MEM_SIZE = 1024;
  logic [15:0] LUT_triangle0   [MEM_SIZE-1:0];
  logic [15:0] LUT_triangle10  [MEM_SIZE-1:0];
  logic [15:0] LUT_triangle20  [MEM_SIZE-1:0];
  logic [15:0] LUT_triangle30  [MEM_SIZE-1:0];
  logic [15:0] LUT_triangle40  [MEM_SIZE-1:0];
  logic [15:0] LUT_triangle50  [MEM_SIZE-1:0];
  logic [15:0] LUT_triangle60  [MEM_SIZE-1:0];
  logic [15:0] LUT_triangle70  [MEM_SIZE-1:0];
  logic [15:0] LUT_triangle80  [MEM_SIZE-1:0];
  logic [15:0] LUT_triangle90  [MEM_SIZE-1:0];
  logic [15:0] LUT_triangle100 [MEM_SIZE-1:0];
  
  always_comb begin : next_pc
    case(i_sel)
	   4'b0000: o_data = LUT_triangle0[i_addr[9:0]]; //duty_cycle 0%
		4'b0001: o_data = LUT_triangle10[i_addr[9:0]]; //duty_cycle 10%
		4'b0010: o_data = LUT_triangle20[i_addr[9:0]]; //duty_cycle 20%
		4'b0011: o_data = LUT_triangle30[i_addr[9:0]]; //duty_cycle 30%
		4'b0100: o_data = LUT_triangle40[i_addr[9:0]]; //duty_cycle 40%
		4'b0101: o_data = LUT_triangle50[i_addr[9:0]]; //duty_cycle 50%
		4'b0110: o_data = LUT_triangle60[i_addr[9:0]]; //duty_cycle 60%
		4'b0111: o_data = LUT_triangle70[i_addr[9:0]]; //duty_cycle 70%
		4'b1000: o_data = LUT_triangle80[i_addr[9:0]]; //duty_cycle 80%
		4'b1001: o_data = LUT_triangle90[i_addr[9:0]]; //duty_cycle 90%
		4'b1010: o_data = LUT_triangle100[i_addr[9:0]];//duty_cycle 100%
      default: o_data = 16'b0;
    endcase
  end : next_pc
  
  
  initial begin
    integer i;
	 for (i=0; i < MEM_SIZE; i++) begin
	   LUT_triangle10[i]  = 16'b0;
	   LUT_triangle20[i]  = 16'b0;
		LUT_triangle30[i]  = 16'b0;
		LUT_triangle40[i]  = 16'b0;
		LUT_triangle50[i]  = 16'b0;
		LUT_triangle60[i]  = 16'b0;
		LUT_triangle70[i]  = 16'b0;
		LUT_triangle80[i]  = 16'b0;
		LUT_triangle90[i]  = 16'b0;
		LUT_triangle100[i] = 16'b0;
	 end
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_triangle0.dump",LUT_triangle0);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_triangle10.dump",LUT_triangle10);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_triangle20.dump",LUT_triangle20);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_triangle30.dump",LUT_triangle30);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_triangle40.dump",LUT_triangle40);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_triangle50.dump",LUT_triangle50);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_triangle60.dump",LUT_triangle60);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_triangle70.dump",LUT_triangle70);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_triangle80.dump",LUT_triangle80);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_triangle90.dump",LUT_triangle90);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_triangle100.dump",LUT_triangle100);
  end

endmodule