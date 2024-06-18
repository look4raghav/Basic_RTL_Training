`timescale 1ns / 1ps

/*******************************************************************************
FILENAME: testbench.sv

DESCRIPTION
Tasks performed by this module are as follows.
1. This is the testbench of module pulse_generation_top.
2. Changing parameter here reflects the pulse wave.

// Pulse gives their behviour accoring to the pulse durationa and pulse period parameters.
// Both parameter are compile time programmable.

HISTORY
23/12/2023 Created (RAGHAV AGGARWAL)
*******************************************************************************/

module testbench;

    logic clk;
    logic rst;
    logic o_pulse;

    pulse_generation_top #(                          // Instantiates of module pulse_generation_top
        .PULSE_DURATION(2),
        .PULSE_PERIOD(3)
      ) dut (
        .clk(clk),
        .rst(rst),
        .o_pulse(o_pulse)
      );

    initial begin
        clk = 0;
        rst = 1;
        #10 
		    rst = 0;
    end

    always begin
        #5
        clk = ~clk;
    end

    initial begin
        if((pulse_generation_top.PULSE_DURATION > pulse_generation_top.PULSE_PERIOD) || (pulse_generation_top.PULSE_DURATION <= 0) || (pulse_generation_top.PULSE_PERIOD <=0)) begin
            $display("error in values");
            $stop;
        end
        else begin
            $display("pass");
        end
    end

endmodule
