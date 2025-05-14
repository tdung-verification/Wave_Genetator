module frequency_wave_sel(
  input  logic [1:0] i_sel,
  output logic [9:0] o_phase_step
);
  always_comb begin
    case(i_sel)
	   2'b00:  o_phase_step = 10'b1;  //1024 sample
		2'b01:  o_phase_step = 10'b10; //512 sapmle
		2'b10:  o_phase_step = 10'b100; // 256 sample
		default: o_phase_step = 10'b1;
	 endcase
  end
endmodule