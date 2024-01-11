`timescale 1ns/1ps

module ring_oscillator(en,ctrl,out);

input [4:0]ctrl;
input en;
output out;

wire w1,w2,w3;



LUT6 #(
.INIT(64'h8888888888888888) // Logic function
)
L1 (
.O(w1), 
.I0(en), 
.I1(out), 
.I2(ctrl[3]), 
.I3(ctrl[2]), 
.I4(ctrl[1]), 
.I5(ctrl[0]) 
);


LUT6 #(
.INIT(64'h5555555555555555) // Logic function
)
L2 (
.O(w2), 
.I0(w1), 
.I1(ctrl[4]), 
.I2(ctrl[3]), 
.I3(ctrl[2]), 
.I4(ctrl[1]), 
.I5(ctrl[0]) 
);

LUT6 #(
.INIT(64'h5555555555555555) // Logic function
)
L3 (
.O(w3), 
.I0(w2), 
.I1(ctrl[4]), 
.I2(ctrl[3]), 
.I3(ctrl[2]), 
.I4(ctrl[1]), 
.I5(ctrl[0]) 
);

LUT6 #(
.INIT(64'h5555555555555555) // Logic function
)
L4 (
.O(out), 
.I0(w3), 
.I1(ctrl[4]), 
.I2(ctrl[3]), 
.I3(ctrl[2]), 
.I4(ctrl[1]), 
.I5(ctrl[0]) 
);


endmodule