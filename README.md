# 16_Bit_Comparitor
A 16-bit magnitude comparator in Verilog with a modular, hierarchical design. This project compares two numbers (A, B) and outputs gt/eq/lt signals. It includes a complete testbench and a run.do script for easy, one-command simulation in ModelSim.

******************************************************************
*
* 16-BIT HIERARCHICAL MAGNITUDE COMPARATOR
* Verilog Implementation
*
******************************************************************


1.0 PROJECT DESCRIPTION
-----------------------
This project provides a structural Verilog implementation of a 16-bit digital magnitude comparator. The module is designed to compare two 16-bit input vectors, A and B, and determine their arithmetic relationship. The comparison results are provided via three dedicated single-bit output ports:

* gt (Greater Than): Asserts to '1' if A > B.
* eq (Equal):         Asserts to '1' if A = B.
* lt (Less Than):     Asserts to '1' if A < B.

The design emphasizes a modular and hierarchical methodology, which enhances scalability, readability, and ease of verification.


2.0 DESIGN ARCHITECTURE
-----------------------
The comparator's architecture is based on a cascading, hierarchical structure. Rather than a flat, gate-level implementation, the design is recursively built from smaller, identical comparator units.

The fundamental building block is a 1-bit comparator (`comp1`). Larger comparators are constructed by instantiating two comparators of half the bit-width. For instance, a 4-bit comparator (`comp4`) is composed of two 2-bit comparators (`comp2`). Each stage combines the results using a 3-bit multiplexer (`mux3`). This multiplexer implements the core logic: if the comparison of the Most Significant Bits (MSBs) indicates a non-equal result, that result is immediately selected as the final output. If the MSBs are equal, the result from the Less Significant Bits (LSBs) is propagated through.

This scalable design pattern continues from the 1-bit unit up to the final 16-bit top-level module (`comp16`).


3.0 FILE MANIFEST
-----------------
To successfully simulate the project, the following files must be present in the working directory:

* `comparator_modules.v`: Verilog source file containing all comparator and mux modules.
* `tb.v`: The top-level Verilog testbench for verification.
* `run.do`: The ModelSim automation script for compilation and simulation.


4.0 SIMULATION PROCEDURE (MODELSIM)
-----------------------------------
Execute the following steps to run the verification testbench using ModelSim.

1.  ENVIRONMENT SETUP: Place all files listed in the File Manifest into a single project directory.

2.  DIRECTORY NAVIGATION: Launch ModelSim. In the Transcript window, change the current directory to your project directory using the `cd` command.
    Example: cd {C:/Designs/Verilog/Comparator}

3.  SCRIPT EXECUTION: Execute the provided automation script by typing the following command into the Transcript and pressing Enter:
    do run.do

4.  OUTPUT VERIFICATION: The script will compile the source files, load the simulator with the testbench, and run the simulation to completion. The output will be displayed in the Transcript window.


5.0 AUTOMATION SCRIPT (`run.do`)
--------------------------------
The `run.do` file is a Tcl script for ModelSim that automates the entire simulation workflow. It ensures consistency and repeatability by scripting the compilation, elaboration, and simulation phases.

Contents of `run.do`:
---------------------
# Compile all Verilog source files into the 'work' library.
vlog -work work *.v

# Elaborate and load the top-level testbench for simulation.
vsim work.tb

# Run the simulation for its entire duration.
run -all


6.0 VERIFICATION AND EXPECTED OUTPUT
------------------------------------
The included testbench (`tb.v`) verifies the comparator's functionality. It first executes a series of 10 tests using pseudo-random 16-bit values for inputs A and B. It concludes with one static test case to specifically verify the equality condition (`A = 12345`, `B = 12345`).

NOTE: The output from the first 10 random tests will naturally vary between simulation runs. The final line of the output, however, is deterministic and should always be the same.

Sample Simulation Transcript:
-----------------------------
# 13604 24193  001
# 54793 22115  100
# 31501 39309  001
# 33893 21010  100
# 58113 52493  100
# 61814 52541  100
# 22509 63372  001
# 59897  9414  100
# 33989 53930  001
# 63461 29303  100
# 12345 12345  010
