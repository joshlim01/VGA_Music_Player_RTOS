/*
The Frequency Divider from Lab 1
Inputs:
- inclk: Input clock signal
- reset: Reset signal to initialize the divider
- div_clk_count: Division count value (32-bit)

Output:
- outclk: Output divided clock signal
*/
module Frequency_Divider(
	input inclk, // Input clock
	output reg outclk, // Output clock
	input reset, // Reset signal
	input [31:0] div_count // Division count
);

	reg [31:0] count = 32'd0; // counter to keep track
	
    always @(posedge inclk) begin
        if(reset) begin
            count <= 0;
            outclk <= 0;
        end
        else begin
            if(count >= div_count) begin
                count <= 0;
                outclk <= ~outclk;
            end
            else begin
                count <= count + 1;
            end
        end
    end
	
endmodule
	