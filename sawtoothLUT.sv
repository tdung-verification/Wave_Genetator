module sawtoothLUT (
  input  logic [9:0] i_addr,
  input  logic [3:0] i_sel,
  output logic [15:0] o_data
);
  parameter MEM_SIZE = 1024;
  logic [15:0] LUT_sawtooth10  [MEM_SIZE-1:0];
  logic [15:0] LUT_sawtooth20  [MEM_SIZE-1:0];
  logic [15:0] LUT_sawtooth30  [MEM_SIZE-1:0];
  logic [15:0] LUT_sawtooth40  [MEM_SIZE-1:0];
  logic [15:0] LUT_sawtooth50  [MEM_SIZE-1:0];
  logic [15:0] LUT_sawtooth60  [MEM_SIZE-1:0];
  logic [15:0] LUT_sawtooth70  [MEM_SIZE-1:0];
  logic [15:0] LUT_sawtooth80  [MEM_SIZE-1:0];
  logic [15:0] LUT_sawtooth90  [MEM_SIZE-1:0];
  logic [15:0] LUT_sawtooth100 [MEM_SIZE-1:0];
  
  always_comb begin : next_pc
    case(i_sel)
	   4'b0000: o_data = 16'b0;//duty_cycle 0%
		4'b0001: o_data = LUT_sawtooth10[i_addr[9:0]]; //duty_cycle 10%
		4'b0010: o_data = LUT_sawtooth20[i_addr[9:0]]; //duty_cycle 20%
		4'b0011: o_data = LUT_sawtooth30[i_addr[9:0]]; //duty_cycle 30%
		4'b0100: o_data = LUT_sawtooth40[i_addr[9:0]]; //duty_cycle 40%
		4'b0101: o_data = LUT_sawtooth50[i_addr[9:0]]; //duty_cycle 50%
		4'b0110: o_data = LUT_sawtooth60[i_addr[9:0]]; //duty_cycle 60%
		4'b0111: o_data = LUT_sawtooth70[i_addr[9:0]]; //duty_cycle 70%
		4'b1000: o_data = LUT_sawtooth80[i_addr[9:0]]; //duty_cycle 80%
		4'b1001: o_data = LUT_sawtooth90[i_addr[9:0]]; //duty_cycle 90%
		4'b1010: o_data = LUT_sawtooth100[i_addr[9:0]];//duty_cycle 100%
      default: o_data = 16'b0;
    endcase
  end : next_pc
  
  
  initial begin
    integer i;
	 for (i=0; i < MEM_SIZE; i++) begin
	   LUT_sawtooth10[i]  = 16'b0;
	   LUT_sawtooth20[i]  = 16'b0;
		LUT_sawtooth30[i]  = 16'b0;
		LUT_sawtooth40[i]  = 16'b0;
		LUT_sawtooth50[i]  = 16'b0;
		LUT_sawtooth60[i]  = 16'b0;
		LUT_sawtooth70[i]  = 16'b0;
		LUT_sawtooth80[i]  = 16'b0;
		LUT_sawtooth90[i]  = 16'b0;
		LUT_sawtooth100[i] = 16'b0;
	 end
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_sawtooth10.dump",LUT_sawtooth10);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_sawtooth20.dump",LUT_sawtooth20);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_sawtooth30.dump",LUT_sawtooth30);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_sawtooth40.dump",LUT_sawtooth40);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_sawtooth50.dump",LUT_sawtooth50);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_sawtooth60.dump",LUT_sawtooth60);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_sawtooth70.dump",LUT_sawtooth70);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_sawtooth80.dump",LUT_sawtooth80);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_sawtooth90.dump",LUT_sawtooth90);
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_sawtooth100.dump",LUT_sawtooth100);
  end

endmodule