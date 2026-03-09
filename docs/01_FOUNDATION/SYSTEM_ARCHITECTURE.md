# System Architecture

## Overview

The Cyberdeck Research Workstation is a modular portable security research platform designed to integrate multiple cybersecurity, RF research, and hardware debugging tools into a single portable system.

The architecture follows a **modular layered design** that separates computation, hardware interfaces, and analysis tools.

---

## High-Level Architecture

```
Cyberdeck Platform
│
├── Compute Layer
│   └── CM5 Linux Computer
│
├── RF Layer
│   └── HackRF SDR
│
├── RFID / NFC Layer
│   └── Proxmark3
│
├── Wireless Networking Layer
│   └── Onboard Wi-Fi/Bluetooth Module
│
├── Hardware Debug Layer
│   ├── Onboard Logic Capture Subsystem
│   ├── UART Interface
│   ├── SPI Debug Interface
│   └── I²C Debug Interface
│
├── Peripheral Layer
│   ├── Onboard IR Interface
│   ├── Onboard GPS Receiver
│   └── Onboard HID/Automation MCU
│
└── Power Layer
    └── Battery UPS System
```

---

## Design Principles

### Modularity

Each subsystem can be replaced or upgraded independently.

### Portability

All hardware is integrated into a compact cyberdeck enclosure.

### Motherboard-First Integration

Where technically practical, peripheral functions are integrated directly on the motherboard to reduce external dongles/adapters and improve serviceability.

### Expandability

Future modules can be connected via:

- USB
- GPIO
- SPI / I²C buses

### Open Architecture

The system is designed to support open-source software and hardware tools.

---

## System Workflow

```
Hardware Signals
│
▼
Hardware Interfaces
│
▼
Linux Operating System
│
▼
Security Research Tools
│
▼
User Analysis
```

---

## Core Compute Platform

Recommended specifications:

| Component | Specification                 |
| --------- | ----------------------------- |
| CPU       | Raspberry Pi Compute Module 5 |
| RAM       | 8–16 GB                       |
| Storage   | NVMe SSD                      |
| OS        | Linux (Kali / Ubuntu)         |

The compute module coordinates all hardware subsystems and runs analysis software.

---

## Data Flow

```
Sensors / Interfaces
│
▼
Hardware Modules
│
▼
Linux Drivers
│
▼
Security Tools
│
▼
User Interface
```

---

## Security Research Domains Covered

| Domain             | Coverage |
| ------------------ | -------- |
| RF Research        | Yes      |
| Network Security   | Yes      |
| Wireless Security  | Yes      |
| Hardware Security  | Yes      |
| IoT Security       | Yes      |
| RFID / NFC         | Yes      |
| Embedded Debugging | Yes      |
