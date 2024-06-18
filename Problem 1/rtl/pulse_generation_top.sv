/*******************************************************************************
FILENAME: Pulse_Generation_Top.sv

DESCRIPTION
Tasks performed by this module are as follows.
1. Take parameter of Pulse Period and Pulse Duration
2. It shows output pulse according to given parameters.

Pulse Period - The period is the time from the start of one pulse to the next pulse.
Pulse Duration - The pulse width is a measure of the elapsed time between the leading and trailing edges of a single pulse of energy.

Pulse gives their behviour accoring to the pulse durationa and pulse period parameters.
Both parameter are compile time programmable.
If we change the parameter during compile time, then it will give pulse according to new one.

HISTORY
23/12/2023 Created (RAGHAV AGGARWAL)
*******************************************************************************/

module pulse_generation_top #(
    parameter PULSE_DURATION = 2,
    parameter PULSE_PERIOD   = 3
  )(
    input        clk,
    input        rst,
    output logic o_pulse
  );

  logic [PULSE_PERIOD-1:0] counter;

  always_ff @(posedge clk) begin
      if (rst) begin
          counter <= 0;
      end
      else if (counter == PULSE_PERIOD - 1)begin
          counter <= 0;
      end
      else begin
          counter <= counter + 1;
      end
  end

  assign o_pulse  = (counter < PULSE_DURATION);

endmodule
