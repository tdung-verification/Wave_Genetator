module ecgLUT (
  input  logic [9:0] i_addr,
  output logic [15:0] o_data
);
  parameter MEM_SIZE = 1024;
  logic [15:0] LUT_ecg [MEM_SIZE-1:0];
  
  always_comb begin : next_pc_ff
    o_data <= LUT_ecg[i_addr[9:0]];
  end : next_pc_ff
  
  
  initial begin
    integer i;
	 for (i=0; i < MEM_SIZE; i++) begin
	   LUT_ecg[i] = 16'b0;
	 end
	 $readmemh("C:/Users/TUAN/tailieuhocbk/nam4ki1/DSPonFPGA/HK242/lab2/project_2/LUT_ecg.dump",LUT_ecg);
  end

endmodule