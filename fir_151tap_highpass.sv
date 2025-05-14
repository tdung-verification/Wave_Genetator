module fir_151tap_highpass(
    input signed [15:0] x,
    input clock_50,
    output signed [15:0] dout
);

    reg signed [15:0] x1;
    reg signed [31:0] xm [0:75];
    reg signed [31:0] xp [0:150];
    reg signed [31:0] xm1 [0:75];

reg signed [15:0] c0   = 0;     // round(0.000010 * 16384) = 0
reg signed [15:0] c1   = 0;     // round(0.000012 * 16384) = 0
reg signed [15:0] c2   = 0;     // round(0.000009 * 16384) = 0
reg signed [15:0] c3   = 0;     // round(-0.000000 * 16384) = 0
reg signed [15:0] c4   = 0;     // round(-0.000015 * 16384) = 0
reg signed [15:0] c5   = -1;    // round(-0.000036 * 16384) = -1
reg signed [15:0] c6   = -1;    // round(-0.000059 * 16384) = -1
reg signed [15:0] c7   = -1;    // round(-0.000079 * 16384) = -1
reg signed [15:0] c8   = -1;    // round(-0.000089 * 16384) = -1
reg signed [15:0] c9   = -1;    // round(-0.000082 * 16384) = -1
reg signed [15:0] c10  = -1;    // round(-0.000053 * 16384) = -1
reg signed [15:0] c11  = 0;     // round(-0.000000 * 16384) = 0
reg signed [15:0] c12  = 1;     // round(0.000073 * 16384) = 1
reg signed [15:0] c13  = 3;     // round(0.000158 * 16384) = 3
reg signed [15:0] c14  = 4;     // round(0.000240 * 16384) = 4
reg signed [15:0] c15  = 5;     // round(0.000300 * 16384) = 5
reg signed [15:0] c16  = 5;     // round(0.000318 * 16384) = 5
reg signed [15:0] c17  = 5;     // round(0.000278 * 16384) = 5
reg signed [15:0] c18  = 3;     // round(0.000171 * 16384) = 3
reg signed [15:0] c19  = 0;     // round(-0.000000 * 16384) = 0
reg signed [15:0] c20  = -4;    // round(-0.000219 * 16384) = -4
reg signed [15:0] c21  = -7;    // round(-0.000456 * 16384) = -7
reg signed [15:0] c22  = -11;   // round(-0.000668 * 16384) = -11
reg signed [15:0] c23  = -13;   // round(-0.000809 * 16384) = -13
reg signed [15:0] c24  = -14;   // round(-0.000834 * 16384) = -14
reg signed [15:0] c25  = -12;   // round(-0.000710 * 16384) = -12
reg signed [15:0] c26  = -7;    // round(-0.000426 * 16384) = -7
reg signed [15:0] c27  = 0;     // round(-0.000000 * 16384) = 0
reg signed [15:0] c28  = 9;     // round(0.000521 * 16384) = 9
reg signed [15:0] c29  = 17;    // round(0.001061 * 16384) = 17
reg signed [15:0] c30  = 25;    // round(0.001525 * 16384) = 25
reg signed [15:0] c31  = 30;    // round(0.001812 * 16384) = 30
reg signed [15:0] c32  = 30;    // round(0.001835 * 16384) = 30
reg signed [15:0] c33  = 25;    // round(0.001536 * 16384) = 25
reg signed [15:0] c34  = 15;    // round(0.000908 * 16384) = 15
reg signed [15:0] c35  = 0;     // round(-0.000000 * 16384) = 0
reg signed [15:0] c36  = -18;   // round(-0.001078 * 16384) = -18
reg signed [15:0] c37  = -35;   // round(-0.002166 * 16384) = -35
reg signed [15:0] c38  = -50;   // round(-0.003073 * 16384) = -50
reg signed [15:0] c39  = -59;   // round(-0.003608 * 16384) = -59
reg signed [15:0] c40  = -59;   // round(-0.003612 * 16384) = -59
reg signed [15:0] c41  = -49;   // round(-0.002993 * 16384) = -49
reg signed [15:0] c42  = -29;   // round(-0.001751 * 16384) = -29
reg signed [15:0] c43  = 0;     // round(-0.000000 * 16384) = 0
reg signed [15:0] c44  = 33;    // round(0.002043 * 16384) = 33
reg signed [15:0] c45  = 67;    // round(0.004074 * 16384) = 67
reg signed [15:0] c46  = 94;    // round(0.005740 * 16384) = 94
reg signed [15:0] c47  = 110;   // round(0.006697 * 16384) = 110
reg signed [15:0] c48  = 109;   // round(0.006667 * 16384) = 109
reg signed [15:0] c49  = 90;    // round(0.005498 * 16384) = 90
reg signed [15:0] c50  = 53;    // round(0.003205 * 16384) = 53
reg signed [15:0] c51  = 0;     // round(-0.000000 * 16384) = 0
reg signed [15:0] c52  = -61;   // round(-0.003721 * 16384) = -61
reg signed [15:0] c53  = -121;  // round(-0.007412 * 16384) = -121
reg signed [15:0] c54  = -171;  // round(-0.010446 * 16384) = -171
reg signed [15:0] c55  = -200;  // round(-0.012206 * 16384) = -200
reg signed [15:0] c56  = -200;  // round(-0.012186 * 16384) = -200
reg signed [15:0] c57  = -165;  // round(-0.010093 * 16384) = -165
reg signed [15:0] c58  = -97;   // round(-0.005921 * 16384) = -97
reg signed [15:0] c59  = 0;     // round(-0.000000 * 16384) = 0
reg signed [15:0] c60  = 115;   // round(0.007002 * 16384) = 115
reg signed [15:0] c61  = 232;   // round(0.014133 * 16384) = 232
reg signed [15:0] c62  = 332;   // round(0.020244 * 16384) = 332
reg signed [15:0] c63  = 395;   // round(0.024134 * 16384) = 395
reg signed [15:0] c64  = 405;   // round(0.024696 * 16384) = 405
reg signed [15:0] c65  = 345;   // round(0.021081 * 16384) = 345
reg signed [15:0] c66  = 210;   // round(0.012836 * 16384) = 210
reg signed [15:0] c67  = 0;     // round(-0.000000 * 16384) = 0
reg signed [15:0] c68  = -276;  // round(-0.016853 * 16384) = -276
reg signed [15:0] c69  = -600;  // round(-0.036641 * 16384) = -600
reg signed [15:0] c70  = -948;  // round(-0.057864 * 16384) = -948
reg signed [15:0] c71  = -1290; // round(-0.078751 * 16384) = -1290
reg signed [15:0] c72  = -1596; // round(-0.097453 * 16384) = -1596
reg signed [15:0] c73  = -1839; // round(-0.112246 * 16384) = -1839
reg signed [15:0] c74  = -1994; // round(-0.121732 * 16384) = -1994
reg signed [15:0] c75  = 14336; // round(0.875000 * 16384) = 14336


    wire signed [31:0] ADD [0:150];
    assign xm1[0] = x1*c0;
	 assign xm1[1] = x1*c1;
    always @ (posedge clock_50) begin
        x1 <= x;
    end
assign xm1[0]  = x1 * c0;
assign xm1[1]  = xm1[0];
assign xm1[2]  = xm1[0];
assign xm1[3]  = xm1[0];
assign xm1[4]  = xm1[0];
assign xm1[5]  = x1 * c5;
assign xm1[6]  = xm1[5];
assign xm1[7]  = xm1[5];
assign xm1[8]  = xm1[5];
assign xm1[9]  = xm1[5];
assign xm1[10] = xm1[5];
assign xm1[11] = xm1[0];
assign xm1[12] = x1 * c12;
assign xm1[13] = x1 * c13;
assign xm1[14] = x1 * c14;
assign xm1[15] = x1 * c15;
assign xm1[16] = xm1[15];
assign xm1[17] = xm1[15];
assign xm1[18] = xm1[13];
assign xm1[19] = xm1[0];
assign xm1[20] = x1 * c20;
assign xm1[21] = x1 * c21;
assign xm1[22] = x1 * c22;
assign xm1[23] = x1 * c23;
assign xm1[24] = x1 * c24;
assign xm1[25] = x1 * c25;
assign xm1[26] = xm1[21];
assign xm1[27] = xm1[0];
assign xm1[28] = x1 * c28;
assign xm1[29] = x1 * c29;
assign xm1[30] = x1 * c30;
assign xm1[31] = x1 * c31;
assign xm1[32] = xm1[31];
assign xm1[33] = xm1[30];
assign xm1[34] = x1 * c34;
assign xm1[35] = xm1[0];
assign xm1[36] = x1 * c36;
assign xm1[37] = x1 * c37;
assign xm1[38] = x1 * c38;
assign xm1[39] = x1 * c39;
assign xm1[40] = xm1[39];
assign xm1[41] = x1 * c41;
assign xm1[42] = x1 * c42;
assign xm1[43] = xm1[0];
assign xm1[44] = x1 * c44;
assign xm1[45] = x1 * c45;
assign xm1[46] = x1 * c46;
assign xm1[47] = x1 * c47;
assign xm1[48] = x1 * c48;
assign xm1[49] = x1 * c49;
assign xm1[50] = x1 * c50;
assign xm1[51] = xm1[0];
assign xm1[52] = x1 * c52;
assign xm1[53] = x1 * c53;
assign xm1[54] = x1 * c54;
assign xm1[55] = x1 * c55;
assign xm1[56] = xm1[55];
assign xm1[57] = x1 * c57;
assign xm1[58] = x1 * c58;
assign xm1[59] = xm1[0];
assign xm1[60] = x1 * c60;
assign xm1[61] = x1 * c61;
assign xm1[62] = x1 * c62;
assign xm1[63] = x1 * c63;
assign xm1[64] = x1 * c64;
assign xm1[65] = x1 * c65;
assign xm1[66] = x1 * c66;
assign xm1[67] = xm1[0];
assign xm1[68] = x1 * c68;
assign xm1[69] = x1 * c69;
assign xm1[70] = x1 * c70;
assign xm1[71] = x1 * c71;
assign xm1[72] = x1 * c72;
assign xm1[73] = x1 * c73;
assign xm1[74] = x1 * c74;
assign xm1[75] = x1 * c75;

    always @ (posedge clock_50) begin
	 
xm[0]  <= xm1[0];
xm[1]  <= xm1[0];
xm[2]  <= xm1[2];
xm[3]  <= xm1[3];
xm[4]  <= xm1[4];
xm[5]  <= xm1[5];
xm[6]  <= xm1[6];
xm[7]  <= xm1[7];
xm[8]  <= xm1[8];
xm[9]  <= xm1[9];
xm[10] <= xm1[10];
xm[11] <= xm1[11];
xm[12] <= xm1[12];
xm[13] <= xm1[13];
xm[14] <= xm1[14];
xm[15] <= xm1[15];
xm[16] <= xm1[16];
xm[17] <= xm1[17];
xm[18] <= xm1[18];
xm[19] <= xm1[19];
xm[20] <= xm1[20];
xm[21] <= xm1[21];
xm[22] <= xm1[22];
xm[23] <= xm1[23];
xm[24] <= xm1[24];
xm[25] <= xm1[25];
xm[26] <= xm1[26];
xm[27] <= xm1[27];
xm[28] <= xm1[28];
xm[29] <= xm1[29];
xm[30] <= xm1[30];
xm[31] <= xm1[31];
xm[32] <= xm1[32];
xm[33] <= xm1[33];
xm[34] <= xm1[34];
xm[35] <= xm1[35];
xm[36] <= xm1[36];
xm[37] <= xm1[37];
xm[38] <= xm1[38];
xm[39] <= xm1[39];
xm[40] <= xm1[40];
xm[41] <= xm1[41];
xm[42] <= xm1[42];
xm[43] <= xm1[43];
xm[44] <= xm1[44];
xm[45] <= xm1[45];
xm[46] <= xm1[46];
xm[47] <= xm1[47];
xm[48] <= xm1[48];
xm[49] <= xm1[49];
xm[50] <= xm1[50];
xm[51] <= xm1[51];
xm[52] <= xm1[52];
xm[53] <= xm1[53];
xm[54] <= xm1[54];
xm[55] <= xm1[55];
xm[56] <= xm1[56];
xm[57] <= xm1[57];
xm[58] <= xm1[58];
xm[59] <= xm1[59];
xm[60] <= xm1[60];
xm[61] <= xm1[61];
xm[62] <= xm1[62];
xm[63] <= xm1[63];
xm[64] <= xm1[64];
xm[65] <= xm1[65];
xm[66] <= xm1[66];
xm[67] <= xm1[67];
xm[68] <= xm1[68];
xm[69] <= xm1[69];
xm[70] <= xm1[70];
xm[71] <= xm1[71];
xm[72] <= xm1[72];
xm[73] <= xm1[73];
xm[74] <= xm1[74];
xm[75] <= xm1[75];


    end

    always @ (posedge clock_50) begin
      xp[150] <= xm[0];
		xp[149] <= ADD[150];
		xp[148] <= ADD[149];
		xp[147] <= ADD[148];
		xp[146] <= ADD[147];
		xp[145] <= ADD[146];
		xp[144] <= ADD[145];
		xp[143] <= ADD[144];
		xp[142] <= ADD[143];
		xp[141] <= ADD[142];
		xp[140] <= ADD[141];
		xp[139] <= ADD[140];
		xp[138] <= ADD[139];
		xp[137] <= ADD[138];
		xp[136] <= ADD[137];
		xp[135] <= ADD[136];
		xp[134] <= ADD[135];
		xp[133] <= ADD[134];
		xp[132] <= ADD[133];
		xp[131] <= ADD[132];
		xp[130] <= ADD[131];
		xp[129] <= ADD[130];
		xp[128] <= ADD[129];
		xp[127] <= ADD[128];
		xp[126] <= ADD[127];
		xp[125] <= ADD[126];
		xp[124] <= ADD[125];
		xp[123] <= ADD[124];
		xp[122] <= ADD[123];
		xp[121] <= ADD[122];
		xp[120] <= ADD[121];
		xp[119] <= ADD[120];
		xp[118] <= ADD[119];
		xp[117] <= ADD[118];
		xp[116] <= ADD[117];
		xp[115] <= ADD[116];
		xp[114] <= ADD[115];
		xp[113] <= ADD[114];
		xp[112] <= ADD[113];
		xp[111] <= ADD[112];
		xp[110] <= ADD[111];
		xp[109] <= ADD[110];
		xp[108] <= ADD[109];
		xp[107] <= ADD[108];
		xp[106] <= ADD[107];
		xp[105] <= ADD[106];
		xp[104] <= ADD[105];
		xp[103] <= ADD[104];
		xp[102] <= ADD[103];
		xp[101] <= ADD[102];
		xp[100] <= ADD[101];
		xp[99] <= ADD[100];
		xp[98] <= ADD[99];
		xp[97] <= ADD[98];
		xp[96] <= ADD[97];
		xp[95] <= ADD[96];
		xp[94] <= ADD[95];
		xp[93] <= ADD[94];
		xp[92] <= ADD[93];
		xp[91] <= ADD[92];
		xp[90] <= ADD[91];
		xp[89] <= ADD[90];
		xp[88] <= ADD[89];
    xp[87] <= ADD[88];
    xp[86] <= ADD[87];
    xp[85] <= ADD[86];
    xp[84] <= ADD[85];
    xp[83] <= ADD[84];
    xp[82] <= ADD[83];
    xp[81] <= ADD[82];
    xp[80] <= ADD[81];
    xp[79] <= ADD[80];
    xp[78] <= ADD[79];
    xp[77] <= ADD[78];
    xp[76] <= ADD[77];
    xp[75] <= ADD[76];
    xp[74] <= ADD[75];
    xp[73] <= ADD[74];
    xp[72] <= ADD[73];
    xp[71] <= ADD[72];
    xp[70] <= ADD[71];
    xp[69] <= ADD[70];
    xp[68] <= ADD[69];
    xp[67] <= ADD[68];
    xp[66] <= ADD[67];
    xp[65] <= ADD[66];
    xp[64] <= ADD[65];
    xp[63] <= ADD[64];
    xp[62] <= ADD[63];
    xp[61] <= ADD[62];
    xp[60] <= ADD[61];
    xp[59] <= ADD[60];
    xp[58] <= ADD[59];
    xp[57] <= ADD[58];
    xp[56] <= ADD[57];
    xp[55] <= ADD[56];
    xp[54] <= ADD[55];
    xp[53] <= ADD[54];
    xp[52] <= ADD[53];
    xp[51] <= ADD[52];
    xp[50] <= ADD[51];
    xp[49] <= ADD[50];
    xp[48] <= ADD[49];
    xp[47] <= ADD[48];
    xp[46] <= ADD[47];
    xp[45] <= ADD[46];
    xp[44] <= ADD[45];
    xp[43] <= ADD[44];
    xp[42] <= ADD[43];
    xp[41] <= ADD[42];
    xp[40] <= ADD[41];
    xp[39] <= ADD[40];
    xp[38] <= ADD[39];
    xp[37] <= ADD[38];
    xp[36] <= ADD[37];
    xp[35] <= ADD[36];
    xp[34] <= ADD[35];
    xp[33] <= ADD[34];
    xp[32] <= ADD[33];
    xp[31] <= ADD[32];
    xp[30] <= ADD[31];
    xp[29] <= ADD[30];
    xp[28] <= ADD[29];
    xp[27] <= ADD[28];
    xp[26] <= ADD[27];
    xp[25] <= ADD[26];
    xp[24] <= ADD[25];
    xp[23] <= ADD[24];
    xp[22] <= ADD[23];
    xp[21] <= ADD[22];
    xp[20] <= ADD[21];
    xp[19] <= ADD[20];
    xp[18] <= ADD[19];
    xp[17] <= ADD[18];
    xp[16] <= ADD[17];
    xp[15] <= ADD[16];
    xp[14] <= ADD[15];
    xp[13] <= ADD[14];
    xp[12] <= ADD[13];
    xp[11] <= ADD[12];
    xp[10] <= ADD[11];
    xp[9]  <= ADD[10];
    xp[8]  <= ADD[9];
    xp[7]  <= ADD[8];
    xp[6]  <= ADD[7];
    xp[5]  <= ADD[6];
    xp[4]  <= ADD[5];
    xp[3]  <= ADD[4];
    xp[2]  <= ADD[3];
    xp[1]  <= ADD[2];
    xp[0]  <= ADD[1];
    end
		assign ADD[150] = xp[150] + xm[1];
		assign ADD[149] = xp[149] + xm[2];
		assign ADD[148] = xp[148] + xm[3];
		assign ADD[147] = xp[147] + xm[4];
		assign ADD[146] = xp[146] + xm[5];
		assign ADD[145] = xp[145] + xm[6];
		assign ADD[144] = xp[144] + xm[7];
		assign ADD[143] = xp[143] + xm[8];
		assign ADD[142] = xp[142] + xm[9];
		assign ADD[141] = xp[141] + xm[10];
		assign ADD[140] = xp[140] + xm[11];
		assign ADD[139] = xp[139] + xm[12];
		assign ADD[138] = xp[138] + xm[13];
		assign ADD[137] = xp[137] + xm[14];
		assign ADD[136] = xp[136] + xm[15];
		assign ADD[135] = xp[135] + xm[16];
		assign ADD[134] = xp[134] + xm[17];
		assign ADD[133] = xp[133] + xm[18];
		assign ADD[132] = xp[132] + xm[19];
		assign ADD[131] = xp[131] + xm[20];
		assign ADD[130] = xp[130] + xm[21];
		assign ADD[129] = xp[129] + xm[22];
		assign ADD[128] = xp[128] + xm[23];
		assign ADD[127] = xp[127] + xm[24];
		assign ADD[126] = xp[126] + xm[25];
		assign ADD[125] = xp[125] + xm[26];
		assign ADD[124] = xp[124] + xm[27];
		assign ADD[123] = xp[123] + xm[28];
		assign ADD[122] = xp[122] + xm[29];
		assign ADD[121] = xp[121] + xm[30];
		assign ADD[120] = xp[120] + xm[31];
		assign ADD[119] = xp[119] + xm[32];
		assign ADD[118] = xp[118] + xm[33];
		assign ADD[117] = xp[117] + xm[34];
		assign ADD[116] = xp[116] + xm[35];
		assign ADD[115] = xp[115] + xm[36];
		assign ADD[114] = xp[114] + xm[37];
		assign ADD[113] = xp[113] + xm[38];
		assign ADD[112] = xp[112] + xm[39];
		assign ADD[111] = xp[111] + xm[40];
		assign ADD[110] = xp[110] + xm[41];
		assign ADD[109] = xp[109] + xm[42];
		assign ADD[108] = xp[108] + xm[43];
		assign ADD[107] = xp[107] + xm[44];
		assign ADD[106] = xp[106] + xm[45];
		assign ADD[105] = xp[105] + xm[46];
		assign ADD[104] = xp[104] + xm[47];
		assign ADD[103] = xp[103] + xm[48];
		assign ADD[102] = xp[102] + xm[49];
		assign ADD[101] = xp[101] + xm[50];
		assign ADD[100] = xp[100] + xm[51];
		assign ADD[99] = xp[99] + xm[52];
		assign ADD[98] = xp[98] + xm[53];
		assign ADD[97] = xp[97] + xm[54];
		assign ADD[96] = xp[96] + xm[55];
		assign ADD[95] = xp[95] + xm[56];
		assign ADD[94] = xp[94] + xm[57];
		assign ADD[93] = xp[93] + xm[58];
		assign ADD[92] = xp[92] + xm[59];
		assign ADD[91] = xp[91] + xm[60];
		assign ADD[90] = xp[90] + xm[61];
		assign ADD[89] = xp[89] + xm[62];
    assign ADD[88]  = xp[88]  + xm[63];
    assign ADD[87]  = xp[87]  + xm[64];
    assign ADD[86]  = xp[86]  + xm[65];
    assign ADD[85]  = xp[85]  + xm[66];
    assign ADD[84]  = xp[84]  + xm[67];
    assign ADD[83]  = xp[83]  + xm[68];
    assign ADD[82]  = xp[82]  + xm[69];
    assign ADD[81]  = xp[81]  + xm[70];
    assign ADD[80]  = xp[80]  + xm[71];
    assign ADD[79]  = xp[79]  + xm[72];
    assign ADD[78]  = xp[78]  + xm[73];
    assign ADD[77]  = xp[77]  + xm[74];
    assign ADD[76]  = xp[76]  + xm[75];
    assign ADD[75]  = xp[75]  + xm[74];
    assign ADD[74]  = xp[74]  + xm[73];
    assign ADD[73]  = xp[73]  + xm[72];
    assign ADD[72]  = xp[72]  + xm[71];
    assign ADD[71]  = xp[71]  + xm[70];
    assign ADD[70]  = xp[70]  + xm[69];
    assign ADD[69]  = xp[69]  + xm[68];
    assign ADD[68]  = xp[68]  + xm[67];
    assign ADD[67]  = xp[67]  + xm[66];
    assign ADD[66]  = xp[66]  + xm[65];
    assign ADD[65]  = xp[65]  + xm[64];
    assign ADD[64]  = xp[64]  + xm[63];
    assign ADD[63]  = xp[63]  + xm[62];
    assign ADD[62]  = xp[62]  + xm[61];
    assign ADD[61]  = xp[61]  + xm[60];
    assign ADD[60]  = xp[60]  + xm[59];
    assign ADD[59]  = xp[59]  + xm[58];
    assign ADD[58]  = xp[58]  + xm[57];
    assign ADD[57]  = xp[57]  + xm[56];
    assign ADD[56] = xp[56] + xm[55];
    assign ADD[55] = xp[55] + xm[54];
    assign ADD[54] = xp[54] + xm[53];
    assign ADD[53] = xp[53] + xm[52];
    assign ADD[52] = xp[52] + xm[51];
    assign ADD[51] = xp[51] + xm[50];
    assign ADD[50] = xp[50] + xm[49];
    assign ADD[49] = xp[49] + xm[48];
    assign ADD[48] = xp[48] + xm[47];
    assign ADD[47] = xp[47] + xm[46];
    assign ADD[46] = xp[46] + xm[45];
    assign ADD[45] = xp[45] + xm[44];
    assign ADD[44] = xp[44] + xm[43];
    assign ADD[43] = xp[43] + xm[42];
    assign ADD[42] = xp[42] + xm[41];
    assign ADD[41] = xp[41] + xm[40];
    assign ADD[40] = xp[40] + xm[39];
    assign ADD[39] = xp[39] + xm[38];
    assign ADD[38] = xp[38] + xm[37];
    assign ADD[37] = xp[37] + xm[36];
    assign ADD[36] = xp[36] + xm[35];
    assign ADD[35] = xp[35] + xm[34];
    assign ADD[34] = xp[34] + xm[33];
    assign ADD[33] = xp[33] + xm[32];
    assign ADD[32] = xp[32] + xm[31];
    assign ADD[31] = xp[31] + xm[30];
    assign ADD[30] = xp[30] + xm[29];
    assign ADD[29] = xp[29] + xm[28];
    assign ADD[28] = xp[28] + xm[27];
    assign ADD[27] = xp[27] + xm[26];
    assign ADD[26] = xp[26] + xm[25];
    assign ADD[25] = xp[25] + xm[24];
    assign ADD[24] = xp[24] + xm[23];
    assign ADD[23] = xp[23] + xm[22];
    assign ADD[22] = xp[22] + xm[21];
    assign ADD[21] = xp[21] + xm[20];
    assign ADD[20] = xp[20] + xm[19];
    assign ADD[19] = xp[19] + xm[18];
    assign ADD[18] = xp[18] + xm[17];
    assign ADD[17] = xp[17] + xm[16];
    assign ADD[16] = xp[16] + xm[15];
    assign ADD[15] = xp[15] + xm[14];
    assign ADD[14] = xp[14] + xm[13];
    assign ADD[13] = xp[13] + xm[12];
    assign ADD[12] = xp[12] + xm[11];
    assign ADD[11] = xp[11] + xm[10];
    assign ADD[10] = xp[10] + xm[9];
    assign ADD[9]   = xp[9]   + xm[8];
    assign ADD[8]   = xp[8]   + xm[7];
    assign ADD[7]   = xp[7]   + xm[6];
    assign ADD[6]   = xp[6]   + xm[5];
    assign ADD[5]   = xp[5]   + xm[4];
    assign ADD[4]   = xp[4]   + xm[3];
    assign ADD[3]   = xp[3]   + xm[2];
    assign ADD[2]   = xp[2]   + xm[1];
    assign ADD[1]   = xp[1]   + xm[0];

    assign dout = ADD[1] >> 14;

endmodule
