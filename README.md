16-BIT HIERARCHICAL VERILOG COMPARATOR
=======================================

PROJECT OVERVIEW
----------------
This project is a complete implementation of a 16-bit digital magnitude comparator using the Verilog Hardware Description Language (HDL). Its fundamental purpose is to compare two 16-bit binary numbers, A and B, and determine their arithmetic relationship. The circuit's most notable feature is its hierarchical and modular architecture, a robust design practice where a complex system is constructed from smaller, reusable, and well-verified building blocks. This approach enhances the design's scalability, making it easy to understand, debug, and extend to larger bit-widths (e.g., 32 or 64 bits). The repository includes all necessary source code, a verification testbench, and an automation script for seamless simulation.


WHAT IT IS
----------
A digital magnitude comparator is a combinational logic circuit that compares two binary numbers and indicates whether one is greater than, less than, or equal to the other. This specific implementation is a 16-bit comparator with the following interface:

* Inputs: Two 16-bit data buses, A[15:0] and B[15:0].
* Outputs: Three single-bit flags: gt (asserts high when A > B), eq (asserts high when A = B), and lt (asserts high when A < B).


HOW IT'S DONE
-------------
The design follows a classic cascading hierarchical structure. Instead of a single, complex logic block, the comparator is built recursively:

* Base Unit: The foundation is a simple 1-bit comparator (comp1) that compares two individual bits and determines the gt/eq/lt relationship.
* Scaling Up: Larger comparators are built from two instances of the next-smallest comparator. For example, a 4-bit comparator is made from two 2-bit comparators—one for the upper two bits and one for the lower two.
* Decision Logic: At each stage, a multiplexer is used to make a decision. It first checks the result from the most significant bit (MSB) block. If the MSBs are not equal, that result is the final answer. If they are equal, the multiplexer selects the result from the least significant bit (LSB) block. This process repeats up to the final 16-bit module.


WHERE IT CAN BE USED
--------------------
Magnitude comparators are fundamental components in a wide range of digital systems and applications, including:

* CPUs: They are a core part of the Arithmetic Logic Unit (ALU), used for executing conditional branch instructions (e.g., if (x > y)).
* Control Systems: Used for making decisions based on sensor data, such as activating a cooling fan if a temperature reading exceeds a set threshold.
* Address Decoding: In memory systems, comparators can be used to check if a requested address falls within a specific range.
* Data Processing: Employed in sorting algorithms, priority encoders, and other circuits that require ordering or comparing data.


NOTE
----
For detailed instructions on the file structure, compilation, and how to run the simulation using the provided scripts, please go through the README.txt file.
