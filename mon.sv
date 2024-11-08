class mon extends uvm_monitor;

`uvm_component_utils(mon)

virtual add_if vif;

uvm_analysis_port#(trans) MP;

trans t1;

function new(string name="mon",uvm_component parent=null);
 super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 if(!uvm_config_db#(virtual add_if)::get(this,"","add_if",vif)) 
 `uvm_fatal("CONFIG","Have u set it?")
 MP=new("MP",this);
 t1=trans::type_id::create("t1",this);
endfunction




task run_phase(uvm_phase phase);
 forever begin
 collect_data();
end
endtask


task collect_data();
  t1=trans::type_id::create("t1",this);
 @(posedge vif.clk);
   
 //t1.rst   = vif.rst;
    t1.a     = vif.a;
    t1.b      = vif.b;
    t1.c  = vif.c;
    t1.sum= vif.sum;
   t1.cout  = vif.cout;
  t1.print();
   MP.write(t1);
endtask

endclass
