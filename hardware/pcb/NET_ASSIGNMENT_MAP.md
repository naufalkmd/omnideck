# Net Assignment Map (Motherboard v1)

## Purpose

This map assigns expected motherboard nets/signals to netclasses defined in [NETCLASS_TEMPLATE.md](NETCLASS_TEMPLATE.md).

Use this as the implementation reference when assigning classes in KiCad schematic and PCB editors.

---

## Assignment Rules

- Assign power rails and high-current branches first.
- Assign differential pairs before general routing.
- Keep naming consistent so class assignment can be rule-driven.
- If a signal is uncertain, assign to `DEFAULT` and flag for review.

---

## 1) Power Nets

| Net / Signal Pattern | Netclass                                   | Notes                             |
| -------------------- | ------------------------------------------ | --------------------------------- |
| `5V_MAIN`            | `POWER_5V_MAIN`                            | Primary 5V rail                   |
| `5V_USB_HUB`         | `POWER_5V_MAIN`                            | USB hub rail branch               |
| `5V_PERIPH*`         | `POWER_5V_MAIN`                            | Peripheral branch rails           |
| `3V3_PERIPH`         | `POWER_3V3`                                | Primary 3.3V rail                 |
| `3V3_*`              | `POWER_3V3`                                | 3.3V sub-rails                    |
| `VBAT*`              | `POWER_5V_MAIN` or dedicated battery class | Choose per final battery topology |
| `GND`                | `DEFAULT` (plane)                          | Ground handled via plane strategy |

---

## 2) PCIe Nets

| Net / Signal Pattern             | Netclass    | Notes                   |
| -------------------------------- | ----------- | ----------------------- |
| `PCIE_TX*_P`, `PCIE_TX*_N`       | `PCIE_DIFF` | Differential pair       |
| `PCIE_RX*_P`, `PCIE_RX*_N`       | `PCIE_DIFF` | Differential pair       |
| `PCIE_REFCLK_P`, `PCIE_REFCLK_N` | `PCIE_DIFF` | Differential clock pair |
| `PCIE_PERST#`                    | `PCIE_CTRL` | Reset/control           |
| `PCIE_CLKREQ#`, `PCIE_WAKE#`     | `PCIE_CTRL` | Optional control lines  |

---

## 3) USB Nets

| Net / Signal Pattern      | Netclass        | Notes                |
| ------------------------- | --------------- | -------------------- |
| `USB*_DP`, `USB*_DM`      | `USB_HS_DIFF`   | Differential pair    |
| `USB*_VBUS`               | `POWER_5V_MAIN` | 5V supply path       |
| `USB*_CC*`, `USB*_SBU*`   | `USB_HS`        | Control/aux lines    |
| `USB*_OC#`, `USB*_PWR_EN` | `USB_HS`        | Power control/status |

---

## 4) SPI / I²C / UART / GPIO Nets

| Net / Signal Pattern                          | Netclass                 | Notes                         |
| --------------------------------------------- | ------------------------ | ----------------------------- |
| `SPI_MOSI`, `SPI_MISO`, `SPI_SCLK`, `SPI_CS*` | `SPI_BUS`                | Proxmark/debug SPI bus        |
| `I2C_SDA`, `I2C_SCL`                          | `I2C_BUS`                | Shared I²C bus                |
| `UART_DBG_TX`, `UART_DBG_RX`                  | `UART_DBG`               | 3.3V TTL debug UART           |
| `GPIO_*`                                      | `GPIO_CTRL`              | General control signals       |
| `IR_TX`, `IR_RX`                              | `GPIO_CTRL`              | IR control lines              |
| `RESET*`, `BOOT*`, `STATUS_*`                 | `GPIO_CTRL` or `DEFAULT` | Choose by routing sensitivity |

---

## 5) Fallback Assignment

When uncertain:

- assign to `DEFAULT`
- add a schematic note: `REVIEW_NETCLASS`
- review during pre-fab netclass audit

---

## 6) KiCad Workflow

1. Define netclasses in board setup from [NETCLASS_TEMPLATE.md](NETCLASS_TEMPLATE.md).
2. Apply net labels in schematic using the naming patterns above.
3. Import/update PCB from schematic.
4. Assign/verify classes in PCB editor (`Inspect -> Net Inspector`).
5. Run DRC and review class mismatches.

---

## 7) Audit Checklist

- [ ] all PCIe differential nets in `PCIE_DIFF`
- [ ] all USB differential nets in `USB_HS_DIFF`
- [ ] all 5V branches in `POWER_5V_MAIN`
- [ ] all 3.3V branches in `POWER_3V3`
- [ ] all low-speed buses in their dedicated classes
- [ ] zero unreviewed `DEFAULT` assignments on critical nets

---

## 8) Revision Log

| Version | Date       | Change                                 |
| ------- | ---------- | -------------------------------------- |
| v1.0    | 2026-03-09 | Initial net-to-netclass assignment map |
