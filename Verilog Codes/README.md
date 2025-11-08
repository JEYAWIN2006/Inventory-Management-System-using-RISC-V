# 🧠 Inventory Management System using RISC-V

## 📘 Overview
This project presents the design and implementation of a **Single-Cycle RISC-V Processor** using **Verilog HDL**, simulated in **ModelSim**, and synthesized using **Xilinx ISE Design Suite**.  
An **Inventory Management System** program written in C was compiled into RISC-V machine code using the GCC toolchain and executed on this processor model.  

The processor is based on the **RV32I instruction set architecture**, which supports fundamental operations such as arithmetic, branching, and memory access — all executed in a **single clock cycle**.

---

## ⚙️ Project Workflow

### 🧩 Step 1 — Writing the Application Code
- The project starts by developing an **Inventory Management System** in **C language**.  
- The code performs basic inventory operations such as:
  - Adding new items  
  - Removing existing items  
  - Viewing stock levels  
  - Updating item quantities  
- The program is written using RISC-V compatible syntax and tested using the **Ripes simulator**.  
  👉 https://github.com/mortbopet/Ripes/releases/download/v2.2.6/Ripes-v2.2.6-win-x86_64.zip

---

### 🔧 Step 2 — Generating Machine Code
- The C source code is compiled using the **RISC-V GCC cross-compiler** to generate the **`.hex` file** (machine code).  
- The generated `.hex` file contains the instruction opcodes that the Verilog processor can execute.  
  👉 https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-w64-mingw32.zip
 
---

### 🧠 Step 3 — Designing the Processor in Verilog
The processor design is based on a **single-cycle architecture**, where each instruction completes its execution in one clock cycle.

The major submodules implemented in Verilog are:
1. **Program Counter (PC)** – Tracks the address of the current instruction  
2. **Instruction Memory** – Stores machine code (from `.hex` file)  
3. **Register File** – Holds 32 general-purpose registers  
4. **Immediate Generator** – Extracts and sign-extends immediate values  
5. **ALU (Arithmetic Logic Unit)** – Performs arithmetic and logic operations  
6. **Data Memory** – Handles load and store operations  
7. **Control Unit** – Decodes instructions and generates control signals  
8. **Branch Unit** – Handles conditional branching  

Each submodule was tested and verified before being integrated into the **top-level module**.

---

### 🧩 Step 4 — Loading the HEX File into Instruction Memory
- The compiled `.hex` file from the Ripes simulator was loaded into the **Instruction Memory**.  
- This file provides the sequence of instructions for execution.

---

### ⚙️ Step 5 — Simulation in ModelSim
- A **testbench** was written to simulate the processor behavior.  
- The Verilog design was compiled and executed in **ModelSim**, generating:
  - **Console output** showing Program Counter (PC) and Instructions over time  
  - **Waveform output** illustrating clock, control signals, and data flow  
- These results confirmed that the processor correctly fetched, decoded, and executed each instruction.

👉 https://www.intel.com/content/www/us/en/software-kit/750666/modelsim-intel-fpgas-standard-edition-software-version-20-1-1.html

---

### 🧮 Step 6 — Report Synthesis in Xilinx ISE
- The Verilog design was synthesized using **Xilinx ISE Design Suite**.  
- The **Device Utilization Summary** confirmed that the design used minimal FPGA resources:
  - 1% Slice Registers  
  - 1% Slice LUTs  
  - 1% Occupied Slices  
  - 7% IOBs  
- This demonstrates the processor’s efficient sysnthesis implementation.  
  👉 https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive-ise.html

---

## 📊 Simulation & Results

- The **ModelSim waveform** displayed correct signal transitions for instruction fetch and execution stages.  
- The **console output** showed sequential updates of the Program Counter (PC) and instruction values.  
- The system successfully executed the Inventory Management program instructions and updated memory/register values as expected.

---

## 💡 Key Features
- Single-Cycle RISC-V Processor (RV32I)
- Modular Verilog design (easy to extend or modify)
- Supports arithmetic, logical, branch, and memory operations
- Tested using Ripes and ModelSim
- Synthesized on Xilinx ISE for Report implementation
- Demonstrates an embedded Inventory Management application

---

## 🚀 Tools and Technologies Used
| Category | Tool / Platform | Description |
|-----------|-----------------|--------------|
| Simulator | Ripes Simulator | For compiling and testing RISC-V code 👉 * https://github.com/mortbopet/Ripes/releases/download/v2.2.6/Ripes-v2.2.6-win-x86_64.zip
* |
| Compiler | RISC-V GCC Toolchain | To generate machine code from C 👉 *[https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-w64-mingw32.zip]* |
| HDL | Verilog | Hardware description of processor |
| Simulator | ModelSim | For waveform and behavior simulation 👉 *https://www.intel.com/content/www/us/en/software-kit/750666/modelsim-intel-fpgas-standard-edition-software-version-20-1-1.html* |
| Synthesizer | Xilinx ISE Design Suite | For FPGA synthesis and device utilization 👉 *[https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive-ise.html]* |
| Version Control | GitHub | For source code management and documentation |

---

## 🧾 Project Structure
Inventory-Management-System-using-RISC-V/
│
├── src/ # Verilog source files
│ ├── alu.v
│ ├── control.v
│ ├── register_file.v
│ ├── instruction_memory.v
│ ├── data_memory.v
│ └── top_module.v
│
├── testbench/ # Testbench files
│ └── testbench.v
│
├── hex/ # Compiled program files
│ └── program.hex
│
├── simulation/ # ModelSim waveform and console screenshots
│
├── synthesis/ # Xilinx device utilization reports
│
└── README.md # Project documentation

## 🏁 Conclusion
This project successfully demonstrates the implementation of a **Single-Cycle RISC-V processor** using **Verilog HDL**, integrated with an **Inventory Management System** as an example embedded application.  
Through simulation and synthesis, it validates both **software–hardware integration** and **the working principle of the RISC-V architecture**.  
The design’s simplicity, modularity, and educational focus make it an excellent base for future enhancements like **pipelining**, **I/O interfacing**, or **single-cycle processing**.

## 👤 Author
**JEYAWIN GJ**  
Electronics and Communication Engineering  

MEPCO SCHLENK ENGINNERING COLLEGE

SIVAKSI,TAMILNADU

626005.

Ph no:+917708291572

E-mail:gjeyawin@gmail.com
