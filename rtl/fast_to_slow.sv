// Module to synchronize asynchronous data from a fast clock domain to a slow clock domain
module fast_to_slow
    #( parameter width = 12 ) // Parameter to define the width of the data bus
    (
        input logic fast_clk, // Fast clock input
        input logic slow_clk, // Slow clock input
        input logic [width-1:0] async_data, // Asynchronous data input from fast clock domain
        output logic [width-1:0] sync_data // Synchronized data output to slow clock domain
    );

// Internal signals and registers
reg [width-1:0] q1, q2; // Registers to hold intermediate data values
reg q3, flop_en; // Registers to control data transfer

// Capture async_data into q1 on the rising edge of fast_clk
always_ff @(posedge fast_clk)
    q1 <= async_data;

// Transfer data from q1 to q2 when flop_en is high, on the rising edge of fast_clk
always_ff @(posedge fast_clk)
    if (flop_en)
        q2 <= q1;

// Transfer synchronized data from q2 to sync_data on the rising edge of slow_clk
always_ff @(posedge slow_clk)
    sync_data <= q2;

// Capture the slow_clk signal into q3 on the falling edge of fast_clk
always_ff @(posedge ~fast_clk)
    q3 <= slow_clk;

// Update flop_en with the value of q3 on the falling edge of fast_clk
always_ff @(posedge ~fast_clk)
    flop_en <= q3;

endmodule
