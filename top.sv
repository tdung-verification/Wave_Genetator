    module top(
  input  logic i_clk_50M,
  input  logic [9:0] i_SW,
  input  logic [3:0] i_KEY,
  output logic o_BCLK,
  output logic o_DACLRC,
  output logic o_DACDAT,
  output logic o_XCLK,
  output logic o_i2c_scl,
  inout        io_i2c_sda
  
);
  logic clk_12M;
  logic press_KEY0;
  logic i2c_busy;
  logic ack_i2c;
  logic [7:0] i2c_addr;
  logic [15:0] i2c_data;
  logic clk_fsample;
  logic [31:0] data_parallel_DAC;
  logic data_serial_DAC;
  logic bclk;
  logic [15:0] data_16bit, data_fir, data_iir, data_fir_long;
  logic [15:0] data_DAC_out;
  
	pll pll_inst (
		.refclk   (i_clk_50M),   //  refclk.clk
		.rst      (~i_SW[9]),      //   reset.reset
		.outclk_0 (clk_12M), // outclk0.clk
		.locked   ()    //  locked.export
	);
  
  wave_generator w_generator(
    .i_clk_50M(i_clk_50M),
	 .i_clk_48K(clk_fsample), 
	 .i_clk_12M(clk_12M),
    .i_SW(i_SW),
    .i_KEY(i_KEY),
    .o_wave_out(data_16bit)
  );
//filter
  fir_89tap_lowpass fir_fillter( 
    .clock_50(clk_fsample),
    .x(data_16bit),
    .dout(data_fir)
  );

 
  IIR2 iir_fillter(
    .clk(clk_fsample),
    .din(data_16bit),
    .dout(data_iir)
  );
    fir fir_fillter_long( 
    .clk(clk_fsample),
    .noisy_signal(data_16bit),
    .filtered_signal(data_fir_long)
  );

  mux4to1 mux_4(
    .i_a(data_16bit),
	 .i_b(data_fir),
	 .i_c(data_iir),
	 .i_d(data_fir_long),
	 .i_sel(i_SW[1:0]),
	 .o_y(data_DAC_out)
  );
// DAC
  button button_debounce_1(
    .i_clk(i_clk_50M),
	 .i_rst_n(i_SW[9]),
    .i_button(i_KEY[0]),
    .o_stable(press_KEY0)
  );
  
  config_codec confic_i2c(
    .clk(i_clk_50M),
    .reset_n(i_SW[9]),
    .busy(i2c_busy),
    .is_config(press_KEY0),
    .done_config(),
    .ack_i2c(ack_i2c),
    .wr_rd(),
    .addr(i2c_addr)     ,
    .data_config(i2c_data)
  );

  i2c_protocol i2c(
    .i_clk(i_clk_50M),
    .i_rst_n(i_SW[9]),
    .i_i2c_send_flag(ack_i2c),
    .i_i2c_addr(i2c_addr),
    .i_i2c_data(i2c_data),
    .o_i2c_done(),
	 .o_i2c_busy(i2c_busy),
    .o_i2c_scl(o_i2c_scl),
    .io_i2c_sda(io_i2c_sda)
  );
  
  assign data_parallel_DAC[31:16] = data_DAC_out;
  assign data_parallel_DAC[15:0]  = data_DAC_out;
  
  parallel_serial send_data(
    .i_clk(clk_12M),
    .i_data_parallel(data_parallel_DAC),
    .o_bclk(bclk),
    .o_lrclk(clk_fsample),
    .o_data_serial(data_serial_DAC)
  );
  assign o_XCLK = clk_12M;
  assign o_DACLRC = clk_fsample;
  assign o_DACDAT = data_serial_DAC;
  assign o_BCLK = bclk;
endmodule