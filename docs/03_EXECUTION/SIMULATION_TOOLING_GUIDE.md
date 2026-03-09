# Simulation Tooling Guide

## Overview

This guide defines the simulation and pre-hardware validation toolset for the Cyberdeck Research Workstation.

Use it to maximize progress before procurement while keeping expectations realistic about what still requires physical validation.

---

## Simulation Coverage at a Glance

| Area                      | Tools                               | What You Can Validate Now                         | What Still Needs Hardware                      |
| ------------------------- | ----------------------------------- | ------------------------------------------------- | ---------------------------------------------- |
| Schematic / PCB rules     | KiCad ERC/DRC                       | Connectivity, rules, clearances, constraints      | Real signal behavior, bring-up outcome         |
| Power behavior            | LTspice / ngspice / QSPICE          | Startup, ripple, transient response (model-based) | Real battery sag, inrush edge-cases            |
| Signal integrity planning | KiCad constraints, calculator tools | Length matching strategy, impedance targets       | Measured eye/quality on fabricated board       |
| Thermal planning          | CAD thermal estimates               | Relative hotspot and airflow planning             | Real heat-soak and enclosure thermal stability |
| OS / service behavior     | QEMU / Renode (where supported)     | Boot flow, startup scripts, service orchestration | Real peripheral enumeration and timing         |
| RF/DSP pipeline           | GNU Radio + sample IQ               | Algorithm and flowgraph correctness               | RF front-end performance in environment        |
| Packet analysis workflow  | Wireshark + sample PCAP             | Filters, decode pipelines, reporting              | Live capture reliability/injection quality     |
| Automation pipeline       | Python tests/scripts                | Parser/report correctness and reproducibility     | Hardware I/O correctness                       |

---

## Tool Details

## 1) KiCad ERC/DRC

### Use For

- schematic electrical rule validation
- PCB clearance/net-class checks
- manufacturing rule compliance review

### Key Outputs

- ERC report
- DRC report
- unresolved violations list

### Limitation

Design correctness is improved, but this does not prove physical board function.

---

## 2) LTspice / ngspice / QSPICE

### Use For

- regulator and rail transient behavior
- power path margin checks
- analog front-end sanity validation

### Key Outputs

- startup waveform plots
- ripple and load-step responses
- margin observations

### Limitation

Accuracy depends on model quality and assumptions.

---

## 3) Signal Integrity Planning Tools

### Use For

- differential pair routing constraints
- length/skew budget planning
- stack-up-driven impedance targets

### Key Outputs

- routing constraints sheet
- critical-net matching limits

### Limitation

Planning estimates require real board measurement for final confidence.

---

## 4) Thermal Modeling (CAD-level)

### Use For

- enclosure airflow direction planning
- heatsink placement strategy
- thermal risk hotspots

### Key Outputs

- thermal map snapshots
- enclosure airflow assumptions

### Limitation

No substitute for physical thermal validation under sustained load.

---

## 5) QEMU / Renode

### Use For

- startup script verification
- service dependency checks
- configuration workflow dry-runs

### Key Outputs

- boot/service logs
- startup pass/fail list

### Limitation

Platform/peripheral emulation fidelity is limited.

---

## 6) GNU Radio with Recorded IQ

### Use For

- DSP flowgraph validation
- demod/protocol processing checks
- classifier feature pipeline rehearsal

### Key Outputs

- decoded output artifacts
- reproducible processing pipelines

### Limitation

Does not validate live RF behavior (antenna/interference/noise floor).

---

## 7) Wireshark with Sample PCAP

### Use For

- filter and protocol-analysis logic
- report/export pipeline checks

### Key Outputs

- saved filters/profiles
- analysis report examples

### Limitation

Cannot prove live wireless chipset quality or injection success.

---

## 8) Python Automation Harness

### Use For

- repeatable parsing/report generation
- regression checks for analysis scripts

### Key Outputs

- test pass/fail artifacts
- generated summary reports

### Limitation

Validates software logic, not hardware-level behavior.

---

## Evidence to Collect Before Procurement

- [ ] KiCad ERC/DRC reports with zero blocking issues
- [ ] power simulation plots (startup, ripple, load-step)
- [ ] critical-net routing constraint summary
- [ ] thermal estimate screenshots + assumptions
- [ ] boot/service dry-run logs
- [ ] GNU Radio and Wireshark sample outputs
- [ ] automation test run outputs

---

## Final Hardware-Only Sign-Off Items

- RF sensitivity/replay performance in real environments
- monitor-mode and packet-injection reliability on the final onboard wireless chipset
- RFID/NFC interaction against real tags/readers
- physical SPI/I²C/UART timing integrity on target lines
- sustained thermal and battery-runtime validation
