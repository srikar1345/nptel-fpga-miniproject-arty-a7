`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2025 04:37:27 PM
// Design Name: 
// Module Name: miniproject
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2025 02:06:18 PM
// Design Name: 
// Module Name: 4_mux
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

// 4-to-1 Multiplexer using Dataflow Modeling
module mux (
    input  wire I0, I1, I2, I3,       // Data inputs
    input  wire S0, S1,               // Select lines
    output wire Y                     // Output
);

    // Dataflow expression using logic equation
    assign Y = (~S1 & ~S0 & I0) | 
               (~S1 &  S0 & I1) | 
               ( S1 & ~S0 & I2) | 
               ( S1 &  S0 & I3);

endmodule


module decod (
    input  wire sl1,sl0,    // 2-bit input
    output reg  [3:0] out     // 4-bit output
);

    always @(*) begin
        case ({sl1,sl0})
            2'b00: out = 4'b0001;
            2'b01: out = 4'b0010;
            2'b10: out = 4'b0100;
            2'b11: out = 4'b1000;
            default: out = 4'b0000;
        endcase
    end

endmodule



module d_latch (
    input wire [3:0]I,      // Data input
    input wire En,     // Enable (level-sensitive control)
    output reg q1,q2,q3,q4
);

    always @(*) begin
        if (En)
            q1 = I[0];
            q2 = I[1];
            q3 = I[2];
            q4 = I[3];     // Transparent when enabled
        // else Q holds its value (implied)
    end

endmodule



module system (input clk,input [3:0]N,output [3:0]Y,output data);

wire L1;
wire [1:0]W;
wire [3:0]a;
wire b1,b2,b3,b4;

mux uut1(.I0(N[0]),.I1(N[1]),.I2(N[2]),.I3(N[3]),.S0(W[0]),.S1(W[1]),.Y(L1));
decod uut2(.sl0(W[0]),.sl1(W[1]),.out(a));
d_latch uut3(.I(a),.En(clk),.q1(b1),.q2(b2),.q3(b3),.q4(b4));
c_counter_binary_0 uut4(.CLK(clk),.Q(W));
assign Y={b4,b3,b2,b1};
assign data=L1;
ila_0 my_ila (
        .clk(clk),         // Clock for ILA
        .probe0(Y[0]) ,
        .probe1(Y[1]),
        .probe2(Y[2]),
        .probe3(Y[3])  // Signal to be observed
    );
endmodule 


module top (input clk,output data);


wire [3:0] I;

system primary(.clk(clk),.N(I),.data(data));


vio_0 control (.clk(clk),.probe_out0(I));

endmodule