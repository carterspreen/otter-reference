`timescale 1ns / 1ps

module otter_tb;

    logic CLK;
    logic BTNC;
    logic [15:0] SWITCHES;
    logic [15:0] LEDS;
    logic [7:0] CATHODES;
    logic [3:0] ANODES;

    OTTER_Wrapper DUT (
        .CLK(CLK),
        .BTNC(BTNC),
        .SWITCHES(SWITCHES),
        .LEDS(LEDS),
        .CATHODES(CATHODES),
        .ANODES(ANODES)
    );

    initial begin
        CLK = 1'b0;             //start clock
        forever #5 CLK = ~CLK;  //100 MHz is divided to 50 MHz
    end

    initial begin
        BTNC = 1'b1;         //hold reset
        SWITCHES = 16'h0000; //set switches
        #20;                 //wait 1 cycle
        BTNC = 1'b0;         //release reset
    end

endmodule
