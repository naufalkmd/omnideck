# Omnideck Render Brief — BATCH-001

## Brief Metadata

- Render batch ID: `BATCH-001`
- Date: `2026-03-10`
- Owner: `Naufal`
- Target revision: `v1.0`
- Usage context: `README + internal design review`

## Render Objective

- Communicate Omnideck as a serious portable lab instrument.
- Show motherboard-first internal organization clearly.
- Produce one consistent, publishable 3-shot baseline set.

Primary audience:

- project collaborators
- hardware/design reviewers

Success criteria:

- all three required shots delivered with consistent style
- visuals align with motherboard v1 architecture and port strategy
- outputs are ready for README/docs use without rework

## Canonical Shot List (Required)

### Shot 01 — Front Operational View

Must show:

- open clamshell stance
- screen and input/control workspace
- stable bench-ready posture

Camera/composition:

- 3/4 front perspective
- neutral lens feel (no dramatic distortion)
- frame includes enough context to read size and stance

Output filename:

- `BATCH-001_01_front_operational.png`

### Shot 02 — Internal Layout View

Must show:

- motherboard-first organization
- clear subsystem zones: compute / power / RF / debug
- clean cable and connector routing discipline

Camera/composition:

- top-down or high 3/4 cutaway
- critical board areas unobstructed
- labels/major interfaces visually readable

Output filename:

- `BATCH-001_02_internal_layout.png`

### Shot 03 — Field Deployment View

Must show:

- realistic bench/field usage context
- attached accessories (antennas/probes/cables) in controlled arrangement
- portability and setup practicality

Camera/composition:

- environmental framing while device remains dominant subject
- no clutter hiding ports or operating posture

Output filename:

- `BATCH-001_03_field_deployment.png`

## Style Constraints (Mandatory)

- matte, low-glare material expression
- industrial, engineering-first appearance
- restrained accent usage for status cues only
- no decorative RGB themes
- no consumer/gaming aesthetic cues

## Hardware Fidelity Checklist

- [ ] port grouping reflects current v1 architecture
- [ ] motherboard-first internal layout is clearly represented
- [ ] no fictional modules/connectors are introduced
- [ ] thermal/service access remains plausible
- [ ] labels and indicators remain readable at 1920x1080

References:

- [docs/02_HARDWARE/OMNIDECK_VISUAL_DIRECTION.md](../../../docs/02_HARDWARE/OMNIDECK_VISUAL_DIRECTION.md)
- [docs/02_HARDWARE/MOTHERBOARD_V1_SPEC.md](../../../docs/02_HARDWARE/MOTHERBOARD_V1_SPEC.md)
- [docs/02_HARDWARE/HARDWARE_DESIGN.md](../../../docs/02_HARDWARE/HARDWARE_DESIGN.md)

## Technical Render Settings

- Target output sizes:
  - hero: `3840x2160`
  - docs/web: `1920x1080`
- Format:
  - master: `PNG`
  - preview: `JPG` (optional)
- Lighting:
  - soft key + restrained rim
  - avoid high-gloss specular blowouts

## Deliverables

- [ ] `BATCH-001_01_front_operational.png`
- [ ] `BATCH-001_02_internal_layout.png`
- [ ] `BATCH-001_03_field_deployment.png`
- [ ] contact sheet of alternatives
- [ ] short note on changes/decisions

Output path:

- `assets/renders/BATCH-001/`

## Review and Acceptance

Reviewer checklist:

- [ ] aligns with Omnideck visual direction
- [ ] reads as portable research lab equipment
- [ ] consistent style across all 3 images
- [ ] no conflict with hardware docs
- [ ] approved for README/docs publication

Decision:

- Status: `OPEN`
- Reviewer: `OPEN`
- Notes: `OPEN`
