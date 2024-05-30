# Digital-to-Analog Converter in Verilog

## Description

This repository contains Verilog code implementing a simple Digital-to-Analog Converter (DAC) using a voltage divider and multiplexer (mux) design. The DAC is designed to take a 4-bit digital input and convert it into an analog voltage output.

## Overview

The main components of this DAC implementation are:

1. **Voltage Divider Module (`voltage_divider16`)**: 
    - Generates 16 different voltage levels from a given input voltage `v_in`.
    - The output voltages are evenly divided across 16 outputs (`v_out[0:15]`).

2. **Multiplexer Module (`mux16x1`)**: 
    - Selects one of the 16 voltage levels based on a 4-bit selection input (`sel`).
    - Outputs the selected voltage.

3. **DAC Module (`dac4x1`)**: 
    - Combines the voltage divider and multiplexer to create a 4-bit DAC.
    - Takes a 4-bit digital input and outputs the corresponding analog voltage.

4. **Testbench**:
    - Tests the functionality of the voltage divider, multiplexer, and DAC modules.
    - Displays the output voltages of the voltage divider and the selected voltage from the multiplexer.
    - Iterates through all possible 4-bit inputs for the DAC and displays the resulting analog output.

## Usage

To test and verify the functionality of the DAC, compile and run the provided Verilog testbench (`test` module). The testbench will simulate the DAC operation and output the results for all 4-bit digital inputs.
