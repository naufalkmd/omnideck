# Pre-Fab Sign-Off Checklist (Motherboard v1)

## Purpose

This checklist is the formal pre-fabrication gate for Cyberdeck motherboard v1.

It converts the spec-level Gate B criteria into a reviewer-signable process before generating final manufacturing outputs.

Reference:

- [../../docs/02_HARDWARE/MOTHERBOARD_V1_SPEC.md](../../docs/02_HARDWARE/MOTHERBOARD_V1_SPEC.md)
- [KICAD_CONSTRAINTS_CHECKLIST.md](KICAD_CONSTRAINTS_CHECKLIST.md)
- [NETCLASS_TEMPLATE.md](NETCLASS_TEMPLATE.md)
- [NET_ASSIGNMENT_MAP.md](NET_ASSIGNMENT_MAP.md)

---

## Gate B Criteria (Must Pass)

- [ ] ERC/DRC clean or accepted exceptions documented
- [ ] high-speed and power reviews complete
- [ ] manufacturing package generated

No fabrication order should be placed until all three criteria are complete.

---

## A) Schematic/ERC Sign-Off

- [ ] schematic is frozen for v1 revision
- [ ] all critical interfaces match motherboard spec
- [ ] ERC report reviewed
- [ ] unresolved ERC errors: `0`
- [ ] warnings dispositioned and documented

Reviewer notes:

-

---

## B) PCB/DRC Sign-Off

- [ ] DRC run against final netclass/clearance rules
- [ ] unresolved DRC errors: `0`
- [ ] accepted DRC exceptions documented (if any)
- [ ] board outline/keepouts verified against mechanical envelope
- [ ] silkscreen labels verified for service/debug interfaces

Reviewer notes:

-

---

## C) High-Speed Review (PCIe/USB)

- [ ] PCIe differential pair constraints applied
- [ ] PCIe routing length/skew within target constraints
- [ ] USB differential routing reviewed for continuity and symmetry
- [ ] high-speed paths isolated from switching-noise hotspots
- [ ] via transitions on critical pairs minimized

Reviewer notes:

-

---

## D) Power Integrity Review

- [ ] 5V and 3.3V rails sized for planning loads with margin
- [ ] regulator input/output loops kept compact
- [ ] decoupling strategy reviewed on all critical loads
- [ ] return paths reviewed for continuity
- [ ] battery/power-path protection strategy verified

Reviewer notes:

-

---

## E) Testability / Bring-Up Readiness

- [ ] test points present for `5V`, `3.3V`, `GND`, and key control nets
- [ ] UART debug header accessible at board edge
- [ ] reset/recovery controls accessible without disassembly
- [ ] power/boot/fault indicators included
- [ ] bring-up checklist compatibility confirmed

Reference: [../../docs/02_HARDWARE/HARDWARE_CHECKLIST.md](../../docs/02_HARDWARE/HARDWARE_CHECKLIST.md)

---

## F) Manufacturing Package Verification

- [ ] final schematic PDF exported
- [ ] Gerber files generated and sanity-checked
- [ ] NC drill files generated
- [ ] BOM exported and reviewed
- [ ] pick-and-place (if assembly used) exported
- [ ] assembly notes generated (polarity/orientation critical parts)
- [ ] fabrication archive packaged with revision tag

Output archive path:

- `hardware/pcb/releases/<revision>/`

---

## G) Accepted Exceptions Log

Document any intentionally accepted issues before fab:

| ID       | Area | Description | Justification | Owner | Resolution Plan |
| -------- | ---- | ----------- | ------------- | ----- | --------------- |
| OPEN-001 | OPEN | OPEN        | OPEN          | OPEN  | OPEN            |

---

## H) Sign-Off Record

| Role                     | Name | Date | Status  | Notes |
| ------------------------ | ---- | ---- | ------- | ----- |
| Hardware Lead            | OPEN | OPEN | Pending |       |
| PCB Layout Reviewer      | OPEN | OPEN | Pending |       |
| Power Integrity Reviewer | OPEN | OPEN | Pending |       |
| High-Speed Reviewer      | OPEN | OPEN | Pending |       |
| Integration Reviewer     | OPEN | OPEN | Pending |       |

---

## Final Decision

- [ ] APPROVED FOR FABRICATION
- [ ] HOLD (requires fixes)

Decision owner: `OPEN`
Decision date: `OPEN`
Revision tag: `OPEN`
