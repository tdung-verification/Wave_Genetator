module wave_generator(
  input  logic i_clk_50M, i_clk_48K, i_clk_12M,
  input  logic [9:0] i_SW,
  input  logic [3:0] i_KEY,
  output logic [15:0] o_wave_out
);

  logic [9:0] phase_step, wave_addr, phase_step_noise, noise_addr;
  logic [15:0] sine_wave, square_wave, triangle_wave, sawtooth_wave, noise_wave, ecg_wave;
  logic [1:0] freq_wave_sel, freq_noise_sel;
  logic [3:0] duty_cycle_sel;
  logic noise_ampl_sel, noise_enable, wave_ampl_sel;
  logic [15:0] noiseless_wave, noise_plus_wave, wave_out, noise_wave_ampl;
  logic [2:0] wave_sel;
  logic press_KEY1, press_KEY2;
  
//sW  
  assign noise_enable   = i_SW[2];
  assign freq_wave_sel  = i_SW[4:3];
  assign wave_ampl_sel  = i_SW[5];
  assign freq_noise_sel = i_SW[7:6];
  assign noise_ampl_sel = i_SW[8];
  
//key
  button button_debounce_1(
    .i_clk(i_clk_50M),
	 .i_rst_n(i_SW[9]),
    .i_button(i_KEY[1]),
    .o_stable(press_KEY1)
  );
  
  button_counter_wave_sel counter_wave_sel(
    .i_clk(i_clk_50M),
    .i_rst_n(i_SW[9]),
    .i_KEY(press_KEY1),
    .wave_sel(wave_sel)
  );
  
  button button_debounce_2(
    .i_clk(i_clk_50M),
	 .i_rst_n(i_SW[9]),
    .i_button(i_KEY[2]),
    .o_stable(press_KEY2)
  );
  button_counter_dutycycle_sel counter_dutycycle_sel(
    .i_clk(i_clk_50M),
    .i_rst_n(i_SW[9]),
    .i_KEY(press_KEY2),
    .wave_sel(duty_cycle_sel)
  );
//  
  frequency_wave_sel wave_sel_freq(
    .i_sel(freq_wave_sel),
    .o_phase_step(phase_step)
  );

  phase_accumulator freq_divide(
    .i_clk(i_clk_48K),
	 .i_rst_n(i_SW[9]),
    .i_PhaseStep(phase_step),
    .o_CurrentPhase(wave_addr)
  );

  sineLUT sine_lut (
    .i_addr(wave_addr),
    .o_data(sine_wave)
  );
  
  squareLUT square_lut (
    .i_addr(wave_addr),
    .i_sel(duty_cycle_sel),
    .o_data(square_wave)
  );
  
  triangleLUT triangle_lut (
    .i_addr(wave_addr),
    .i_sel(duty_cycle_sel),
    .o_data(triangle_wave)
  );

  sawtoothLUT sawtooth_lut (
    .i_addr(wave_addr),
    .i_sel(duty_cycle_sel),
    .o_data(sawtooth_wave)
  );
  
  ecgLUT ecg_lut (
    .i_addr(wave_addr),
    .o_data(ecg_wave)
  );
  
//noise
  frequency_noise_sel noise_sel_freq(
    .i_sel(freq_noise_sel),
    .o_phase_step(phase_step_noise)
  );
  phase_accumulator freq_divide_noise(
    .i_clk(i_clk_48K),
	 .i_rst_n(i_SW[9]),
    .i_PhaseStep(phase_step_noise),
    .o_CurrentPhase(noise_addr)
  );

  noiseLUT noise_lut (
    .i_addr(noise_addr),
    .o_data(noise_wave)
  );
  amplitude_wave_sel ampli_noise(
    .i_wave(noise_wave),
    .i_sel(noise_ampl_sel),
    .o_wave_ampl(noise_wave_ampl));
// 
  always_comb begin
    case(wave_sel)
	   3'b000:  noiseless_wave = sine_wave;   //sine wave
		3'b001:  noiseless_wave = square_wave; //square wave
		3'b010:  noiseless_wave = triangle_wave;//triangle wave
		3'b011:  noiseless_wave = sawtooth_wave;//sawtooth wave
		3'b100:  noiseless_wave = ecg_wave;
		3'b101:  noiseless_wave = noise_wave_ampl;
		default: noiseless_wave = sine_wave;
	 endcase
  end

  assign noise_plus_wave = noiseless_wave + noise_wave_ampl;
  assign wave_out = (noise_enable) ? noise_plus_wave : noiseless_wave;
  
  amplitude_wave_sel ampli_wave(
    .i_wave(wave_out),
    .i_sel(wave_ampl_sel),
    .o_wave_ampl(o_wave_out)
  );

endmodule