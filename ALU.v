module alu(a,b,ctrl,y);
input[3:0]a,b,ctrl;
output reg[15:0]y;
always @(a or b or ctrl)
begin
case(ctrl)
4'b0001: y = a + b;
4'b0010: y = a - b;
4'b0011: y = a * b;
4'b0100: y = a / b;
4'b0101: y = a & b;
4'b0110: y = a ^ b;
4'b0111: y = a | b;
4'b1000: y = ~(a & b);
4'b1001: y = ~(a | b);
4'b1010: y = a ~^ b;
4'b1011: y = ~a;
default: y = 4'b0000;
endcase
end
endmodule

module aru_tb;
reg[3:0]a,b,ctrl;
wire[15:0]y;
alu dut(a,b,ctrl,y);
initial begin
a = 4'b0001; b = 4'b0001;
#10 ctrl = 4'b0001;
#10 ctrl = 4'b0010;
#10 ctrl = 4'b0011;
#10 ctrl = 4'b0100;
#10 ctrl = 4'b0101;
#10 ctrl = 4'b0110;
#10 ctrl = 4'b0111;
#10 ctrl = 4'b1000;
#10 ctrl = 4'b1001;
#10 ctrl = 4'b1010;
#10 ctrl = 4'b1011;
#10 ctrl = 4'b1100;
end
initial $monitor("Time = %t A = %b B = Control =%d",$time,a,b,ctrl);
endmodule
