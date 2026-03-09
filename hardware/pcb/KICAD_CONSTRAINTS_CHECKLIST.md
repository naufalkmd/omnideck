# KiCad Constraints Checklist (Motherboard v1)

## Purpose

This checklist converts motherboard v1 requirements into KiCad-ready design constraints and review gates.

Source reference: [../../docs/02_HARDWARE/MOTHERBOARD_V1_SPEC.md](../../docs/02_HARDWARE/MOTHERBOARD_V1_SPEC.md)

Netclass starter values: [NETCLASS_TEMPLATE.md](NETCLASS_TEMPLATE.md)

Signal-to-class mapping: [NET_ASSIGNMENT_MAP.md](NET_ASSIGNMENT_MAP.md)

---

## 1) Project Setup

- [ ] KiCad project created with clear naming/versioning (`motherboard_v1`)
- [ ] Board stack-up defined as 4-layer minimum
- [ ] Net classes created for:
  - [ ] high-speed differential pairs (PCIe)
  - [ ] USB high-speed
  - [ ] power rails (5V high current, 3.3V)
  - [ ] low-speed control (SPI/I²C/UART/GPIO)
- [ ] Board outline and keepouts aligned to mechanical envelope (~100 × 70 mm target)

---

## 2) Schematic Rules

- [ ] CM5 core/control signals mapped and named consistently
- [ ] USB-C input and protection circuitry included
- [ ] charger/power-path controller included
- [ ] battery connector polarity and protection validated
- [ ] 5V and 3.3V regulation paths documented with expected load margins
- [ ] SPI/I²C/UART/GPIO headers clearly labeled
- [ ] debug header and reset/recovery controls included
- [ ] status LEDs (power/boot/activity/fault) included
- [ ] mandatory test points represented in schematic

ERC Gate:

- [ ] no unreviewed ERC errors
- [ ] warnings reviewed and dispositioned

---

## 3) PCB Placement Constraints

- [ ] CM5 area placed with thermal and service access considered
- [ ] high-speed interfaces placed to minimize path length
- [ ] switching power components grouped to minimize loop area
- [ ] USB/peripheral connectors positioned for enclosure accessibility
- [ ] debug header placed near board edge for bench access
- [ ] test points placed for easy probing (not under modules)

---

## 4) High-Speed Routing Constraints

### PCIe (SDR Path)

- [ ] differential pair impedance target set to 85Ω differential
- [ ] pair length matching rule enabled
- [ ] via count minimized on PCIe pairs
- [ ] stubs minimized / avoided
- [ ] pair spacing and coupling rule applied consistently
- [ ] routing kept away from noisy switching nodes

### USB Paths

- [ ] USB differential pair rules applied
- [ ] routing symmetry maintained where practical
- [ ] connector escape routing reviewed for impedance continuity

---

## 5) Power Integrity Constraints

- [ ] 5V rail width/vias sized for 3.0-5.0A planning range
- [ ] 3.3V rail width/vias sized for 1.0-1.5A planning range
- [ ] at least 25% current headroom accounted for in design assumptions
- [ ] decoupling capacitor placement close to critical loads
- [ ] high di/dt loops minimized in regulator sections
- [ ] ground return continuity maintained
- [ ] sensitive and noisy return paths separated where needed

---

## 6) Low-Speed Bus Constraints

### SPI

- [ ] SPI traces kept short/clean for target speed
- [ ] CS lines clearly separated and labeled

### I²C

- [ ] SDA/SCL trace lengths moderate and routed together
- [ ] pull-up strategy defined and documented

### UART

- [ ] UART traces isolated from high-noise switching regions
- [ ] 3.3V TTL level expectation labeled on silkscreen/header notes

### GPIO

- [ ] control lines grouped logically and labeled for expansion use

---

## 7) RF / Noise Awareness

- [ ] ground continuity preserved near RF-related paths/interfaces
- [ ] no critical high-speed routes crossing split return paths
- [ ] shielding/mechanical keepout zones defined where needed

---

## 8) Testability and Serviceability

- [ ] labeled test points for `5V`, `3.3V`, `GND`, and critical control nets
- [ ] reset and recovery controls accessible without disassembly
- [ ] silkscreen labels present for all external connectors
- [ ] connector orientation checked for assembly/service access

---

## 9) DRC / Review Gates

Pre-fab gate checklist:

- [ ] DRC clean or only accepted, documented exceptions
- [ ] net-class constraints verified against routed results
- [ ] critical net review completed (PCIe, USB, power)
- [ ] design review sign-off recorded
- [ ] fabrication outputs generated (Gerber, drill, BOM, PnP)

---

## 10) Sign-Off Record

| Reviewer | Area               | Date | Status  | Notes |
| -------- | ------------------ | ---- | ------- | ----- |
| OPEN     | Schematic/ERC      | OPEN | Pending |       |
| OPEN     | Layout/DRC         | OPEN | Pending |       |
| OPEN     | Power Integrity    | OPEN | Pending |       |
| OPEN     | High-Speed Routing | OPEN | Pending |       |
| OPEN     | Manufacturability  | OPEN | Pending |       |

---

## Notes

- This checklist is for no-hardware design readiness and pre-fabrication confidence.
- Final sign-off still requires physical bring-up and validation per [../../docs/02_HARDWARE/HARDWARE_CHECKLIST.md](../../docs/02_HARDWARE/HARDWARE_CHECKLIST.md).
