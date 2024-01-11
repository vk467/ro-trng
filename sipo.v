module sipo(clk,clear,en,in,q);
input clk,clear,en,in;
output reg [7:0] q;

always @ (posedge clk)
begin
    if (clear)
        q <= 'd0;
    else 
        if (en)
        begin
            q[7] <= q[6];
            q[6] <= q[5];
            q[5] <= q[4];
            q[4] <= q[3];
            q[3] <= q[2];
            q[2] <= q[1];
            q[1] <= q[0];
            q[0] <= in;        
        end
end

endmodule