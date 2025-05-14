module phase_accumulator(
  input  logic i_clk, i_rst_n,
  input logic [9:0] i_PhaseStep,
  output logic [9:0] o_CurrentPhase
);
  logic [9:0] NextPhaseReg;
  logic [9:0] PhaseRegister;
  assign NextPhaseReg = PhaseRegister + i_PhaseStep;
  always_ff @(posedge i_clk) begin
    if(~i_rst_n)
	   PhaseRegister <= 10'b0;
	 else
	   PhaseRegister <= NextPhaseReg;
  end
  assign o_CurrentPhase = PhaseRegister;
endmodule