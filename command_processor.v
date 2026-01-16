`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2025 03:44:42
// Design Name: 
// Module Name: command_processor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module command_processor(
    input clk,
    input rst,
  input [8*4-1:0] in,
  output [8*4-1:0] out
    );
    
  reg [8*4-1:0] command;
    reg [6:0] current_val;
    integer file_handle;
    reg [6:0] circular_array [0:99];
    reg [8*4-1:0] mag;
    reg [6:0] index;
    integer i;
  	integer status;
    reg [8*4-1:0] count;
  reg [8*4-1:0] count_2L;
  reg [8*4-1:0] count_2R;

  reg [8*4-1:0] count_2;
    reg[7:0] dir;
    
    initial begin
        current_val = 7'b00110010;
        index = 7'b00110010;
        count = 7'b00000000000000000000000000000000;
        count_2 = 7'b00000000000000000000000000000000;
        file_handle = $fopen("input.txt","r");
     
        for (i = 0; i < 100; i = i + 1) begin
        circular_array[i] = i;
        end
        
      status = $fscanf(file_handle, "%s", command);
		while (status == 1) begin
			
          $sscanf(command, "%c%d", dir, mag);
          $display("com = %s",command);
          $display("in = %d",mag );
          $display("in = %c",dir );
          case (dir)
                "L": begin
                
                  if(((mag % 100)>(index))&&((index)!=0)) count_2 = 1 + mag/100 + count_2;
                  else  count_2 = mag/100 + count_2;   
                  
                  index = (index + 100 - (mag % 100)) % 100;
                  $display("index = %d",index );
                   current_val = circular_array[index];
                   if(current_val==0)count = count + 1;
                        
                end
                
                "R": begin 
                
                  
                  if(((mag % 100)>(100-index))) count_2 = 1 + mag/100 + count_2;
                  else  count_2 = mag/100 + count_2;
                  
                   index = (index + mag) % 100;
                   current_val = circular_array[index];
                   if(current_val==0)count = count + 1;
                end
                
             endcase                      
          status = $fscanf(file_handle, "%s", command);
        end
    count_2 = count_2 + count;
    $display("ct2 %d",count_2);    
    $fclose(file_handle);
    
    end
    
   
    assign out = count_2;
    
endmodule