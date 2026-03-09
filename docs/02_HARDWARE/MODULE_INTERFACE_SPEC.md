# Module Interface Specification

## Overview

This document defines the electrical and logical interfaces between the core system
(Raspberry Pi Compute Module 5) and all hardware modules used in the Cyberdeck
Research Workstation.

The goal of this specification is to ensure:

- consistent hardware integration
- modular subsystem design
- easy debugging and expansion
- compatibility with future upgrades

---

# System Bus Architecture

The cyberdeck uses multiple communication buses depending on module requirements.

```
CM5 Compute Module
│
├── PCIe Bus
│   └── HackRF SDR
│
├── USB Bus
│   ├── Onboard Wi-Fi/Bluetooth Module Interface
│   ├── Onboard Logic Capture Subsystem
│   └── External Maintenance USB Port
│
├── SPI Bus
│   └── Proxmark3 Interface
│
├── I²C Bus
│   ├── Onboard GPS Receiver
│   └── System Sensors
│
├── UART
│   └── Embedded Debug Interface
│
├── GPIO
│   ├── Onboard IR Interface
│   └── Control Signals
│
└── Power Rail
    └── Battery UPS System
```

---

# Interface Specifications

## 1. HackRF SDR Interface

### Bus Type

PCIe Gen3 x1

### Connection

| Signal   | Description           |
| -------- | --------------------- |
| PCIe_TX+ | Differential transmit |
| PCIe_TX- | Differential transmit |
| PCIe_RX+ | Differential receive  |
| PCIe_RX- | Differential receive  |
| REFCLK   | Reference clock       |
| PERST    | Reset line            |

### Design Considerations

- differential pair routing
- 85Ω differential impedance
- trace length matching
- minimal signal stubs

---

## 2. Proxmark3 RFID/NFC Interface

### Bus Type

SPI

### Connection

| Signal | Description         |
| ------ | ------------------- |
| MOSI   | Master Out Slave In |
| MISO   | Master In Slave Out |
| SCLK   | Clock               |
| CS     | Chip Select         |
| GND    | Ground              |
| 3.3V   | Power               |

### Notes

SPI is used for high-speed communication with RFID hardware.

---

## 3. Onboard Wi-Fi/Bluetooth Interface

### Bus Type

M.2 E-Key (PCIe + USB) or onboard module interface

### Interface

```
CM5 Host Interface
│
▼
Onboard Wi-Fi/Bluetooth Module
```

### Requirements

- monitor mode support
- packet injection capability

---

## 4. Onboard Logic Capture Subsystem

### Bus Type

Internal USB/UART bridge to CM5

### Communication

Digital bus captures are processed via:

- logic decode tools
- custom capture scripts

---

## 5. External Maintenance USB Port

### Bus Type

USB

### Usage

- firmware flashing/recovery
- optional external tool attachment
- development diagnostics

---

## 6. UART Debug Interface

### Bus Type

Serial UART

### Connection

| Pin | Function |
| --- | -------- |
| TX  | transmit |
| RX  | receive  |
| GND | ground   |

### Voltage Levels

```
3.3V TTL
```

Used for:

- firmware console access
- embedded debugging

---

## 7. SPI Debug Interface

### Bus Type

SPI

### Usage

SPI debugging allows inspection of:

- flash memory chips
- sensors
- embedded controllers

---

## 8. I²C Debug Interface

### Bus Type

I²C

### Connection

| Signal | Description |
| ------ | ----------- |
| SDA    | data        |
| SCL    | clock       |
| 3.3V   | power       |
| GND    | ground      |

Used for low-speed peripheral devices.

---

## 9. Onboard IR Interface

### Bus Type

GPIO

### Connection

| Signal | Description       |
| ------ | ----------------- |
| IR_TX  | infrared transmit |
| IR_RX  | infrared receive  |
| GND    | ground            |
| 3.3V   | power             |

---

## 10. Onboard GPS Receiver Interface

### Bus Type

I²C or UART

### Connection

| Signal | Description         |
| ------ | ------------------- |
| TX     | GPS data output     |
| RX     | configuration input |
| GND    | ground              |
| 3.3V   | power               |

---

## 11. Onboard HID/Automation Coprocessor

### Bus Type

Internal USB/UART interface + GPIO signaling

### Capabilities

- keyboard emulation
- USB protocol testing
- hardware automation

---

## 12. Optional External Logic Analyzer (Development)

### Bus Type

USB

### Role

External high-fidelity logic analyzers can still be attached during development and debug-heavy bring-up phases.

---

# Power Interface

## Battery UPS System

### Power Flow

```
USB-C Input
│
▼
Battery Charger IC
│
▼
18650 Battery Pack
│
▼
5V Boost Converter
│
▼
System Power Rail
```

### Voltage Rails

| Rail | Usage                   |
| ---- | ----------------------- |
| 5V   | main system power       |
| 3.3V | logic circuits          |
| 1.8V | internal CM5 components |

---

# Signal Integrity Considerations

High-speed signals require careful routing.

Key guidelines:

- isolate RF traces
- separate analog and digital grounds
- minimize loop areas
- avoid sharp trace bends

---

# Expansion Capability

Future modules can be added via:

- USB
- SPI
- I²C
- GPIO

Potential upgrades:

- LoRa radio
- FPGA accelerator
- AI inference module
- environmental sensors

---

# Revision History

| Version | Description                            |
| ------- | -------------------------------------- |
| v1.0    | Initial module interface specification |
