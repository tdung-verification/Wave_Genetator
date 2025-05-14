module fir_89tap_lowpass(
    input signed [15:0] x,
    input clock_50,
    output signed [15:0] dout
);

    reg signed [15:0] x1;
    reg signed [31:0] xm [0:88];
    reg signed [31:0] xp [0:88];
    

reg signed [15:0] c0  = -0;    // round(-0.000013 * 16384) = 0
reg signed [15:0] c1  = -0;    // round(-0.000028 * 16384) = 0
reg signed [15:0] c2  = -1;    // round(-0.000050 * 16384) = -1
reg signed [15:0] c3  = -1;    // round(-0.000081 * 16384) = -1
reg signed [15:0] c4  = -2;    // round(-0.000124 * 16384) = -2
reg signed [15:0] c5  = -3;    // round(-0.000178 * 16384) = -3
reg signed [15:0] c6  = -4;    // round(-0.000244 * 16384) = -4
reg signed [15:0] c7  = -5;    // round(-0.000323 * 16384) = -5
reg signed [15:0] c8  = -7;    // round(-0.000412 * 16384) = -7
reg signed [15:0] c9  = -8;    // round(-0.000509 * 16384) = -8
reg signed [15:0] c10 = -10;   // round(-0.000610 * 16384) = -10
reg signed [15:0] c11 = -12;   // round(-0.000707 * 16384) = -12
reg signed [15:0] c12 = -13;   // round(-0.000794 * 16384) = -13
reg signed [15:0] c13 = -14;   // round(-0.000859 * 16384) = -14
reg signed [15:0] c14 = -15;   // round(-0.000891 * 16384) = -15
reg signed [15:0] c15 = -14;   // round(-0.000875 * 16384) = -14
reg signed [15:0] c16 = -13;   // round(-0.000795 * 16384) = -13
reg signed [15:0] c17 = -10;   // round(-0.000635 * 16384) = -10
reg signed [15:0] c18 = -6;    // round(-0.000376 * 16384) = -6
reg signed [15:0] c19 = 0;     // round(0.000000 * 16384) = 0
reg signed [15:0] c20 = 8;     // round(0.000511 * 16384) = 8
reg signed [15:0] c21 = 19;    // round(0.001174 * 16384) = 19
reg signed [15:0] c22 = 33;    // round(0.002003 * 16384) = 33
reg signed [15:0] c23 = 49;    // round(0.003012 * 16384) = 49
reg signed [15:0] c24 = 69;    // round(0.004210 * 16384) = 69
reg signed [15:0] c25 = 92;    // round(0.005601 * 16384) = 92
reg signed [15:0] c26 = 118;   // round(0.007185 * 16384) = 118
reg signed [15:0] c27 = 147;   // round(0.008957 * 16384) = 147
reg signed [15:0] c28 = 179;   // round(0.010906 * 16384) = 179
reg signed [15:0] c29 = 213;   // round(0.013016 * 16384) = 213
reg signed [15:0] c30 = 250;   // round(0.015263 * 16384) = 250
reg signed [15:0] c31 = 289;   // round(0.017620 * 16384) = 289
reg signed [15:0] c32 = 329;   // round(0.020052 * 16384) = 329
reg signed [15:0] c33 = 369;   // round(0.022522 * 16384) = 369
reg signed [15:0] c34 = 409;   // round(0.024988 * 16384) = 409
reg signed [15:0] c35 = 449;   // round(0.027406 * 16384) = 449
reg signed [15:0] c36 = 487;   // round(0.029729 * 16384) = 487
reg signed [15:0] c37 = 523;   // round(0.031912 * 16384) = 523
reg signed [15:0] c38 = 556;   // round(0.033911 * 16384) = 556
reg signed [15:0] c39 = 585;   // round(0.035683 * 16384) = 585
reg signed [15:0] c40 = 609;   // round(0.037189 * 16384) = 609
reg signed [15:0] c41 = 629;   // round(0.038398 * 16384) = 629
reg signed [15:0] c42 = 644;   // round(0.039281 * 16384) = 644
reg signed [15:0] c43 = 652;   // round(0.039819 * 16384) = 652
reg signed [15:0] c44 = 655;   // round(0.040000 * 16384) = 655
reg signed [15:0] c45 = 652;   // round(0.039819 * 16384) = 652
reg signed [15:0] c46 = 644;   // round(0.039281 * 16384) = 644
reg signed [15:0] c47 = 629;   // round(0.038398 * 16384) = 629
reg signed [15:0] c48 = 609;   // round(0.037189 * 16384) = 609
reg signed [15:0] c49 = 585;   // round(0.035683 * 16384) = 585
reg signed [15:0] c50 = 556;   // round(0.033911 * 16384) = 556
reg signed [15:0] c51 = 523;   // round(0.031912 * 16384) = 523
reg signed [15:0] c52 = 487;   // round(0.029729 * 16384) = 487
reg signed [15:0] c53 = 449;   // round(0.027406 * 16384) = 449
reg signed [15:0] c54 = 409;   // round(0.024988 * 16384) = 409
reg signed [15:0] c55 = 369;   // round(0.022522 * 16384) = 369
reg signed [15:0] c56 = 329;   // round(0.020052 * 16384) = 329
reg signed [15:0] c57 = 289;   // round(0.017620 * 16384) = 289
reg signed [15:0] c58 = 250;   // round(0.015263 * 16384) = 250
reg signed [15:0] c59 = 213;   // round(0.013016 * 16384) = 213
reg signed [15:0] c60 = 179;   // round(0.010906 * 16384) = 179
reg signed [15:0] c61 = 147;   // round(0.008957 * 16384) = 147
reg signed [15:0] c62 = 118;   // round(0.007185 * 16384) = 118
reg signed [15:0] c63 = 92;    // round(0.005601 * 16384) = 92
reg signed [15:0] c64 = 69;    // round(0.004210 * 16384) = 69
reg signed [15:0] c65 = 49;    // round(0.003012 * 16384) = 49
reg signed [15:0] c66 = 33;    // round(0.002003 * 16384) = 33
reg signed [15:0] c67 = 19;    // round(0.001174 * 16384) = 19
reg signed [15:0] c68 = 8;     // round(0.000511 * 16384) = 8
reg signed [15:0] c69 = 0;     // round(0.000000 * 16384) = 0
reg signed [15:0] c70 = -6;    // round(-0.000376 * 16384) = -6
reg signed [15:0] c71 = -10;   // round(-0.000635 * 16384) = -10
reg signed [15:0] c72 = -13;   // round(-0.000795 * 16384) = -13
reg signed [15:0] c73 = -14;   // round(-0.000875 * 16384) = -14
reg signed [15:0] c74 = -15;   // round(-0.000891 * 16384) = -15
reg signed [15:0] c75 = -14;   // round(-0.000859 * 16384) = -14
reg signed [15:0] c76 = -13;   // round(-0.000794 * 16384) = -13
reg signed [15:0] c77 = -12;   // round(-0.000707 * 16384) = -12
reg signed [15:0] c78 = -10;   // round(-0.000610 * 16384) = -10
reg signed [15:0] c79 = -8;    // round(-0.000509 * 16384) = -8
reg signed [15:0] c80 = -7;    // round(-0.000412 * 16384) = -7
reg signed [15:0] c81 = -5;    // round(-0.000323 * 16384) = -5
reg signed [15:0] c82 = -4;    // round(-0.000244 * 16384) = -4
reg signed [15:0] c83 = -3;    // round(-0.000178 * 16384) = -3
reg signed [15:0] c84 = -2;    // round(-0.000124 * 16384) = -2
reg signed [15:0] c85 = -1;    // round(-0.000081 * 16384) = -1
reg signed [15:0] c86 = -1;    // round(-0.000050 * 16384) = -1
reg signed [15:0] c87 = -0;    // round(-0.000028 * 16384) = 0
reg signed [15:0] c88 = -0;    // round(-0.000013 * 16384) = 0

    wire signed [31:0] ADD [0:88];

    always @ (posedge clock_50) begin
        x1 <= x;
    end

    always @ (posedge clock_50) begin
	 
        xm[0]  <= x1 * c0;
    xm[1]  <= x1 * c1;
    xm[2]  <= x1 * c2;
    xm[3]  <= x1 * c3;
    xm[4]  <= x1 * c4;
    xm[5]  <= x1 * c5;
    xm[6]  <= x1 * c6;
    xm[7]  <= x1 * c7;
    xm[8]  <= x1 * c8;
    xm[9]  <= x1 * c9;
    xm[10] <= x1 * c10;
    xm[11] <= x1 * c11;
    xm[12] <= x1 * c12;
    xm[13] <= x1 * c13;
    xm[14] <= x1 * c14;
    xm[15] <= x1 * c15;
    xm[16] <= x1 * c16;
    xm[17] <= x1 * c17;
    xm[18] <= x1 * c18;
    xm[19] <= x1 * c19;
    xm[20] <= x1 * c20;
    xm[21] <= x1 * c21;
    xm[22] <= x1 * c22;
    xm[23] <= x1 * c23;
    xm[24] <= x1 * c24;
    xm[25] <= x1 * c25;
    xm[26] <= x1 * c26;
    xm[27] <= x1 * c27;
    xm[28] <= x1 * c28;
    xm[29] <= x1 * c29;
    xm[30] <= x1 * c30;
    xm[31] <= x1 * c31;
    xm[32] <= x1 * c32;
    xm[33] <= x1 * c33;
    xm[34] <= x1 * c34;
    xm[35] <= x1 * c35;
    xm[36] <= x1 * c36;
    xm[37] <= x1 * c37;
    xm[38] <= x1 * c38;
    xm[39] <= x1 * c39;
    xm[40] <= x1 * c40;
    xm[41] <= x1 * c41;
    xm[42] <= x1 * c42;
    xm[43] <= x1 * c43;
    xm[44] <= x1 * c44;
    xm[45] <= x1 * c45;
    xm[46] <= x1 * c46;
    xm[47] <= x1 * c47;
    xm[48] <= x1 * c48;
    xm[49] <= x1 * c49;
    xm[50] <= x1 * c50;
    xm[51] <= x1 * c51;
    xm[52] <= x1 * c52;
    xm[53] <= x1 * c53;
    xm[54] <= x1 * c54;
    xm[55] <= x1 * c55;
    xm[56] <= x1 * c56;
	 xm[57] <= x1 * c57;
    xm[58] <= x1 * c58;
    xm[59] <= x1 * c59;
    xm[60] <= x1 * c60;
    xm[61] <= x1 * c61;
    xm[62] <= x1 * c62;
    xm[63] <= x1 * c63;
    xm[64] <= x1 * c64;
    xm[65] <= x1 * c65;
    xm[66] <= x1 * c66;
    xm[67] <= x1 * c67;
    xm[68] <= x1 * c68;
    xm[69] <= x1 * c69;
    xm[70] <= x1 * c70;
    xm[71] <= x1 * c71;
    xm[72] <= x1 * c72;
    xm[73] <= x1 * c73;
    xm[74] <= x1 * c74;
    xm[75] <= x1 * c75;
    xm[76] <= x1 * c76;
    xm[77] <= x1 * c77;
    xm[78] <= x1 * c78;
    xm[79] <= x1 * c79;
    xm[80] <= x1 * c80;
    xm[81] <= x1 * c81;
    xm[82] <= x1 * c82;
    xm[83] <= x1 * c83;
    xm[84] <= x1 * c84;
    xm[85] <= x1 * c85;
    xm[86] <= x1 * c86;
    xm[87] <= x1 * c87;
    xm[88] <= x1 * c88;

    end

    always @ (posedge clock_50) begin
        xp[88] <= xm[88];
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

    assign ADD[88]  = xp[88]  + xm[87];
    assign ADD[87]  = xp[87]  + xm[86];
    assign ADD[86]  = xp[86]  + xm[85];
    assign ADD[85]  = xp[85]  + xm[84];
    assign ADD[84]  = xp[84]  + xm[83];
    assign ADD[83]  = xp[83]  + xm[82];
    assign ADD[82]  = xp[82]  + xm[81];
    assign ADD[81]  = xp[81]  + xm[80];
    assign ADD[80]  = xp[80]  + xm[79];
    assign ADD[79]  = xp[79]  + xm[78];
    assign ADD[78]  = xp[78]  + xm[77];
    assign ADD[77]  = xp[77]  + xm[76];
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
