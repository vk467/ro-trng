module ro_controller(clk, rst, ro_enable, cnt, enable, ctrl);
input clk, rst, ro_enable;
input [4:0] cnt;
output reg [31:0] enable;
output reg [4:0] ctrl;


always @ (posedge clk)
begin
    if (rst)
       begin
        ctrl <= 5'd31;
        enable <= 32'hz;
       end
    
    if (!ro_enable)
        enable <= 32'hz;
    else
        case(cnt)
        'd0: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0;  end
        'd1: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0z;  end
        'd2: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0zz; end
        'd3: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzz0zzz; end
        'd4: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzz0zzzz; end
        'd5: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzz0zzzzz;  end
        'd6: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzz0zzzzzz;  end
        'd7: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzzzzz0zzzzzzz;  end
        'd8: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzzzz0zzzzzzzz;  end
        'd9: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzzz0zzzzzzzzz;  end
        'd10: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzz; end
        'd11: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzz; end
        'd12: begin enable <= 32'bzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzz; end
        'd13: begin enable <= 32'bzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzz; end
        'd14: begin enable <= 32'bzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzz; end
        'd15: begin enable <= 32'bzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzz; end
        'd16: begin enable <= 32'bzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzz; end
        'd17: begin enable <= 32'bzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzz; end
        'd18: begin enable <= 32'bzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzz; end
        'd19: begin enable <= 32'bzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzz; end
        'd20: begin enable <= 32'bzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzz; end
        'd21: begin enable <= 32'bzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzz; end
        'd22: begin enable <= 32'bzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzzz; end
        'd23: begin enable <= 32'bzzzzzzzz0zzzzzzzzzzzzzzzzzzzzzzz; end
        'd24: begin enable <= 32'bzzzzzzz0zzzzzzzzzzzzzzzzzzzzzzzz; end
        'd25: begin enable <= 32'bzzzzzz0zzzzzzzzzzzzzzzzzzzzzzzzz; end
        'd26: begin enable <= 32'bzzzzz0zzzzzzzzzzzzzzzzzzzzzzzzzz; end
        'd27: begin enable <= 32'bzzzz0zzzzzzzzzzzzzzzzzzzzzzzzzzz; end
        'd28: begin enable <= 32'bzzz0zzzzzzzzzzzzzzzzzzzzzzzzzzzz; end
        'd29: begin enable <= 32'bzz0zzzzzzzzzzzzzzzzzzzzzzzzzzzzz; end
        'd30: begin enable <= 32'bz0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz; end
        'd31: begin enable <= 32'b0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz; end
        default: begin enable <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz; end
        endcase
     #1 enable=0;
end


always@ (posedge clk)
begin
    if(ro_enable)
    begin
        if (ctrl == 31)
            ctrl<=0;
        else
            ctrl<=ctrl+1;
    end
end
endmodule