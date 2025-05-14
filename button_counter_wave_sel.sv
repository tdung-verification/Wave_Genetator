module button_counter_wave_sel(
  input  logic i_clk,
  input  logic i_rst_n,
  input  logic i_KEY,
  output logic [2:0] wave_sel
);
  logic [2:0] count;
  always_ff @(posedge i_clk) begin
    if(~i_rst_n) count <= 3'b0;
	 else if (~i_KEY) begin
	      count <= (count == 3'b101) ? 3'b0 : count + 3'b1;
	      end
  end
  assign wave_sel = count;
endmodule