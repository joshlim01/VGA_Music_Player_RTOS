// Module to synchronize asynchronous data from a slow clock domain to a fast clock domain
module slow_to_fast 
    #( parameter width = 1 ) // Parameter to define the width of the data bus
    (
        input logic fast_clk, // Fast clock input
        input logic slow_clk, // Slow clock input
        input logic [width-1:0] async_data, // Asynchronous data input from slow clock domain
        output logic [width-1:0] sync_data // Synchronized data output to fast clock domain
    );

// Internal signals and registers
reg q1, q2, q3, q4;
logic en_5, reset_1;

// Generate reset_1 signal: indicates falling edge of slow_clk when q3 is high
assign reset_1 = ~slow_clk & q3;

// Generate en_5 signal: indicates that data is ready to be transferred when q3 is high and q4 is low
assign en_5 = q3 & ~q4;

// Sequential logic for q1: Set q1 to 1 on rising edge of slow_clk, reset it on reset_1
always_ff @(posedge slow_clk, posedge reset_1)
    if (reset_1) 
        q1 <= 1'b0;
    else 
        q1 <= 1'b1;    

// Sequential logic for q2, q3, q4: Shift register to synchronize q1 with fast_clk
always_ff @(posedge fast_clk)
begin
    q2 <= q1; // Capture q1 on fast clock edge
    q3 <= q2; // Capture q2 on next fast clock edge
    q4 <= q3; // Capture q3 on next fast clock edge
end

// Sequential logic for sync_data: Update sync_data with async_data when en_5 is high
always_ff @(posedge fast_clk)
begin
    if (en_5) 
        sync_data <= async_data; // Transfer async_data to sync_data when en_5 is high
end

endmodule
