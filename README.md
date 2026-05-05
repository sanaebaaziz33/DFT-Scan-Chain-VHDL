# DFT Scan Chain — 4-bit Counter in VHDL

## 📌 Project Overview
Implementation of a Design for Testability (DFT) Scan Chain 
on a 4-bit counter using VHDL and ModelSim.

## 🎯 Objective
Detect manufacturing defects (stuck-at-0 / stuck-at-1 faults) 
inside a digital circuit using scan chain technique.

## 🏗️ Architecture
scan_in → [SFF0] → [SFF1] → [SFF2] → [SFF3] → scan_out

## 📁 Files
| File              | Description                         |
|-------------------|-------------------------------------|
| dff_normal.vhd    | Standard D Flip-Flop                |
| scan_ff.vhd       | Scan Flip-Flop (normal + test mode) |
| scan_chain.vhd    | 4 scan flip-flops chained           |
| tb_scan_chain.vhd | Testbench with 3 test scenarios     |

## 🧪 Test Scenarios
- **Test 1** — Normal mode : q follows d correctly
- **Test 2** — Scan mode : injection of pattern "1101"
- **Test 3** — Stuck-at-0 fault detection

## 📊 Simulation Results
![Waveforms](waveform.png)

## 🛠️ Tools
- VHDL
- ModelSim Altera 13.0

## 👩‍💻 Author
Baaziz Sanae — Engineering Student at INPT Rabat  
Embedded Systems & Digital Services (SESNUM)
