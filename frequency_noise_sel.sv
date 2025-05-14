module frequency_noise_sel(
  input  logic [1:0] i_sel,
  output logic [9:0] o_phase_step
);
  always_comb begin
    case(i_sel)
	   2'b00:  o_phase_step = 10'b10000;  //64 sample
		2'b01:  o_phase_step = 10'b100000; //32 sapmle
		2'b10:  o_phase_step = 10'b1000000; // 16 sample
		2'b11:  o_phase_step = 10'b10000000; // 8 sample
		default: o_phase_step = 10'b10000;
	 endcase
  end
endmodule