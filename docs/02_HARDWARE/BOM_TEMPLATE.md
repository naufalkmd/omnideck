# Bill of Materials (BOM) Template

## Overview

Use this template to track all major components, sourcing, and assembly status for the Cyberdeck Research Workstation.

This v1 draft includes candidate parts and estimated pricing for planning. Verify exact SKUs, stock, and compatibility before procurement.

Current baseline: components that are practical to integrate are represented as **onboard motherboard subsystems** rather than external adapters/dongles.

---

## Removed External Components (Motherboard-First Decision)

The following standalone components are intentionally removed from the baseline BOM and replaced by onboard motherboard subsystems:

- external Wi-Fi adapter -> replaced by onboard Wi-Fi/Bluetooth module
- external Bluetooth sniffer dongle -> replaced by onboard Wi-Fi/Bluetooth module workflow
- external USB-UART adapter -> replaced by onboard USB-UART bridge IC
- external IR transceiver module -> replaced by onboard IR front-end
- external GPS breakout module -> replaced by onboard GPS receiver module
- external HID dev board -> replaced by onboard HID/automation coprocessor

Notes:

- `HackRF` and `Proxmark3` remain external/modular in v1 due to integration complexity and flexibility requirements.
- external high-end logic analyzers remain optional development tools, not baseline BOM dependencies.

---

## BOM Table

| Item ID | Subsystem   | Part Name                                            | Manufacturer              | Manufacturer Part Number         | Qty   | Unit Cost (USD) | Supplier                                     | Supplier SKU/Link                                      | Lead Time | Lifecycle Status | Alternate Part                      | Notes                                    |
| ------- | ----------- | ---------------------------------------------------- | ------------------------- | -------------------------------- | ----- | --------------- | -------------------------------------------- | ------------------------------------------------------ | --------- | ---------------- | ----------------------------------- | ---------------------------------------- |
| BOM-001 | Compute     | Raspberry Pi Compute Module 5 (8GB)                  | Raspberry Pi              | CM5 8GB variant (exact SKU OPEN) | 1     | 95.00           | Raspberry Pi Approved Reseller               | https://www.raspberrypi.com/products/compute-module-5/ | 1-3 weeks | Active           | CM5 16GB variant                    | Core compute module                      |
| BOM-002 | Storage     | NVMe SSD 500GB                                       | Samsung                   | MZ-V7S500 (970 EVO Plus)         | 1     | 55.00           | Amazon / Newegg                              | Samsung 970 EVO Plus 500GB                             | In stock  | Active           | WD Blue SN580 500GB                 | OS and research datasets                 |
| BOM-003 | RF          | HackRF One SDR                                       | Great Scott Gadgets       | HackRF One (H2 revision)         | 1     | 299.00          | Great Scott Gadgets / Authorized Distributor | https://greatscottgadgets.com/hackrf/one/              | 2-6 weeks | Active           | RTL-SDR Blog V4 (limited range)     | RF analysis module                       |
| BOM-004 | RFID/NFC    | Proxmark3 RDV4                                       | RRG / Proxmark ecosystem  | PM3 RDV4                         | 1     | 220.00          | RRG Store / Lab401                           | Proxmark3 RDV4                                         | 2-4 weeks | Active           | Proxmark3 Easy (reduced capability) | RFID/NFC testing                         |
| BOM-005 | Wireless    | Onboard Wi-Fi/Bluetooth Module                       | Quectel / Murata class    | M.2 E-Key module (OPEN)          | 1     | 25.00           | Digi-Key / Mouser                            | OPEN                                                   | 2-6 weeks | Active           | USB Wi-Fi + BT dongles              | Supports monitor mode + BT workflows     |
| BOM-006 | Debug       | Onboard Logic Capture Subsystem                      | RP2040/FX2-class design   | OPEN                             | 1     | 25.00           | Digi-Key / Mouser                            | OPEN                                                   | 2-8 weeks | Active           | External logic analyzer             | Integrated debug capture baseline        |
| BOM-007 | Debug       | Onboard USB-UART Bridge IC                           | Silicon Labs / FTDI       | CP2102N/FT232-class              | 1     | 4.00            | Digi-Key / Mouser                            | OPEN                                                   | 1-4 weeks | Active           | External USB-UART adapter           | Embedded console/debug access            |
| BOM-008 | Peripherals | Onboard IR Front-End                                 | Vishay class              | IR RX + TX stage (OPEN)          | 1 set | 4.00            | Digi-Key / Mouser                            | OPEN                                                   | 1-3 weeks | Active           | External IR module                  | IR capture/replay on-board               |
| BOM-009 | Peripherals | Onboard GPS Receiver Module                          | u-blox class              | M8-class module (OPEN)           | 1     | 12.00           | Digi-Key / Mouser                            | OPEN                                                   | 1-4 weeks | Active           | External GPS breakout               | Geolocation and wardriving support       |
| BOM-010 | USB         | HID/Automation Coprocessor                           | Raspberry Pi / MCU vendor | RP2040-class MCU                 | 1     | 6.00            | Raspberry Pi resellers / Digi-Key            | OPEN                                                   | 1-3 weeks | Active           | External HID dev board              | USB emulation + automation logic         |
| BOM-011 | Motherboard | 4-Layer PCB Prototype Fabrication                    | PCB fab vendor            | 4-layer proto lot                | 1 lot | 120.00          | JLCPCB / PCBWay / equivalent                 | OPEN                                                   | 1-3 weeks | Active           | Alternate fab house                 | Initial motherboard prototype run        |
| BOM-012 | Motherboard | Assembly Components (connectors/passives/protection) | Multi-vendor              | OPEN                             | 1 lot | 120.00          | Digi-Key / Mouser                            | OPEN                                                   | 1-4 weeks | Active           | Equivalent footprints               | Integration overhead for on-board design |
| BOM-013 | Power       | Battery Charger / Power Path IC                      | Texas Instruments         | BQ25895                          | 1     | 6.50            | Digi-Key / Mouser                            | BQ25895RTWR                                            | 2-8 weeks | Active           | IP5306 module-based design          | UPS power path                           |
| BOM-014 | Power       | 18650 Cells (3500mAh)                                | Samsung SDI               | INR18650-35E                     | 2-4   | 7.50            | Battery specialist supplier                  | INR18650-35E                                           | 1-3 weeks | Active           | LG MJ1 18650                        | Runtime target 6-10h                     |
| BOM-015 | Power       | 5V Boost Converter                                   | Pololu                    | U3V70F5                          | 1     | 25.00           | Pololu                                       | U3V70F5                                                | In stock  | Active           | TPS61088-based module               | Main rail regulation                     |
| BOM-016 | Mechanical  | Enclosure + Hardware Kit                             | Custom / COTS mix         | PETG/Aluminum + M3 kit           | 1 set | 80.00           | Local fab + fastener supplier                | Custom CAD + M3 standoffs/screws                       | 1-2 weeks | Active           | ABS enclosure variant               | Chassis and mounting                     |

---

## Build Cost Summary

| Category                           | Estimated Cost (USD) |
| ---------------------------------- | -------------------- |
| Compute                            | 150                  |
| RF / Wireless                      | 544                  |
| Debug Interfaces                   | 29                   |
| Motherboard Fabrication/Assembly   | 240                  |
| Power System                       | 62                   |
| Mechanical / Enclosure             | 80                   |
| Misc (cables/connectors/fasteners) | 60                   |
| **Total**                          | **1165**             |

---

## Procurement Status

| Status     | Meaning                         |
| ---------- | ------------------------------- |
| Planned    | Part identified but not ordered |
| Ordered    | PO or order placed              |
| Received   | In-hand and inspected           |
| Tested     | Functionally validated          |
| Integrated | Installed in prototype          |
| Blocked    | Waiting on supply/revision      |

---

## Usage Notes

- Keep one row per unique part number.
- Use `Alternate Part` for approved substitutions.
- Mark high-risk parts (long lead time, EOL risk) early.
- Update BOM during each roadmap phase to keep estimates accurate.
- Treat unit costs as planning estimates that vary by region, stock, and shipping.
