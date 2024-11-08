class seqs extends uvm_sequence#(trans);
 `uvm_object_utils(seqs)

trans xtn;

function new(string name="trans");
 super.new(name);
endfunction

virtual task body();
 repeat(10)
  begin
     xtn=trans::type_id::create("xtn");
     start_item(xtn);
     xtn.randomize() with {c==0;};
     finish_item(xtn);
  end
 repeat(10)
  begin
     xtn=trans::type_id::create("xtn");
     start_item(xtn);
     xtn.randomize() with {c==1;};
     finish_item(xtn);
  end

endtask

endclass