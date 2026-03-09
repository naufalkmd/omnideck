# Render Brief Template (v1)

## Purpose

Use this template to request or produce Omnideck renders with consistent framing, styling, and engineering fidelity.

Primary reference: [OMNIDECK_VISUAL_DIRECTION.md](OMNIDECK_VISUAL_DIRECTION.md)

---

## Brief Metadata

- Render batch ID: `OPEN`
- Date: `YYYY-MM-DD`
- Owner: `OPEN`
- Target revision: `v1.x`
- Usage context: `README / investor deck / internal design review / manufacturing prep`

---

## Render Objective

- What this batch must communicate:
  - `OPEN`
- Primary audience:
  - `OPEN`
- Success criteria (3 bullets max):
  - `OPEN`

---

## Canonical Shot List (Required)

### Shot 01 — Front Operational View

Must show:

- open clamshell stance
- screen and input/control workspace
- stable bench-ready posture

Camera and composition:

- 3/4 front perspective
- horizon level, no dramatic lens distortion
- include enough surrounding context to read footprint

### Shot 02 — Internal Layout View

Must show:

- motherboard-first organization
- zoning: compute / power / RF / debug
- cable and connector discipline

Camera and composition:

- top-down or high 3/4 cutaway
- clear visibility of subsystem boundaries
- no occlusion of critical board areas

### Shot 03 — Field Deployment View

Must show:

- practical site/bench usage
- attached accessories (antennas/probes/cables) in controlled arrangement
- portability and setup realism

Camera and composition:

- environmental framing (not studio-only)
- no clutter that obscures the device
- clear foreground subject dominance

---

## Style Constraints (Mandatory)

- matte, low-glare material expression
- engineering-first, industrial styling
- restrained accent usage (status cues only)
- no decorative RGB themes
- no consumer-gaming aesthetic cues

---

## Hardware Fidelity Checklist

- [ ] port grouping matches current architecture (power/network/RF/debug)
- [ ] visible interfaces align with motherboard v1 scope
- [ ] no fictional modules or impossible connector placements
- [ ] thermal/service access remains plausible
- [ ] labels and indicators are legible at target output size

References:

- [MOTHERBOARD_V1_SPEC.md](MOTHERBOARD_V1_SPEC.md)
- [HARDWARE_DESIGN.md](HARDWARE_DESIGN.md)

---

## Technical Render Settings

- Target output sizes:
  - hero: `3840x2160`
  - docs/web: `1920x1080`
- Format:
  - master: `PNG`
  - optional preview: `JPG (high quality)`
- Background style:
  - `neutral dark` for studio shots
  - `contextual real-world` for field shot
- Lighting:
  - soft key + restrained rim
  - avoid high-gloss specular blowouts

---

## Deliverables

- [ ] Shot 01 final
- [ ] Shot 02 final
- [ ] Shot 03 final
- [ ] contact sheet (all candidates)
- [ ] short rationale note (what changed vs previous batch)

Output path convention:

- `assets/renders/<batch-id>/`

Filename convention:

- `<batch-id>_01_front_operational.png`
- `<batch-id>_02_internal_layout.png`
- `<batch-id>_03_field_deployment.png`

---

## Review and Acceptance

Reviewer checklist:

- [ ] matches `OMNIDECK_VISUAL_DIRECTION.md`
- [ ] communicates "portable lab instrument" clearly
- [ ] visually consistent across all three shots
- [ ] no contradiction with current hardware docs
- [ ] approved for publication/internal use

Decision:

- Status: `OPEN`
- Reviewer: `OPEN`
- Notes: `OPEN`
