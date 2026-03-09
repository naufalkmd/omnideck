# Security Research Capabilities

## Overview

The Cyberdeck Research Workstation integrates multiple hardware modules and software tools to support a wide range of cybersecurity and hardware research activities.

This document maps **research capabilities** to the **hardware and software components** used to perform them.

---

# Capability Domains

The system supports the following research domains:

- RF research
- wireless network analysis
- RFID / NFC security
- IoT / embedded debugging
- hardware reverse engineering
- USB device testing
- infrared protocol analysis
- geolocation research

---

# Capability Matrix

| Capability                  | Hardware                                     | Software           |
| --------------------------- | -------------------------------------------- | ------------------ |
| RF spectrum analysis        | HackRF SDR                                   | GNU Radio          |
| RF protocol decoding        | HackRF SDR                                   | GNU Radio / Python |
| RF signal replay            | HackRF SDR                                   | SDR tools          |
| Wi-Fi packet capture        | Onboard Wi-Fi/Bluetooth module               | Wireshark          |
| Wireless network analysis   | Onboard Wi-Fi/Bluetooth module               | Aircrack-ng        |
| Bluetooth protocol analysis | Onboard Wi-Fi/Bluetooth module               | Wireshark          |
| RFID tag reading            | Proxmark3                                    | Proxmark tools     |
| RFID tag cloning            | Proxmark3                                    | Proxmark tools     |
| NFC card emulation          | Proxmark3                                    | Proxmark tools     |
| Embedded UART debugging     | UART interface                               | minicom / screen   |
| SPI bus inspection          | SPI debug interface                          | bus analysis tools |
| I²C bus inspection          | I²C debug interface                          | bus analysis tools |
| Digital signal debugging    | Onboard logic capture subsystem              | logic decode tools |
| IR remote capture           | Onboard IR front-end                         | IR tools           |
| IR signal replay            | Onboard IR front-end                         | custom scripts     |
| GPS signal logging          | Onboard GPS receiver                         | GPSD               |
| Wardriving                  | Onboard GPS + onboard Wi-Fi/Bluetooth module | Kismet             |
| USB HID emulation           | Onboard HID/automation coprocessor           | firmware tools     |

---

# RF Research Capabilities

Hardware:

- HackRF SDR

Capabilities:

- radio spectrum monitoring
- signal demodulation
- wireless protocol reverse engineering
- remote control signal analysis
- satellite signal monitoring

Frequency range:

```
~1 MHz – 6 GHz
```

---

# Wireless Security

Hardware:

- onboard Wi-Fi/Bluetooth module

Capabilities:

- wireless packet capture
- network traffic inspection
- IoT wireless debugging
- wireless security research

---

# RFID / NFC Research

Hardware:

- Proxmark3

Capabilities:

- RFID card reading
- NFC protocol analysis
- card emulation
- security testing for access systems

---

# Hardware Debugging

Hardware tools:

- onboard logic capture subsystem
- UART interface
- SPI interface
- I²C interface

Capabilities:

- embedded system debugging
- firmware communication analysis
- hardware protocol inspection
- IoT device reverse engineering

---

# Peripheral Interaction

## Infrared

Hardware:

- onboard IR transmitter / receiver front-end

Capabilities:

- IR protocol capture
- remote control analysis
- signal replay

---

## USB

Hardware:

- onboard HID/automation coprocessor

Capabilities:

- USB device testing
- keyboard emulation
- USB protocol experimentation

---

## GPS

Hardware:

- onboard GPS receiver

Capabilities:

- signal mapping
- location tracking
- wardriving support

---

# Software Toolchain

Operating system:

```
Linux (Kali / Ubuntu)
```

Primary software tools:

| Tool           | Purpose                    |
| -------------- | -------------------------- |
| GNU Radio      | SDR signal processing      |
| Wireshark      | packet analysis            |
| Aircrack-ng    | wireless security testing  |
| Proxmark tools | RFID / NFC interaction     |
| Ghidra         | binary reverse engineering |
| Python         | automation and scripting   |

---

# System Capability Coverage

| Security Domain           | Coverage |
| ------------------------- | -------- |
| RF research               | Yes      |
| Wireless security         | Yes      |
| RFID / NFC                | Yes      |
| Hardware debugging        | Yes      |
| IoT security              | Yes      |
| Embedded system analysis  | Yes      |
| Infrared protocol testing | Yes      |
| Geolocation research      | Yes      |

---

# Limitations

Certain advanced hardware security techniques require specialized laboratory equipment.

Examples:

- chip decapping
- electron microscopy
- advanced side-channel analysis
- high-frequency RF research (>6 GHz)

These capabilities are outside the scope of portable systems.

---

# Summary

The Cyberdeck Research Workstation integrates multiple research tools into a **single portable platform** capable of performing most real-world security analysis tasks.

The system serves as a **portable cybersecurity laboratory** designed for:

- security researchers
- hardware engineers
- RF engineers
- IoT developers
