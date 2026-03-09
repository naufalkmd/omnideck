# Hardware Design

## Overview

The hardware design integrates multiple research tools into a single cyberdeck platform powered by the **Raspberry Pi Compute Module 5**.

The current baseline is **motherboard-first integration**: components that are practical to embed are moved on-board, while complex high-value tools remain modular.

The system includes:

- RF research hardware
- hardware debugging tools
- wireless network analysis modules
- portable power system

---

## Board Architecture

```
CM5 Carrier Board
│
├── PCIe Interface
│   └── HackRF SDR
│
├── USB Hub
│   ├── Internal Wi-Fi/Bluetooth Module Interface
│   ├── Maintenance USB Port
│   └── Optional External Tool Port
│
├── SPI / I²C Bus
│   ├── Proxmark3 / RFID Interface
│   └── Onboard GPS / Sensor Interfaces
│
├── GPIO
│   ├── UART Debug
│   ├── Onboard IR Front-End
│   └── HID/Control Coprocessor Signals

├── Debug Subsystem
│   └── Onboard Logic Capture + USB-UART Bridge
│
└── Power Management
    └── Battery UPS
```

---

## PCB Specifications

| Parameter         | Value               |
| ----------------- | ------------------- |
| Board size        | 100 × 70 mm         |
| Layers            | 4-layer PCB         |
| Power input       | USB-C PD            |
| Battery           | 18650 lithium cells |
| Estimated runtime | 6–10 hours          |

---

## PCB Layer Stack

```
Layer 1 : Signal
Layer 2 : Ground Plane
Layer 3 : Power Plane
Layer 4 : Signal
```

---

## RF Design Considerations

RF systems are sensitive to interference.

Key precautions:

- impedance-controlled traces
- ground isolation
- short RF signal paths
- shielding where necessary

PCIe routing for SDR modules requires:

- differential pair matching
- controlled impedance
- minimal trace length mismatch

---

## Power System

Power management uses a **UPS battery system**.

```
USB-C Input
│
▼
Battery Charger
│
▼
18650 Battery Pack
│
▼
5V Power Rail
│
▼
System Components
```

---

## Thermal Considerations

High-performance modules may generate heat.

Special focus areas in motherboard-first design:

- onboard wireless module thermal zone
- power-stage thermal density near charger/boost circuits
- coprocessor and debug subsystem heat concentration

Cooling methods:

- passive heatsinks
- airflow channels
- aluminum enclosure heat dissipation
