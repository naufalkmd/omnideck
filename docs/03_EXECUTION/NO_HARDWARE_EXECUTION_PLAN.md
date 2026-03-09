# No-Hardware Execution Plan

## Overview

This plan maps each roadmap phase to work that can be completed without purchasing hardware, including simulation tasks and deferred validation.

Goal: maximize project progress before procurement while reducing integration risk later.

Detailed simulation tools and usage references are documented in [SIMULATION_TOOLING_GUIDE.md](SIMULATION_TOOLING_GUIDE.md).

Execution workflow and weekly operation are documented in [SIMULATION_RUNBOOK.md](SIMULATION_RUNBOOK.md) and tracked in [EXECUTION_TRACKER.md](EXECUTION_TRACKER.md).

---

## Readiness Summary

Estimated progress possible before hardware purchase:

- Documentation + architecture readiness: 100%
- Electrical/mechanical design readiness: 70-90%
- Software environment readiness: 60-80%
- Hardware validation readiness: 20-40% (planning only)
- Overall project readiness: ~60-75%

---

## No-Hardware Limitations

The following limitations define what cannot be fully validated before purchasing hardware.

### Not Fully Validatable Without Hardware

- RF front-end behavior in real environments (noise floor, interference, antenna effects)
- monitor mode and packet injection reliability across the selected onboard Wi-Fi chipset
- Bluetooth sniffing quality on live channels and crowded spectrum
- RFID/NFC read/write/emulation behavior against real tags/readers
- true SPI/I²C/UART signal integrity on physical targets
- end-to-end USB HID behavior on diverse host systems

### Partially Validatable (Simulation/Mock Only)

- thermal behavior (estimated models only; no real enclosure heat-soak)
- power runtime and brownout resilience (calculated only; no battery discharge curves under load)
- driver compatibility (package installation and config yes, actual device I/O no)
- field testing workflows (procedure and reporting yes, live capture quality no)

### Requires Real Hardware for Sign-Off

- electrical bring-up pass/fail
- RF performance and replay reliability
- peripheral interoperability and latency measurements
- thermal/stability tests under sustained load
- battery runtime verification vs target

Practical interpretation: no-hardware execution is excellent for design readiness and software/process preparation, but hardware purchase is still required for final validation and production confidence.

---

## Phase-by-Phase Plan

## Phase 1 — Research and Planning (No Hardware: 100%)

### Do Now

- finalize architecture and module interfaces
- freeze capability matrix and target use cases
- complete BOM v1 with alternates and lead-time risk tags
- define legal/authorized testing scope and documentation policy

### Simulate / Analyze

- compare module options using specs and protocol requirements
- perform power budget estimates with safety margin

### Defer Until Hardware

- none (phase is fully completable without hardware)

### Exit Criteria

- architecture docs finalized
- BOM v1 approved
- interface spec approved

---

## Phase 2 — Hardware Prototyping (No Hardware: 60-80%)

### Do Now

- schematic capture in KiCad
- PCB floorplanning and placement strategy
- route critical interfaces (PCIe, USB, SPI, I²C, UART)
- define test points and debug headers
- run ERC/DRC and manufacturing checks

### Simulate / Analyze

- power path and regulator headroom calculations
- differential pair length/impedance rule checks
- thermal estimate based on datasheet power dissipation

### Defer Until Hardware

- board bring-up validation
- signal quality measurements
- real thermal verification

### Exit Criteria

- schematic and PCB pass design checks
- fab-ready design package generated (Gerber/BOM/PnP)
- bring-up checklist prepared

---

## Phase 3 — Software Integration (No Hardware: 50-70%)

### Do Now

- prepare Linux baseline image strategy (Kali/Ubuntu)
- script toolchain bootstrap (GNU Radio, Wireshark, Python stack)
- create config templates for expected interfaces
- build automation scripts for logging, parsing, and report generation

### Simulate / Analyze

- test workflows using sample captures (pcap/IQ/demo datasets)
- validate parsers and report pipelines with synthetic inputs
- dry-run service orchestration and startup scripts

### Defer Until Hardware

- real driver/device validation for SDR, Proxmark3, and onboard logic capture subsystem
- monitor mode and packet injection confirmation

### Exit Criteria

- reproducible software setup scripts complete
- mock data analysis pipeline validated end-to-end
- integration test playbook written

---

## Phase 4 — Field Testing (No Hardware: 20-40%)

### Do Now

- define test protocols for RF, wireless, RFID, and debug buses
- create standardized report templates and pass/fail criteria
- prepare issue taxonomy and defect workflow

### Simulate / Analyze

- execute test procedure rehearsals using synthetic datasets
- validate test evidence format and metrics dashboard structure

### Defer Until Hardware

- RF sensitivity/performance tests
- packet injection and live traffic captures
- embedded interface probing on real targets

### Exit Criteria

- field test plan finalized
- report templates and acceptance thresholds finalized

---

## Phase 5 — Enclosure Design (No Hardware: 70-90%)

### Do Now

- CAD enclosure concept and internal layout
- connector cutout planning and cable routing channels
- mounting point strategy for modules and battery pack

### Simulate / Analyze

- assembly clash checks and clearance validation
- airflow path and thermal dissipation modeling
- serviceability review (access to ports, debug points)

### Defer Until Hardware

- fit verification with real components
- vibration/drop handling checks on assembled unit

### Exit Criteria

- enclosure v1 CAD ready
- print/CNC-ready files exported
- assembly guide draft prepared

---

## Phase 6 — Advanced Features (No Hardware: 40-60%)

### Do Now

- define interfaces for future modules (LoRa/FPGA/AI)
- prototype AI pipelines using public datasets
- build plugin-style software architecture for modular expansion

### Simulate / Analyze

- evaluate compute load and memory budget for advanced workloads
- benchmark candidate algorithms on desktop equivalents

### Defer Until Hardware

- real-time performance validation on CM5
- peripheral latency and throughput validation

### Exit Criteria

- advanced feature architecture documented
- at least one software prototype demonstrated with sample data

---

## Procurement Trigger Points

Buy hardware only when these are true:

- BOM v1 is stable with alternates
- PCB and interface design pass review
- software setup scripts are reproducible
- field test procedures and checklists are ready

This reduces idle hardware time and avoids premature purchases.

---

## Risk Register (Pre-Procurement)

| Risk                                | Impact                 | Mitigation                                         |
| ----------------------------------- | ---------------------- | -------------------------------------------------- |
| Part availability changes           | Schedule delays        | Track alternates, monitor lead times weekly        |
| Interface assumptions invalid       | Rework in PCB/software | Freeze interface spec and review with checklists   |
| Underestimated power/thermal loads  | Instability            | Keep power/thermal margins and test plan ready     |
| Toolchain drift across environments | Integration failures   | Use scripted setup and version-pinned dependencies |

---

## 30-Day No-Hardware Sprint

Week 1:

- freeze architecture + interfaces
- finalize BOM v1

Week 2:

- complete schematic + major PCB constraints
- draft software bootstrap scripts

Week 3:

- run ERC/DRC and generate fab package draft
- validate software workflow on sample datasets

Week 4:

- finalize field test procedures and report templates
- produce enclosure v1 CAD and integration plan

---

## Success Definition

Before buying hardware, the project should have:

- stable technical specs
- reproducible software baseline
- fab-ready PCB package
- test-ready procedures
- enclosure v1 design

At that point, hardware purchase is used for validation and refinement, not discovery.
