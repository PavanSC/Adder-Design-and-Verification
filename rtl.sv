module adder(clk,a,b,c,sum,cout);


input clk;
//input rst;
input a;
input  b;
input c;
output reg sum;
output reg cout;

always@(*) begin
{cout, sum} = a + b + c;
end
endmodule