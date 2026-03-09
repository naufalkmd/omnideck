# Simulation Runbook

## Purpose

A practical execution runbook for no-hardware validation.

Use this runbook weekly to produce repeatable evidence and keep the project moving before procurement.

---

## Prerequisites

- macOS development machine
- KiCad installed
- Python 3.11+
- GNU Radio and Wireshark installed (optional but recommended)

---

## Weekly Execution Cycle

## Step 1 — Design Checks (KiCad)

- run schematic ERC
- run PCB DRC
- export reports to `docs/artifacts/` (create folder as needed)

Pass condition:

- no unresolved blocking violations

---

## Step 2 — Power Simulation

- run regulator startup/load-step simulations in LTspice/ngspice
- export waveform screenshots and notes

Pass condition:

- rails stable within planned tolerance under modeled load conditions

---

## Step 3 — Software Pipeline Dry-Run

- execute automation scripts in `software/scripts/`
- run parser/report pipeline on sample data

Pass condition:

- scripts complete without errors and produce expected output artifacts

---

## Step 4 — Analysis Workflow Rehearsal

- validate GNU Radio flowgraphs using recorded IQ files
- validate Wireshark filters and report exports using sample PCAP

Pass condition:

- expected decoded artifacts/reports are generated consistently

---

## Step 5 — Risk and Tracker Update

- update BOM risk and lead-time fields
- update no-hardware execution tracker status
- log blockers and assumptions

Pass condition:

- tracker updated with date, owner, and next action for each open item

---

## Deliverables Per Run

- ERC/DRC reports
- simulation evidence (plots/screenshots)
- software dry-run logs
- analysis output samples
- updated tracker status

---

## Known Boundaries

This runbook cannot replace physical validation for:

- RF performance sign-off
- live peripheral interoperability
- thermal soak validation
- battery runtime verification

Use this runbook to reduce discovery risk before buying hardware.
