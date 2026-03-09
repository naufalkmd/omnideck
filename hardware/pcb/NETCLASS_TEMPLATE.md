# Netclass Template (Motherboard v1)

## Purpose

This template provides practical default netclass values for initial KiCad setup on the Cyberdeck motherboard v1.

These are **starter values** for bring-up-focused design and must be tuned to your PCB stack-up, board house capabilities, and impedance targets.

Reference:

- [KICAD_CONSTRAINTS_CHECKLIST.md](KICAD_CONSTRAINTS_CHECKLIST.md)
- [../../docs/02_HARDWARE/MOTHERBOARD_V1_SPEC.md](../../docs/02_HARDWARE/MOTHERBOARD_V1_SPEC.md)

---

## Important Notes

- Verify all values with your manufacturer’s minimum rules.
- Differential impedance targets depend on stack-up and dielectric properties.
- Keep this file as the source of truth before entering constraints in KiCad.

---

## 1) Global Board Defaults (Starter)

| Setting             | Starter Value | Notes                                            |
| ------------------- | ------------- | ------------------------------------------------ |
| Minimum trace width | 0.15 mm       | Raise if fab house requires larger minimum       |
| Minimum clearance   | 0.15 mm       | Use stricter values for high-voltage/noisy zones |
| Via drill           | 0.30 mm       | Typical low-cost 4-layer capability              |
| Via diameter        | 0.60 mm       | Tune for current/escape constraints              |

---

## 2) Netclass Table (Starter Values)

| Netclass      | Trace Width    | Clearance | Via Drill / Via Dia | Notes                                      |
| ------------- | -------------- | --------- | ------------------- | ------------------------------------------ |
| DEFAULT       | 0.20 mm        | 0.20 mm   | 0.30 / 0.60 mm      | General signals                            |
| POWER_5V_MAIN | 1.20 mm        | 0.30 mm   | 0.40 / 0.80 mm      | Main 5V distribution path                  |
| POWER_3V3     | 0.60 mm        | 0.25 mm   | 0.30 / 0.60 mm      | 3.3V peripheral rail                       |
| USB_HS        | 0.20 mm        | 0.20 mm   | 0.30 / 0.60 mm      | Non-diff support nets                      |
| USB_HS_DIFF   | stack-up tuned | 0.20 mm   | 0.30 / 0.60 mm      | D+/D- pair, impedance-controlled           |
| PCIE_CTRL     | 0.20 mm        | 0.20 mm   | 0.30 / 0.60 mm      | PERST/REFCLK-related control as applicable |
| PCIE_DIFF     | stack-up tuned | 0.20 mm   | 0.30 / 0.60 mm      | 85Ω diff target                            |
| SPI_BUS       | 0.20 mm        | 0.20 mm   | 0.30 / 0.60 mm      | MOSI/MISO/SCLK/CS                          |
| I2C_BUS       | 0.20 mm        | 0.20 mm   | 0.30 / 0.60 mm      | SDA/SCL with pull-up strategy              |
| UART_DBG      | 0.20 mm        | 0.20 mm   | 0.30 / 0.60 mm      | TX/RX debug lines                          |
| GPIO_CTRL     | 0.20 mm        | 0.20 mm   | 0.30 / 0.60 mm      | Misc control and status nets               |

---

## 3) Differential Pair Constraints

## PCIe (Gen3 x1 Path)

| Parameter                     | Starter Constraint               |
| ----------------------------- | -------------------------------- |
| Differential impedance target | 85Ω                              |
| Intra-pair length mismatch    | ≤ 0.25 mm (starter)              |
| Inter-pair mismatch           | ≤ 1.00 mm (starter)              |
| Max vias per lane line        | minimize; target ≤ 2 transitions |

## USB High-Speed Pairs

| Parameter                     | Starter Constraint                   |
| ----------------------------- | ------------------------------------ |
| Differential impedance target | 90Ω                                  |
| Intra-pair length mismatch    | ≤ 0.50 mm (starter)                  |
| Pair coupling consistency     | keep spacing constant where possible |

Tuning guidance:

- final width/spacing must be calculated from real stack-up;
- use manufacturer impedance calculator or field-solver-backed values.

---

## 4) Power Distribution Rules

- assign wide traces/polygons for `POWER_5V_MAIN` and high-current branches
- prefer short, direct paths from regulator outputs to major loads
- use multiple vias when transitioning high-current rails between layers
- keep switching regulator loops compact with close decoupling
- maintain clean ground return near power and high-speed sections

---

## 5) Bus-Specific Practical Limits

## SPI

- keep `SCLK` length reasonable and avoid long stubs
- keep bus lines grouped and consistently referenced to ground

## I²C

- keep `SDA`/`SCL` routed together
- document pull-up resistor values and expected bus speed

## UART

- isolate from noisy switching zones and fast edge nets
- keep debug header routing straightforward and service-friendly

---

## 6) Net Naming Suggestions (KiCad)

Use consistent names to simplify class assignment and review:

- `5V_MAIN`, `3V3_PERIPH`, `GND`
- `PCIE_TX_P/N`, `PCIE_RX_P/N`, `PCIE_REFCLK_P/N`, `PCIE_PERST#`
- `USBx_DP`, `USBx_DM`
- `SPI_MOSI`, `SPI_MISO`, `SPI_SCLK`, `SPI_CSx`
- `I2C_SDA`, `I2C_SCL`
- `UART_DBG_TX`, `UART_DBG_RX`

---

## 7) Pre-Fab Constraint Review Checklist

- [ ] all critical nets assigned to correct netclass
- [ ] differential pair rules applied and active
- [ ] DRC run with no blocking violations
- [ ] high-current rails reviewed for width/via adequacy
- [ ] impedance assumptions documented with stack-up reference

---

## 8) Revision Log

| Version | Date       | Change                                             |
| ------- | ---------- | -------------------------------------------------- |
| v1.0    | 2026-03-09 | Initial netclass template with starter constraints |
