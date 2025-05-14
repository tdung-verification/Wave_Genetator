module squareLUT (
  input  logic [9:0] i_addr,
  input  logic [3:0] i_sel,
  output logic [15:0] o_data
);
  parameter MEM_SIZE = 1024;
  logic [15:0] LUT_square10  [MEM_SIZE-1:0];
  logic [15:0] LUT_square20  [MEM_SIZE-1:0];
  logic [15:0] LUT_square30  [MEM_SIZE-1:0];
  logic [15:0] LUT_square40  [MEM_SIZE-1:0];
  logic [15:0] LUT_square50  [MEM_SIZE-1:0];
  logic [15:0] LUT_square60  [MEM_SIZE-1:0];
  logic [15:0] LUT_square70  [MEM_SIZE-1:0];
  logic [15:0] LUT_square80  [MEM_SIZE-1:0];
  logic [15:0] LUT_square90  [MEM_SIZE-1:0];
  logic [15:0] LUT_square100 [MEM_SIZE-1:0];
  
  always_comb begin : next_pc
    case(i_sel)
	   4'b0000: o_data = 16'b0;//duty_cycle 0%
		4'b0001: o_data = LUT_square10[i_addr[9:0]]; //duty_cycle 10%
		4'b0010: o_data = LUT_square20[i_addr[9:0]]; //duty_cycle 20%
		4'b0011: o_data = LUT_square30[i_addr[9:0]]; //duty_cycle 30%
		4'b0100: o_data = LUT_square40[i_addr[9:0]]; //duty_cycle 40%
		4'b0101: o_data = LUT_square50[i_addr[9:0]]; //duty_cycle 50%
		4'b0110: o_data = LUT_square60[i_addr[9:0]]; //duty_cycle 60%
		4'b0111: o_data = LUT_square70[i_addr[9:0]]; //duty_cycle 70%
		4'b1000: o_data = LUT_square80[i_addr[9:0]]; //duty_cycle 80%
		4'b1001: o_data = LUT_square90[i_addr[9:0]]; //duty_cycle 90%
		4'b1010: o_data = 16'b1111111111111111;
      default: o_data = 16'b0;
    endcase
  end : next_pc
  
  
  initial begin
    integer i;
	 for (i=0; i < MEM_SIZE; i++) begin
	   LUT_square10[i]  = 16'b0;
	   LUT_square20[i]  = 16'b0;
		LUT_square30[i]  = 16'b0;
		LUT_square40[i]  = 16'b0;
		LUT_square50[i]  = 16'b0;
		LUT_square60[i]  = 16'b0;
		LUT_square70[i]  = 16'b0;
		LUT_square80[i]  = 16'b0;
		LUT_square90[i]  = 16'b0;
	 end
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_square10.dump",LUT_square10);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_square20.dump",LUT_square20);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_square30.dump",LUT_square30);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_square40.dump",LUT_square40);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_square50.dump",LUT_square50);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_square60.dump",LUT_square60);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_square70.dump",LUT_square70);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_square80.dump",LUT_square80);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_square90.dump",LUT_square90);
  end

endmodule