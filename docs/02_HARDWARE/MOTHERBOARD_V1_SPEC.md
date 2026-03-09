# Motherboard v1 Specification

## Overview

This document defines the full engineering specification for motherboard v1 of the Cyberdeck Research Workstation.

Primary goals:

- integrate practical peripherals directly on-board
- keep high-complexity tools modular where appropriate
- provide a stable first fabrication target with clear validation gates

Canonical companion docs:

- interface details: [MODULE_INTERFACE_SPEC.md](MODULE_INTERFACE_SPEC.md)
- BOM and sourcing: [BOM_TEMPLATE.md](BOM_TEMPLATE.md)
- bring-up validation: [HARDWARE_CHECKLIST.md](HARDWARE_CHECKLIST.md)

---

## Design Scope

## In Scope (v1)

- CM5 carrier implementation
- USB-C power input and UPS power path
- 5V + 3.3V rails with margin
- onboard Wi-Fi/Bluetooth module path
- onboard GPS receiver path
- onboard IR front-end
- onboard USB-UART bridge and HID/automation coprocessor
- SPI/I²C/UART/GPIO debug and expansion headers
- maintenance USB path and core diagnostics features

## Deliberately External in v1

- HackRF SDR (modular)
- Proxmark3 (modular)
- external high-end logic analyzer (optional development tool)

## Out of Scope (v1)

- Thunderbolt 4 controller integration
- advanced battery telemetry/fuel gauge system
- fully integrated high-bandwidth logic analyzer replacement

---

## Port Selection v1

| Port / Interface                           | Decision     | Priority        | Reason                                                            |
| ------------------------------------------ | ------------ | --------------- | ----------------------------------------------------------------- |
| USB-C PD (Power In)                        | Include      | Must-have       | universal power and charging path                                 |
| USB 3.x Host Ports                         | Include      | Must-have       | tool and storage connectivity                                     |
| Maintenance USB Port                       | Include      | Must-have       | recovery/debug/service workflows                                  |
| RJ45 Gigabit Ethernet                      | Include      | Must-have       | stable networking and testing                                     |
| PCIe Gen3 x1 (SDR path)                    | Include      | Must-have       | high-speed expansion path                                         |
| M.2 E-Key or equivalent Wi-Fi/BT interface | Include      | Must-have       | onboard wireless integration                                      |
| NVMe storage path                          | Include      | Must-have       | performance and logging workload                                  |
| UART Debug Header (3.3V TTL)               | Include      | Must-have       | bring-up and fault diagnosis                                      |
| SPI/I²C/GPIO Headers                       | Include      | Must-have       | embedded research/debug expandability                             |
| SMA/U.FL RF connector strategy             | Include      | Must-have       | RF usability and serviceability                                   |
| Thunderbolt 4                              | Exclude (v1) | Not recommended | high complexity, certification burden, limited value for v1 goals |

---

## System Architecture

```
Cyberdeck Motherboard v1
│
├── Compute Section
│   └── CM5 Connector + Boot/Control
│
├── Power Section
│   ├── USB-C Input + Protection
│   ├── Charger / Power Path Controller
│   ├── 18650 Battery Interface
│   ├── 5V Main Rail
│   └── 3.3V Peripheral Rail
│
├── High-Speed Section
│   ├── PCIe x1 Path (SDR/expansion)
│   ├── USB Hub (internal + maintenance)
│   └── Wi-Fi/Bluetooth Module Interface
│
├── Low-Speed Section
│   ├── SPI / I²C / UART / GPIO headers
│   ├── GPS interface
│   └── IR front-end
│
├── Coprocessor Section
│   ├── HID/automation MCU
│   └── USB-UART bridge
│
└── Diagnostics Section
    ├── test points
    ├── status LEDs
    └── reset/recovery controls
```

---

## Electrical and Mechanical Targets

| Parameter          | Target                                          |
| ------------------ | ----------------------------------------------- |
| PCB Stack-up       | 4-layer minimum                                 |
| Board Envelope     | ~100 x 70 mm (subject to connector constraints) |
| Input Power        | USB-C PD with protected 5V path                 |
| Main Rails         | 5V, 3.3V                                        |
| 5V Planning Load   | 3.0-5.0A peak                                   |
| 3.3V Planning Load | 1.0-1.5A                                        |
| Design Margin      | >= 25% headroom on regulated paths              |
| Thermal Intent     | heatsink + enclosure airflow channels           |

---

## Power Tree Specification

```
USB-C Input
  -> ESD/OCP Protection
  -> Charger + Power Path Controller
  -> Battery Pack (18650)
  -> 5V Main Rail
      -> CM5 + high-load consumers
      -> USB hub / maintenance path
  -> 3.3V Peripheral Rail
      -> GPS / IR front-end / GPIO logic / control ICs
```

Power integrity requirements:

- keep high di/dt loops compact
- allocate adequate copper width for 5V high-current paths
- place decoupling near all critical loads and interfaces
- maintain clean return paths and avoid split-return crossings on critical nets

---

## Connector and Header Definition

| Group     | Interface            | Physical Strategy                            | Notes                              |
| --------- | -------------------- | -------------------------------------------- | ---------------------------------- |
| Power     | USB-C input          | board-edge USB-C                             | ESD + overcurrent + reverse safety |
| Power     | Battery connector    | locking keyed connector                      | polarity-safe placement            |
| Data      | Ethernet             | RJ45 w/ magnetics                            | board-edge service access          |
| Data      | USB host/maintenance | labeled board-edge ports                     | recovery + tooling workflows       |
| RF        | SDR path             | dedicated high-speed + RF connector strategy | keep RF and noisy zones separated  |
| Debug     | UART                 | 3-pin/4-pin shrouded header                  | board-edge for probe access        |
| Expansion | SPI/I²C/GPIO         | shrouded labeled headers                     | reduce field wiring mistakes       |

---

## Interface Requirements (Summary)

Detailed signal definitions remain in [MODULE_INTERFACE_SPEC.md](MODULE_INTERFACE_SPEC.md).

v1 summary:

- PCIe: Gen3 x1, short route, controlled impedance, minimal stubs
- USB: internal + maintenance paths with differential routing discipline
- UART: 3.3V TTL debug, always available at edge header
- SPI/I²C: clean routing, clear label discipline, debug visibility
- GPIO: control lines for IR and expansion hooks

---

## Layout and Routing Constraints

## High-Speed

- PCIe differential target: 85 ohm
- preserve pair coupling and limit mismatch
- minimize via count and avoid unnecessary layer transitions
- isolate from switching power noise

## Power

- allocate wide rails and multi-via transitions on high current paths
- keep regulator input/output loops short
- place bulk and local decoupling per load profile

## Low-Speed and Control

- group SPI/I²C/UART by function and return reference
- keep I²C lengths moderate and predictable
- keep debug paths accessible and low-noise

## RF / Noise

- maintain uninterrupted return paths near critical interfaces
- avoid routing high-speed nets across return discontinuities
- reserve shielding/keepout zones where RF coupling risk is higher

Implementation checklists:

- [../../hardware/pcb/KICAD_CONSTRAINTS_CHECKLIST.md](../../hardware/pcb/KICAD_CONSTRAINTS_CHECKLIST.md)
- [../../hardware/pcb/NETCLASS_TEMPLATE.md](../../hardware/pcb/NETCLASS_TEMPLATE.md)
- [../../hardware/pcb/NET_ASSIGNMENT_MAP.md](../../hardware/pcb/NET_ASSIGNMENT_MAP.md)
- [../../hardware/pcb/PRE_FAB_SIGNOFF.md](../../hardware/pcb/PRE_FAB_SIGNOFF.md)

---

## Thermal and Serviceability Requirements

- place thermally dense components with airflow path in mind
- keep service-critical connectors and headers unobstructed
- avoid placing key connectors under modules or inaccessible zones
- include clear silkscreen labels for all external interfaces and test points

---

## Diagnostics and Bring-Up Requirements

Mandatory v1 diagnostics:

- labeled test points: 5V, 3.3V, GND, and critical control nets
- reset and recovery controls accessible without disassembly
- power/boot/fault LEDs
- exposed UART debug header

Bring-up execution:

- hardware validation checklist: [HARDWARE_CHECKLIST.md](HARDWARE_CHECKLIST.md)
- issue tracking: [../03_EXECUTION/EXECUTION_TRACKER.md](../03_EXECUTION/EXECUTION_TRACKER.md)

---

## Manufacturing Outputs (Pre-Fab Package)

Required outputs before fabrication:

- schematic PDF and ERC report
- PCB layout and DRC report
- Gerber + drill files
- BOM + manufacturer part list
- pick-and-place (if assembly service used)
- assembly notes and polarity/orientation callouts

---

## Validation Gates

## Gate A: Design Complete (No Hardware)

- architecture frozen
- interfaces frozen
- constraints applied and reviewed

## Gate B: Pre-Fab Sign-Off

- ERC/DRC clean or accepted exceptions documented
- high-speed and power reviews complete
- manufacturing package generated

Formal sign-off template:

- [../../hardware/pcb/PRE_FAB_SIGNOFF.md](../../hardware/pcb/PRE_FAB_SIGNOFF.md)

## Gate C: Bring-Up Sign-Off (Hardware)

- rails within expected behavior
- CM5 boots reliably
- maintenance/debug interfaces functional
- thermal and stability checks pass

---

## Risk Register

| Risk                           | Impact                   | Mitigation                             |
| ------------------------------ | ------------------------ | -------------------------------------- |
| Over-integrated first revision | schedule/re-spin risk    | keep specialized tools modular in v1   |
| Power transients and brownouts | reset instability        | current margin + staged load test plan |
| High-speed routing mistakes    | unreliable IO behavior   | strict constraints and pre-fab review  |
| Mechanical access issues       | slow bring-up and repair | board-edge debug/service access rules  |

---

## Revision Policy

| Version | Focus                                                          |
| ------- | -------------------------------------------------------------- |
| v1.0    | bring-up-ready baseline and stable core integration            |
| v1.1    | fix issues from first bring-up, improve thermal/serviceability |
| v2.0    | deeper integration and optional advanced telemetry/expansion   |

---

## Definition of Done (Spec Complete)

Motherboard v1 spec is complete when:

- [ ] all port/interface decisions are frozen
- [ ] power tree and budget assumptions are documented
- [ ] high-speed/power routing constraints are documented and linked to implementation checklists
- [ ] diagnostics and bring-up requirements are explicit
- [ ] pre-fab output requirements and validation gates are defined

At this point, schematic/layout implementation can proceed without ambiguity.
