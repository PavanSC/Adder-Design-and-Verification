1-Bit Full Adder Design and Verification
Table of Contents
Introduction
Design Specification
Verification Plan
Testbench Architecture
Coverage Metrics
Simulation and Results
Usage
Conclusion
Introduction
This project focuses on the design and verification of a 1-bit full adder using Verilog/SystemVerilog and UVM. The primary objective is to implement a 1-bit full adder and verify its functionality with a comprehensive testbench that includes coverage metrics.

A 1-bit full adder is a fundamental combinational circuit in digital systems, performing addition on two input bits (A and B) with a carry-in (Cin) and providing a sum (S) and a carry-out (Cout).

Design Specification
Inputs
A - 1-bit input
B - 1-bit input
Cin - Carry-in
Outputs
S - Sum output
Cout - Carry-out
Logic Function
Sum 𝑆=𝐴⊕𝐵⊕𝐶𝑖𝑛
S=A⊕B⊕Cin
Carry-out 𝐶𝑜𝑢𝑡=(𝐴⋅𝐵)+(𝐶𝑖𝑛⋅(𝐴⊕𝐵))
Cout=(A⋅B)+(Cin⋅(A⊕B))

Verification Plan
The verification plan targets full functional coverage of the 1-bit full adder. We use constrained-random verification to generate test vectors for all possible input combinations and directed tests to validate specific edge cases.

Objectives
Ensure that all possible input combinations (A, B, Cin) produce correct outputs (S, Cout).
Achieve 100% functional coverage on the full adder’s functionality.
Input Combinations
With 3 inputs (A, B, Cin), there are 8 possible input combinations to cover:

(A=0, B=0, Cin=0)
(A=0, B=0, Cin=1)
(A=0, B=1, Cin=0)
...
(A=1, B=1, Cin=1)
Expected Results
The expected outputs are defined in a lookup table to ensure accurate verification against the design.

Testbench Architecture
The testbench is implemented in SystemVerilog, structured as follows:

Module Instantiation: Instantiate the design under test (DUT).
Stimulus Generation: Generate all 8 possible combinations of inputs A, B, and Cin using a constrained-random approach.
Scoreboarding: Implement a scoreboard to compare actual DUT outputs with expected results.
Assertions: Use assertions to check for:
Correct output (Sum and Carry-out) for each input combination.
No unintentional X or Z values.
Coverage Collection: Implement functional coverage to ensure all scenarios are exercised.
Coverage Metrics
Functional Coverage
Cover all 8 input combinations of (A, B, Cin).
The coverage report will provide information on whether the verification has exercised every possible combination of inputs, ensuring exhaustive testing of the 1-bit full adder.

Assertion Coverage
Assertions are used to check for the correctness of each output based on input combinations.

Simulation and Results
After compiling and running the testbench, a coverage report is generated to confirm that all input conditions were tested.

Expected outputs:

100% functional coverage, indicating all input combinations were tested.
Pass/fail status based on assertion checks.
