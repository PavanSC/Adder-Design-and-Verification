class scoreboard extends uvm_scoreboard;
 `uvm_component_utils(scoreboard)

uvm_tlm_analysis_fifo#(trans) f1;

trans c1;
trans t1;

covergroup fcov1;
 option.per_instance = 1;

A:coverpoint c1.a{bins a1={0};
                  bins a2={1};  }

B:coverpoint c1.b{bins b1={0};
                  bins b2={1};}

C:coverpoint c1.c{bins c1={0};
                  bins c2={1};}

X: cross A,B,C;

endgroup


function new(string name = "scoreboard", uvm_component parent);
    super.new(name, parent);
    fcov1=new();
  endfunction


function void build_phase(uvm_phase phase);

  super.build_phase(phase);

  `uvm_info("SCOREBOARD", "This is build_phase", UVM_LOW)
  t1=trans::type_id::create("t1",this);
  f1=new("f1",this);
endfunction



task run_phase(uvm_phase phase);
 `uvm_info("SCOREBOARD", "This is run_phase", UVM_LOW)
  forever begin
  f1.get(t1);
  t1.print();

  c1=t1;
  fcov1.sample();
  end
endtask


endclass


