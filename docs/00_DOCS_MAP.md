# Documentation Map (Single-Owner, No-Overlap)

## Purpose

This map defines ownership boundaries for every document so each topic has one canonical location and other docs link to it instead of duplicating content.

---

## Structure

- `docs/01_FOUNDATION/` — system context and project direction
- `docs/02_HARDWARE/` — physical design and implementation specs
- `docs/03_EXECUTION/` — no-hardware execution, simulation, and tracking
- `docs/artifacts/` — generated evidence and baselines

---

## Canonical Ownership Matrix

| Topic                         | Canonical Document                                | Allowed Elsewhere       |
| ----------------------------- | ------------------------------------------------- | ----------------------- |
| System architecture layers    | `01_FOUNDATION/SYSTEM_ARCHITECTURE.md`            | Summary + link only     |
| Capability coverage matrix    | `01_FOUNDATION/SECURITY_RESEARCH_CAPABILITIES.md` | Summary + link only     |
| Phase roadmap and milestones  | `01_FOUNDATION/CYBERDECK_ROADMAP.md`              | Progress snippet + link |
| Hardware board architecture   | `02_HARDWARE/HARDWARE_DESIGN.md`                  | References only         |
| Electrical interfaces/signals | `02_HARDWARE/MODULE_INTERFACE_SPEC.md`            | References only         |
| Motherboard v1 requirements   | `02_HARDWARE/MOTHERBOARD_V1_SPEC.md`              | References only         |
| Industrial visual direction   | `02_HARDWARE/OMNIDECK_VISUAL_DIRECTION.md`        | References only         |
| Render brief standard         | `02_HARDWARE/RENDER_BRIEF_TEMPLATE.md`            | References only         |
| BOM and cost planning         | `02_HARDWARE/BOM_TEMPLATE.md`                     | Budget summary + link   |
| Bring-up validation checklist | `02_HARDWARE/HARDWARE_CHECKLIST.md`               | Gate reference + link   |
| No-hardware strategy + limits | `03_EXECUTION/NO_HARDWARE_EXECUTION_PLAN.md`      | Summary + link          |
| Skill ramp and daily criteria | `03_EXECUTION/LEARNING_PLAN_30_DAY.md`            | Summary + link          |
| Simulation tools reference    | `03_EXECUTION/SIMULATION_TOOLING_GUIDE.md`        | Tool mention + link     |
| Weekly simulation procedure   | `03_EXECUTION/SIMULATION_RUNBOOK.md`              | Step summary + link     |
| Execution status tracker      | `03_EXECUTION/EXECUTION_TRACKER.md`               | Snapshot + link         |
| Procurement status tracker    | `03_EXECUTION/PROCUREMENT_TRACKER.md`             | Snapshot + link         |
| Baseline evidence outputs     | `artifacts/*`                                     | Pointer only            |

---

## Writing Rules (No-Overlap Policy)

- Put detailed content in its canonical document only.
- In non-canonical docs, keep to 3-5 bullet summaries and link to source.
- Do not duplicate tables across docs unless they are execution snapshots with date/version labels.
- If a section grows beyond summary scope, move it to the canonical file.

---

## Quick Navigation

- Start here for system context: [01_FOUNDATION/SYSTEM_ARCHITECTURE.md](01_FOUNDATION/SYSTEM_ARCHITECTURE.md)
- Start here for hardware implementation: [02_HARDWARE/MOTHERBOARD_V1_SPEC.md](02_HARDWARE/MOTHERBOARD_V1_SPEC.md)
- Start here for visual direction: [02_HARDWARE/OMNIDECK_VISUAL_DIRECTION.md](02_HARDWARE/OMNIDECK_VISUAL_DIRECTION.md)
- Start here for render briefs: [02_HARDWARE/RENDER_BRIEF_TEMPLATE.md](02_HARDWARE/RENDER_BRIEF_TEMPLATE.md)
- Start here for no-hardware execution: [03_EXECUTION/NO_HARDWARE_EXECUTION_PLAN.md](03_EXECUTION/NO_HARDWARE_EXECUTION_PLAN.md)
- Start here for skill ramp: [03_EXECUTION/LEARNING_PLAN_30_DAY.md](03_EXECUTION/LEARNING_PLAN_30_DAY.md)
- Latest baseline evidence: [artifacts/READINESS_BASELINE_2026-03-09.md](artifacts/READINESS_BASELINE_2026-03-09.md)
