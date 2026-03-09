# Procurement Tracker

## Purpose

Track ordering status and supply-chain risk for all BOM items.

This tracker follows the motherboard-first baseline and excludes standalone components that were replaced by onboard subsystems.

---

## Tracker Table

| Item ID | Part                              | Preferred Source | Alternate Source | Qty   | Budget (USD) | Order Status | ETA  | Received | Tested | Risk   | Notes |
| ------- | --------------------------------- | ---------------- | ---------------- | ----- | ------------ | ------------ | ---- | -------- | ------ | ------ | ----- |
| BOM-001 | CM5 module                        | OPEN             | OPEN             | 1     | OPEN         | Planned      | OPEN | No       | No     | Medium |       |
| BOM-002 | NVMe SSD                          | OPEN             | OPEN             | 1     | OPEN         | Planned      | OPEN | No       | No     | Low    |       |
| BOM-003 | HackRF One                        | OPEN             | OPEN             | 1     | OPEN         | Planned      | OPEN | No       | No     | High   |       |
| BOM-004 | Proxmark3                         | OPEN             | OPEN             | 1     | OPEN         | Planned      | OPEN | No       | No     | High   |       |
| BOM-005 | Onboard Wi-Fi/Bluetooth module    | OPEN             | OPEN             | 1     | OPEN         | Planned      | OPEN | No       | No     | Medium |       |
| BOM-006 | Onboard logic capture subsystem   | OPEN             | OPEN             | 1     | OPEN         | Planned      | OPEN | No       | No     | Medium |       |
| BOM-007 | Onboard USB-UART bridge IC        | OPEN             | OPEN             | 1     | OPEN         | Planned      | OPEN | No       | No     | Low    |       |
| BOM-008 | Onboard IR front-end              | OPEN             | OPEN             | 1 set | OPEN         | Planned      | OPEN | No       | No     | Low    |       |
| BOM-009 | Onboard GPS receiver module       | OPEN             | OPEN             | 1     | OPEN         | Planned      | OPEN | No       | No     | Low    |       |
| BOM-010 | HID/automation coprocessor        | OPEN             | OPEN             | 1     | OPEN         | Planned      | OPEN | No       | No     | Low    |       |
| BOM-011 | 4-layer PCB prototype fabrication | OPEN             | OPEN             | 1 lot | OPEN         | Planned      | OPEN | No       | No     | Medium |       |
| BOM-012 | Assembly components lot           | OPEN             | OPEN             | 1 lot | OPEN         | Planned      | OPEN | No       | No     | Medium |       |
| BOM-013 | Charger IC/module                 | OPEN             | OPEN             | 1     | OPEN         | Planned      | OPEN | No       | No     | Medium |       |
| BOM-014 | 18650 cells                       | OPEN             | OPEN             | 2-4   | OPEN         | Planned      | OPEN | No       | No     | Medium |       |
| BOM-015 | 5V boost converter                | OPEN             | OPEN             | 1     | OPEN         | Planned      | OPEN | No       | No     | Medium |       |
| BOM-016 | Enclosure materials               | OPEN             | OPEN             | 1 set | OPEN         | Planned      | OPEN | No       | No     | Medium |       |

---

## Status Definitions

- Planned: identified, not ordered
- Ordered: order submitted
- Partial: partially received
- Received: fully received
- Tested: validated for use
- Blocked: unavailable/backorder/quality issue

---

## Risk Scoring Guide

- High: long lead time or single-source dependency
- Medium: moderate lead time or uncertain stock
- Low: widely available with alternatives
