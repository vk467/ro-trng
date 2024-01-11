module fifo( clk, rst, RD, WR, EN, dataIn, dataOut);


input  clk, 
       RD, 
       WR, 
       EN, 
       rst;

input   [7:0]    dataIn;

output reg [7:0] dataOut; 

reg [5:0]  Count = 0; 

reg [7:0] FIFO [0:63]; 

reg [5:0]  readCounter = 0, 

           writeCounter = 0; 


always @ (posedge clk) 

begin 

     if (EN==0); 
    
     else begin 
      if (rst) begin 
       readCounter = 0; 
       writeCounter = 0; 
      end 
    
      else if (RD ==1'b1 && Count!=0) begin 
       dataOut  = FIFO[readCounter]; 
       readCounter = readCounter+1; 
      end 
    
      else if (WR==1'b1 && Count<64) begin
       FIFO[writeCounter]  = dataIn; 
       writeCounter  = writeCounter+1; 
      end 
    
      else; 
     end 

     if (writeCounter==8) 
      writeCounter=0; 
     else if (readCounter==8) 
      readCounter=0; 
     else;

     if (readCounter > writeCounter) begin 
      Count=readCounter-writeCounter; 
     end 
     else if (writeCounter > readCounter) 
      Count=writeCounter-readCounter; 
     else;

end 

endmodule