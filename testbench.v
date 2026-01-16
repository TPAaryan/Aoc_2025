`timescale 1ns / 1ps

module command_processor_tb;

    reg clk;
    reg rst;
    reg [8*4-1:0] in;
    wire [31:0] out;

   
    command_processor UUT (
        .clk(clk),
        .rst(rst),
        .in(in),     
        .out(out)
    );

  
    always #5 clk = ~clk;

    initial begin
        $display("==== TEST STARTED ====");

        clk = 0;
        rst = 1;

     
        #20 rst = 0;

        #500;

      $display("Final OUT value = %0d", out);

        $display("==== TEST FINISHED ====");
        $stop;
    end

endmodule