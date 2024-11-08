class trans extends uvm_sequence_item;

`uvm_object_utils(trans)

 


 rand logic a;
 rand logic  b;
 rand logic c;
logic  sum;
logic cout;
//rand logic rst;

//constraint RST{rst dist{0:=9,1:=1};}


function new(string name="trans");
 super.new(name);
endfunction

function void do_print(uvm_printer printer);
super.do_print(printer);
 printer.print_field("A",this.a,1,UVM_DEC);
 printer.print_field("B",this.b,1,UVM_DEC);
 printer.print_field("C",this.c,1,UVM_BIN);
 printer.print_field("SUM",this.sum,1,UVM_DEC);
 printer.print_field("Cout",this.cout,1,UVM_BIN);
 //printer.print_field("RST",this.rst,1,UVM_BIN);
endfunction

endclass

