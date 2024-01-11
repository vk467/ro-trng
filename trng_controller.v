`timescale 1ns/1ps
module trng_controller(clk,reset,start,done, ro_enable, mux_select, sr_enable, fifo_r, fifo_w, fifo_enable, cnt_r);
input clk,reset,start;
output reg done;
output reg ro_enable;
output reg mux_select;
output reg sr_enable;
output reg fifo_enable, fifo_r, fifo_w;
output reg [9:0] cnt_r;

reg [2:0] state, next;
reg [9:0] cnt;
reg [3:0] bits;
reg [8:0] stream;

parameter INIT = 3'd0,
          RO = 3'd1,
          XTREE = 3'd2,
          HOLD = 3'd3,
          MUX = 3'd4,
          SHIFT = 3'd5,
          FIFO = 3'd6,
          END = 3'd7;

parameter BITSTREAM = 1'b0;


always @ (posedge clk or posedge reset)
begin
    if(reset)
        begin
            done = 1'b0;
            ro_enable = 1'b0;
            mux_select = 1'b0;
            sr_enable = 1'b0;
            fifo_enable = 1'b0;
            fifo_w = 1'b0;
            fifo_r = 1'b0;
            bits = 4'd0;
            stream = 'd0;
        end
end

always @ (*)
begin
    case(state)
        RO : cnt = 'd33;
        XTREE : cnt = 'd1;
        HOLD : cnt = 'd1;
        MUX: cnt = 'd1;
        SHIFT: cnt = 'd1;
        FIFO: cnt = 'd1;
        END: cnt = 'd512;
        default: cnt = 'd0;
    endcase
    
    if (cnt == cnt_r)
            cnt_r <= 0;
 end   
    
always @ (posedge clk or posedge reset)
begin
    if (reset)
        cnt_r <= 0;
    else if (!state)
        cnt_r <= 0;
    else
        cnt_r = cnt_r + 1;
end


always @ (posedge clk)
begin
    case(state)
    INIT : begin
                if(start)
                    next = RO;
                else 
                    next = INIT;
           end
    
    RO : begin
            ro_enable = 1'b1;
            sr_enable = 1'b0;
            if (cnt_r == cnt)
                next = XTREE;
            else
                next = RO;
         end
    
    XTREE : begin
             stream = stream + 1;
             bits = bits+1;
             ro_enable = 1'b0;
             if (cnt_r == cnt)
                 next = HOLD;
             else
                 next = XTREE;
          end
    
    HOLD : begin
          if (cnt_r == cnt)
              next = MUX;
          else
              next = HOLD;
       end     
    
    MUX : begin
         mux_select = BITSTREAM;
         if (cnt_r == cnt)
             next = SHIFT;
         else
             next = MUX;
      end 
    
    SHIFT : begin
            sr_enable = 1'b1;
            if (bits == 8)
                next = FIFO;
            else if (cnt==cnt_r)
                next = RO;
            else
                next = SHIFT;
         end 
         
    FIFO : begin
           sr_enable = 1'b0;
           fifo_enable = 1'b1;
           bits = 'b0;
           fifo_w = 1'b1;
           if (stream == 511)
               begin
                   fifo_r = 1'b1;
                   fifo_w = 1'b0;
                   next = END;
               end
           else if (cnt == cnt_r)
           begin
               fifo_enable <= 1'b0;
               fifo_w <= 1'b0;
               next <= RO;
           end
           else
              next <= FIFO;
        end
        
    END : begin
        fifo_r = 1'b1;
        done = 1'b1;
        if (cnt==cnt_r)
        begin
            done = 1'b0;
            next = INIT;
        end
        end      

    endcase
end

always @ (posedge clk)
begin
    if (reset)
        state <=  INIT;
    else
        state <= next;
end


endmodule