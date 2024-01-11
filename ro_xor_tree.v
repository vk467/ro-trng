module ro_xor_tree(clk,clear,en,z,ctrl);
input clk, clear;
input [31:0] en;
input [4:0] ctrl;
output reg z;

(* dont_touch = "true" *) wire [31:0]r;
(* dont_touch = "true" *) wire [31:0]q;

integer i;

ring_oscillator ro1(en[0],ctrl,r[0]);
ring_oscillator ro2(en[1],ctrl,r[1]);
ring_oscillator ro3(en[2],ctrl,r[2]);
ring_oscillator ro4(en[3],ctrl,r[3]);
ring_oscillator ro5(en[4],ctrl,r[4]);
ring_oscillator ro6(en[5],ctrl,r[5]);
ring_oscillator ro7(en[6],ctrl,r[6]);
ring_oscillator ro8(en[7],ctrl,r[7]);
ring_oscillator ro9(en[8],ctrl,r[8]);
ring_oscillator ro10(en[9],ctrl,r[9]);
ring_oscillator ro11(en[10],ctrl,r[10]);
ring_oscillator ro12(en[11],ctrl,r[11]);
ring_oscillator ro13(en[12],ctrl,r[12]);
ring_oscillator ro14(en[13],ctrl,r[13]);
ring_oscillator ro15(en[14],ctrl,r[14]);
ring_oscillator ro16(en[15],ctrl,r[15]);
ring_oscillator ro17(en[16],ctrl,r[16]);
ring_oscillator ro18(en[17],ctrl,r[17]);
ring_oscillator ro19(en[18],ctrl,r[18]);
ring_oscillator ro20(en[19],ctrl,r[19]);
ring_oscillator ro21(en[20],ctrl,r[20]);
ring_oscillator ro22(en[21],ctrl,r[21]);
ring_oscillator ro23(en[22],ctrl,r[22]);
ring_oscillator ro24(en[23],ctrl,r[23]);
ring_oscillator ro25(en[24],ctrl,r[24]);
ring_oscillator ro26(en[25],ctrl,r[25]);
ring_oscillator ro27(en[26],ctrl,r[26]);
ring_oscillator ro28(en[27],ctrl,r[27]);
ring_oscillator ro29(en[28],ctrl,r[28]);
ring_oscillator ro30(en[29],ctrl,r[29]);
ring_oscillator ro31(en[30],ctrl,r[30]);
ring_oscillator ro32(en[31],ctrl,r[31]);

dff d1(clk,r[0],clear,q[0]);
dff d2(clk,r[1],clear,q[1]);
dff d3(clk,r[2],clear,q[2]);
dff d4(clk,r[3],clear,q[3]);
dff d5(clk,r[4],clear,q[4]);
dff d6(clk,r[5],clear,q[5]);
dff d7(clk,r[6],clear,q[6]);
dff d8(clk,r[7],clear,q[7]);
dff d9(clk,r[8],clear,q[8]);
dff d10(clk,r[9],clear,q[9]);
dff d11(clk,r[10],clear,q[10]);
dff d12(clk,r[11],clear,q[11]);
dff d13(clk,r[12],clear,q[12]);
dff d14(clk,r[13],clear,q[13]);
dff d15(clk,r[14],clear,q[14]);
dff d16(clk,r[15],clear,q[15]);
dff d17(clk,r[16],clear,q[16]);
dff d18(clk,r[17],clear,q[17]);
dff d19(clk,r[18],clear,q[18]);
dff d20(clk,r[19],clear,q[19]);
dff d21(clk,r[20],clear,q[20]);
dff d22(clk,r[21],clear,q[21]);
dff d23(clk,r[22],clear,q[22]);
dff d24(clk,r[23],clear,q[23]);
dff d25(clk,r[24],clear,q[24]);
dff d26(clk,r[25],clear,q[25]);
dff d27(clk,r[26],clear,q[26]);
dff d28(clk,r[27],clear,q[27]);
dff d29(clk,r[28],clear,q[28]);
dff d30(clk,r[29],clear,q[29]);
dff d31(clk,r[30],clear,q[30]);
dff d32(clk,r[31],clear,q[31]);

always @(*)
begin
    if(clear)
        z=0;
    else
        for (i=0;i<32;i=i+1)
            z = z ^ q[i];    
end

endmodule