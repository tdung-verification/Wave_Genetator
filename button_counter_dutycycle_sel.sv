module button_counter_dutycycle_sel(
  input  logic i_clk,
  input  logic i_rst_n,
  input  logic i_KEY,
  output logic [3:0] wave_sel
);
  logic [3:0] count;
  always_ff @(posedge i_clk) begin
    if(~i_rst_n) count <= 4'b0;
	 else if (~i_KEY) begin
	      count <= (count == 4'd10) ? 4'b0 : count + 4'b1;
	      end
  end
  assign wave_sel = count;
endmodule