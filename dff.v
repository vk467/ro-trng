module dff(clk,d,clear,q);
input clk;
input d;
input clear;
output reg q;

always @ (posedge clk)
begin
    if(clear)
        q<=0;
    else
        q<=d;
end

endmodule

