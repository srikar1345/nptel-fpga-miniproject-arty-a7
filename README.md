# FPGA Digital System Design Project

## Overview
This project implements a digital system using FPGA architecture and programming concepts. The system consists of multiple digital components including a 4-to-1 multiplexer, 2-to-4 decoder, D-latch, and binary counter, all integrated into a complete digital circuit.

## Course Information
- **Course**: NPTEL FPGA Architecture and Programming


## Project Components

### 1. 4-to-1 Multiplexer (`mux`)
- **Inputs**: 4 data inputs (I0, I1, I2, I3) and 2 select lines (S0, S1)
- **Output**: Single output (Y)
- **Implementation**: Dataflow modeling using logic equations
- **Function**: Selects one of four input signals based on the select lines

### 2. 2-to-4 Decoder (`decod`)
- **Inputs**: 2-bit input (sl1, sl0)
- **Output**: 4-bit output (out)
- **Implementation**: Behavioral modeling using case statement
- **Function**: Converts 2-bit binary input to one-hot encoded output

### 3. D-Latch (`d_latch`)
- **Inputs**: 4-bit data input (I) and enable signal (En)
- **Output**: 4 individual outputs (q1, q2, q3, q4)
- **Implementation**: Level-sensitive latch
- **Function**: Stores data when enabled, transparent when En is high

### 4. Binary Counter (`c_counter_binary_0`)
- **Input**: Clock signal (CLK)
- **Output**: 2-bit binary count (Q)
- **Function**: Generates sequential binary counting pattern

### 5. Main System (`system`)
- **Integration**: Combines all components into a complete digital system
- **Inputs**: Clock (clk) and 4-bit data (N)
- **Outputs**: 4-bit output (Y) and data signal
- **Features**: Includes ILA (Integrated Logic Analyzer) for debugging

### 6. Top Module (`top`)
- **Purpose**: Top-level module for FPGA implementation
- **Features**: Includes VIO (Virtual Input/Output) for real-time control

## File Structure
```
├── miniproject.v                    # Main Verilog source code
├── MiniProject_Final_Report_With_Waveforms.docx  # Project documentation
├── *.jpg                           # Test results and waveform images
└── README.md                       # This file
```

## Hardware Requirements
- **FPGA Board**: Digilent Arty A7
- **Programming/Debugging**: USB connection

## Software Requirements
- **Development Platform**: Xilinx Vivado Design Suite (latest version recommended)
- Verilog HDL support
- ILA and VIO IP cores

## Setup Instructions

### 1. Project Setup
1. Open Xilinx Vivado Design Suite
2. Create a new project
3. Add the `miniproject.v` file to your project
4. Configure your target FPGA device

### 2. IP Core Configuration
1. Add ILA (Integrated Logic Analyzer) IP core
2. Add VIO (Virtual Input/Output) IP core
3. Add Binary Counter IP core
4. Configure IP cores according to your design requirements

### 3. Constraint File
Create a constraint file (`.xdc`) with:
- Clock pin assignment
- Input/output pin assignments
- Timing constraints

### 4. Synthesis and Implementation
1. Run synthesis
2. Run implementation
3. Generate bitstream
4. Program the FPGA

## Usage

### VIO (Virtual Input/Output) Core
The VIO core allows you to provide real-time, interactive inputs to the FPGA design directly from the Vivado hardware manager. In this project, the VIO core is used to set the 4-bit input (`I`) to the system, enabling you to test different input combinations without physical switches.

### ILA (Integrated Logic Analyzer) Core
The ILA core is used for real-time signal monitoring and debugging. It probes the 4-bit output (`Y`) of the system, allowing you to observe the internal signals and outputs in real time using the Vivado hardware manager. This is essential for verifying correct operation and debugging the design.

### Testing the System
1. Program the Arty A7 FPGA with the generated bitstream
2. Use VIO in Vivado to provide input signals
3. Monitor outputs using ILA in Vivado
4. Verify functionality with different input combinations

### Expected Behavior
- The system should cycle through different states based on the counter
- Multiplexer should select different inputs based on counter output
- Decoder should provide appropriate one-hot outputs
- D-latch should store and output the decoded values

## Test Results

### Data LED Output
*Insert a photo here showing the data LED glowing on the Arty A7 board.*

### Waveform Analysis
*Insert a screenshot here of the resulting waveform as captured by the ILA core in Vivado.*

The project includes several test images showing:
- System behavior with different inputs (0, 1, 2, 3, 4, 5, F)
- LED output displays
- Waveform analysis results

## Key Features
- **Modular Design**: Each component is implemented as a separate module
- **Debugging Support**: Integrated ILA for real-time signal monitoring
- **Real-time Control**: VIO interface for dynamic input control
- **Comprehensive Testing**: Multiple test scenarios with visual results

## Learning Outcomes
This project demonstrates:
- Verilog HDL programming
- Digital circuit design principles
- FPGA implementation techniques
- IP core integration
- Debugging and testing methodologies
- System integration concepts
### Output Waveform

![Output waveform captured using ILA in Vivado](images/output_waveform.jpg)
## Contributing
This is an academic project completed as part of the NPTEL FPGA Architecture and Programming course. The project serves as a learning resource for FPGA design and digital system implementation.
### FPGA Board with Data LED Glowing

![Arty A7 FPGA board showing data LED glowing](images/arty_a7_led.jpg)
## License
This project is created for educational purposes as part of the NPTEL course curriculum.

---

## Note on Output Behavior
In some cases, you may observe that the output remains the same regardless of the input provided via VIO. This can occur if:
- The select lines to the multiplexer are not changing as expected (e.g., if the counter is not incrementing or is held at a fixed value)
- The enable signal to the D-latch is not toggling, causing the outputs to remain latched
- The input connections or IP core configurations are not correctly mapped in Vivado

**Troubleshooting Tips:**
- Ensure the counter is running and driving the select lines
- Verify the VIO is correctly connected to the system input
- Check the clock and enable signals
- Use the ILA to probe internal signals and confirm signal transitions

If the output is always the same, it is likely due to one of the above reasons. Double-check your Vivado block design and constraints to ensure all connections are correct. 
