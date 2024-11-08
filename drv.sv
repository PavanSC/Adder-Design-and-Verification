class drv extends uvm_driver#(trans);
 `uvm_component_utils(drv)

virtual add_if vif;

function new(string name="drv",uvm_component parent=null);
 super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 if(!uvm_config_db#(virtual add_if)::get(this,"","add_if",vif))
  `uvm_fatal("CONFIG","Have u set it?")
endfunction


task run_phase(uvm_phase phase);
 trans req;


 forever begin
  seq_item_port.get_next_item(req);
  drive_to_dut(req);
  seq_item_port.item_done();
end 
endtask


task drive_to_dut(trans xtn);
@(posedge vif.clk);
//vif.rst=xtn.rst;
vif.a<=xtn.a;
vif.b<=xtn.b;
vif.c=xtn.c;
#3;
xtn.sum = vif.sum;
xtn.cout = vif.cout;
endtask

endclass

