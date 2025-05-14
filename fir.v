module fir ( 
  input clk,
  input signed [15:0] noisy_signal,
  output signed [15:0] filtered_signal
);

  integer i, j;
  reg signed [15:0] coeff [0:14];  // 15 tap
  reg signed [15:0] delayed_signal [0:14];
  reg signed [31:0] products [0:14];
  reg signed [35:0] acc;

  // Hệ số của bộ lọc FIR (15 tap)
  initial begin
    coeff[ 0] = 16'd13;   coeff[ 1] = 16'd28;   coeff[ 2] = 16'd66;
    coeff[ 3] = 16'd129;  coeff[ 4] = 16'd232;  coeff[ 5] = 16'd387;
    coeff[ 6] = 16'd603;  coeff[ 7] = 16'd882;  coeff[ 8] = 16'd1217;
    coeff[ 9] = 16'd1590; coeff[10] = 16'd1869; coeff[11] = 16'd1590;
    coeff[12] = 16'd1217; coeff[13] = 16'd882;  coeff[14] = 16'd603;
  end

  // Dịch dữ liệu đầu vào vào thanh ghi trễ
  always @(posedge clk) begin
    delayed_signal[0] <= noisy_signal;
    for (i = 14; i > 0; i = i - 1) begin
      delayed_signal[i] <= delayed_signal[i - 1];
    end
  end

  // Tính toán tích của dữ liệu và hệ số
  always @(posedge clk) begin
    for (j = 0; j <= 14; j = j + 1) begin
      products[j] <= delayed_signal[j] * coeff[j];
    end
  end

  // Tính tổng các sản phẩm
  always @(posedge clk) begin
    acc = 0;
    for (j = 0; j <= 14; j = j + 1) begin
      acc = acc + products[j];
    end
  end

  // Xuất tín hiệu đã lọc, scale lại từ Q29 về Q15
  assign filtered_signal = acc[35:14];

endmodule
