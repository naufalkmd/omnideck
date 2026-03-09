# Omnideck Visual Direction

## Purpose

Define a concrete visual direction for Omnideck so renders, enclosure design, and physical build decisions stay consistent.

This specification is intentionally practical and build-aware: every visual decision should support usability, serviceability, and field operation.

---

## Visual Positioning

Omnideck should read as:

- portable security research workstation
- industrial and engineering-forward
- field-capable, not consumer-styled
- cleanly modular with minimal visual clutter

Primary visual message:

**"A serious portable lab instrument."**

---

## Form and Proportion

### Base Form

- clamshell cyberdeck profile
- low center of gravity when open on bench
- stable stance with non-slip feet

### Proportion Targets

- visual mass concentrated in base for stability
- display section visually lighter than base section
- edge thickness controlled to avoid bulky appearance

### Geometry Language

- straight functional lines with moderate corner radii
- no ornamental curvature
- no aggressive gamer-style silhouettes

---

## Exterior Design Language

### Surface Character

- matte, low-reflection surfaces
- restrained texture for grip and scratch tolerance
- avoid glossy finishes on primary touch and viewing zones

### Hardware Expression

- exposed fasteners are acceptable when aligned and intentional
- connector and service points should look deliberate, not improvised
- panel seams should follow functional boundaries

### Branding Style

- minimal, small-format identity marks
- avoid dominant logo treatments on top shell
- prioritize labeling clarity over decorative graphics

---

## Color and Material Direction

### Palette Intent

- base: deep neutral dark tones
- secondary: graphite/charcoal structural tones
- accent: one restrained technical accent color for status cues only

### Material Intent

- structure: aluminum or rigid engineering polymer blend
- removable/service panels: durable polymer with clear labeling support
- touch zones: non-slip, oil-resistant finish where practical

### Contrast Rules

- maintain high contrast for text labels and port identifiers
- ensure readability in low-light and outdoor shade conditions

---

## Interface and Layout Aesthetic

### Port Side Strategy

- group by function: power, network, RF, debug, general I/O
- keep frequent-service interfaces easy to access from board edge
- avoid crossing cable paths over controls or keyboard zone

### Front Working Zone

- keyboard and control area should appear tool-like and uncluttered
- preserve clear hand-rest areas for long sessions
- maintain visual separation between input area and status/diagnostic area

### Internal Layout Readability

- motherboard zone clearly central and legible
- power section visually isolated from RF-sensitive regions
- cable routing should look structured and serviceable

---

## UX Visual Priorities (Physical)

Ranked from highest to lowest:

1. readability of labels, indicators, and ports
2. access for debug and maintenance actions
3. thermal and airflow compatibility
4. portability and field durability perception
5. aesthetic polish

Rule:

If aesthetic preference conflicts with serviceability or thermal reliability, choose serviceability/reliability.

---

## Lighting and Indicator Style

- status LEDs should be visible but not glaring in dark environments
- use consistent color semantics across power/boot/fault indicators
- avoid decorative RGB effects in v1 baseline

---

## Render Composition Guidance

Use three canonical render angles for consistency across updates.

### 1) Front Operational View

Shows:

- open deck stance
- screen and keyboard/control area
- primary field-usage posture

### 2) Internal Layout View

Shows:

- motherboard-first organization
- subsystem zoning (compute/power/RF/debug)
- cable and connector discipline

### 3) Field Deployment View

Shows:

- realistic operating context (bench/site)
- attached probes/antennas/cables in controlled arrangement
- portability cues (footprint, setup practicality)

---

## Do / Avoid List

### Do

- make it look like professional research equipment
- keep visual hierarchy clear and function-driven
- use consistent spacing, alignment, and labeling

### Avoid

- decorative visual noise
- excessive color accents
- purely cosmetic elements that increase complexity
- layouts that hide debug access

---

## v1 Visual Acceptance Checklist

- [ ] Overall silhouette communicates portable lab equipment
- [ ] Exterior finish appears matte and low-glare
- [ ] Ports and service points are grouped and clearly labeled
- [ ] Internal layout visibly reflects motherboard-first architecture
- [ ] Render set includes front, internal, and field views
- [ ] No visual element compromises thermal or maintenance access

---

## Cross-Reference

- hardware architecture: [HARDWARE_DESIGN.md](HARDWARE_DESIGN.md)
- motherboard requirements: [MOTHERBOARD_V1_SPEC.md](MOTHERBOARD_V1_SPEC.md)
- bring-up/service expectations: [HARDWARE_CHECKLIST.md](HARDWARE_CHECKLIST.md)
