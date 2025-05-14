module amplitude_wave_sel(
  input  logic [15:0] i_wave,
  input  logic i_sel,
  output logic [15:0] o_wave_ampl
);
  logic [15:0] wave_ampl_temp;
  always_comb begin
    wave_ampl_temp = (i_sel) ? {i_wave[14:0],1'b0} : i_wave;
  end
  assign o_wave_ampl = wave_ampl_temp;
endmodule