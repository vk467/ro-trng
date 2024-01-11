module trng(clk,reset,start,trn,done);
input clk;
input reset;
input start;
output [7:0]trn;
output done;

wire [31:0] ro_en;
wire [4:0] delay_ctrl, cnt_r;
wire xt;
wire mux_sel, sr_en, fifo_read, fifo_write, fifo_en, ro_ctrl;
wire rbit,pbit,sbit;
wire [7:0] srbits, data;
wire [5:0] frame;

assign trn = reset ? 'd0: data;

ro_controller rctrl(clk, reset, ro_ctrl, cnt_r, ro_en, delay_ctrl);

ro_xor_tree roxt(clk,reset,ro_ctrl,
                delay_ctrl,xt);

dff d1 (clk,xt,reset,rbit);

to_mux t1(rbit, pbit, mux_sel, sbit);

sipo sp1(clk,reset,sr_en,sbit,srbits);

fifo f1(clk, reset, fifo_read, fifo_write, fifo_en, srbits, data);

trng_controller tctrl(clk,reset,start,done, ro_ctrl, mux_sel, sr_en, fifo_read, fifo_write, fifo_en, cnt_r);

endmodule

