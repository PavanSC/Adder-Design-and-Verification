module top;

 import uvm_pkg::*;
 `include "uvm_macros.svh"
 import test_pkg::*;

bit clk;

initial begin
clk=1'b0;
forever 
#5 clk=~clk;
end

 add_if intf(clk);
adder DUT(.a(intf.a),.b(intf.b),.c(intf.c),.sum(intf.sum),.cout(intf.cout),.clk(intf.clk));

initial begin
uvm_config_db#(virtual add_if)::set(null,"*","add_if",intf);
end

initial begin
run_test();
end




endmodule