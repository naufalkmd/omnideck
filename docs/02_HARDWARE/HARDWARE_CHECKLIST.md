# Hardware Bring-Up Checklist

## Overview

This checklist provides a practical sequence for validating the Cyberdeck hardware platform from first power-on through interface verification.

---

## Phase 0 — Pre-Power Checks

- [ ] Review latest schematic and PCB revision IDs
- [ ] Verify assembly against placement/connector map
- [ ] Inspect board for shorts, solder bridges, damaged pads
- [ ] Confirm polarity-sensitive parts (diodes, caps, batteries)
- [ ] Confirm all standoffs/heatsinks/mechanical mounts are secure

---

## Phase 1 — Power Validation

- [ ] Verify USB-C input voltage/current capability
- [ ] Measure charger output and battery charge behavior
- [ ] Validate 5V rail under no-load and nominal-load
- [ ] Validate 3.3V rail ripple/noise within tolerance
- [ ] Confirm safe thermal behavior during 15-minute idle run

Acceptance targets:

- [ ] No rail outside expected tolerance
- [ ] No abnormal heating or power cycling

---

## Phase 2 — CM5 Boot and Base OS

- [ ] CM5 boots reliably from intended storage
- [ ] Linux image installed and updated
- [ ] SSH access and local terminal verified
- [ ] System logs checked for hardware/driver errors
- [ ] Baseline snapshot recorded (kernel version, modules, temps)

---

## Phase 3 — Interface Bring-Up

### PCIe / SDR

- [ ] HackRF detected by system
- [ ] Basic RF capture test completed
- [ ] Sustained operation test (10+ min) with no disconnect

### USB Peripherals

- [ ] Wi-Fi adapter detected, monitor mode enabled
- [ ] Packet injection capability confirmed
- [ ] Bluetooth sniffer detected and packet stream validated
- [ ] Logic analyzer recognized and protocol decode functional

### SPI / I²C / UART / GPIO

- [ ] Proxmark3 communication over intended interface verified
- [ ] UART TX/RX loopback and target console test passed
- [ ] SPI device read/write test passed
- [ ] I²C bus scan and peripheral reads passed
- [ ] IR TX/RX basic signal capture/replay passed
- [ ] GPS data stream valid (NMEA or configured format)

---

## Phase 4 — Thermal and Stability

- [ ] 30-minute mixed workload run completed
- [ ] CPU/module temperatures logged and reviewed
- [ ] No brownouts, random resets, or USB dropouts observed
- [ ] Enclosure airflow path validated under load

---

## Phase 5 — Field Readiness

- [ ] Battery runtime measured against target (6–10h)
- [ ] Cold boot and resume tests completed
- [ ] Cables/probes packed and labeled
- [ ] Recovery media/config backup prepared
- [ ] Safety and legal usage guidelines reviewed

---

## Issue Log Template

| ID     | Area  | Symptom | Root Cause | Fix  | Status |
| ------ | ----- | ------- | ---------- | ---- | ------ |
| HW-001 | Power | OPEN    | OPEN       | OPEN | Open   |

---

## Sign-Off

| Role                   | Name | Date | Status  |
| ---------------------- | ---- | ---- | ------- |
| Hardware Lead          | OPEN | OPEN | Pending |
| Firmware/Software Lead | OPEN | OPEN | Pending |
| Integration Reviewer   | OPEN | OPEN | Pending |
