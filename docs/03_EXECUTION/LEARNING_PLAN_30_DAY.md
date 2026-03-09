# 30-Day Learning Plan (Execution-Ready)

## Purpose

This plan turns the Omnideck learning path into daily, measurable checkpoints.

Time budget target:

- 1-2 hours/day

Completion rule:

- Mark a day complete only when all pass criteria are met.

---

## Week 1 — Linux + Networking Core

### Day 01 — Shell and Filesystem Basics

Tasks:

- navigate directories, create/remove files/folders
- use `grep`, `find`, `cat`, `less` on real project files
- explain absolute vs relative paths in your own words

Pass criteria:

- [ ] execute 10 basic shell commands without reference
- [ ] produce a short note with 5 useful commands for this repo

### Day 02 — Processes, Services, Permissions

Tasks:

- inspect processes (`ps`, `top`/`htop`)
- understand executable bits and file permissions
- identify how scripts in `software/scripts/` are executed

Pass criteria:

- [ ] correctly explain rwx permissions for owner/group/others
- [ ] run one script and describe why it succeeds/fails

### Day 03 — TCP/IP Fundamentals

Tasks:

- review IP, subnet, gateway, DNS, ports
- map common protocols to ports (HTTP, HTTPS, SSH, DNS)

Pass criteria:

- [ ] write a one-page network basics summary
- [ ] correctly answer 10 self-quiz questions you create

### Day 04 — Routing and Connectivity Checks

Tasks:

- use `ping`, `traceroute`/`tracert`, `nslookup`/`dig`
- inspect local interface/network settings

Pass criteria:

- [ ] complete a connectivity test checklist for your machine
- [ ] document one real troubleshooting path from symptom to cause

### Day 05 — Packet Capture Basics

Tasks:

- open a sample capture in Wireshark
- apply 5 useful filters
- identify TCP handshake and DNS queries

Pass criteria:

- [ ] export screenshots of 3 filtered views
- [ ] write a short explanation of each filter used

### Day 06 — Protocol Analysis Workflow

Tasks:

- compare two traffic sessions (normal vs suspicious example)
- extract key indicators: IPs, domains, protocols, timing

Pass criteria:

- [ ] produce a one-page comparison report
- [ ] include a clear conclusion with evidence bullets

### Day 07 — Week 1 Mini-Project

Tasks:

- perform end-to-end network troubleshooting simulation
- capture, filter, and summarize findings

Pass criteria:

- [ ] submit a concise runbook-style report
- [ ] identify at least 3 lessons learned

---

## Week 2 — Python + Automation

### Day 08 — Python Fundamentals Refresh

Tasks:

- variables, loops, functions, lists/dicts
- set up virtual environment

Pass criteria:

- [ ] create and run a Python script with functions and CLI args
- [ ] explain virtual environment purpose in 3 bullets

### Day 09 — Files and Structured Data

Tasks:

- read/write JSON and CSV
- basic error handling (`try/except`)

Pass criteria:

- [ ] build script converting JSON -> CSV or CSV -> JSON
- [ ] include input validation and error messages

### Day 10 — CLI Scripting with argparse

Tasks:

- implement argument parsing
- add help text and default values

Pass criteria:

- [ ] script supports `--help` and at least 3 arguments
- [ ] invalid argument case handled cleanly

### Day 11 — Parsing Logs and Generating Summaries

Tasks:

- parse sample logs into structured output
- compute simple counts and top-N findings

Pass criteria:

- [ ] output a summary table/report
- [ ] verify results against manual spot-check

### Day 12 — Reporting and Visualization Basics

Tasks:

- generate one chart or structured text report
- standardize output folder structure

Pass criteria:

- [ ] produce one reproducible report artifact
- [ ] report reruns without manual edits

### Day 13 — Build a Reusable Analysis Script

Tasks:

- combine parse + summarize + output into one tool
- add clear README usage notes

Pass criteria:

- [ ] tool runs on at least 2 sample inputs
- [ ] usage doc includes command examples

### Day 14 — Week 2 Mini-Project

Tasks:

- automate a small security-analysis workflow
- generate final output with timestamp

Pass criteria:

- [ ] one command produces full result
- [ ] project note lists limitations and next improvements

---

## Week 3 — Embedded + Hardware Interfaces + KiCad

### Day 15 — UART/SPI/I2C/GPIO Concepts

Tasks:

- study each bus purpose and tradeoffs
- map where each appears in Omnideck docs

Pass criteria:

- [ ] complete one comparison table (speed, topology, use case)
- [ ] identify each bus in [docs/02_HARDWARE/MODULE_INTERFACE_SPEC.md](docs/02_HARDWARE/MODULE_INTERFACE_SPEC.md)

### Day 16 — Electrical Safety and Signal Basics

Tasks:

- voltage levels, grounding, pull-ups, common mistakes
- safe debugging habits checklist

Pass criteria:

- [ ] write personal safety checklist for bench work
- [ ] correctly explain why 3.3V/5V mismatch can break devices

### Day 17 — Schematic Reading Practice

Tasks:

- identify power rails, connectors, and interface blocks
- trace one signal path end-to-end

Pass criteria:

- [ ] annotate one architecture diagram with signal flow
- [ ] explain one critical path in plain language

### Day 18 — KiCad Fundamentals

Tasks:

- understand project structure, symbols, footprints
- run ERC/DRC conceptually and interpret outputs

Pass criteria:

- [ ] create a tiny practice schematic and run checks
- [ ] list top 5 DRC/ERC issue types in your notes

### Day 19 — Net Classes and Constraints

Tasks:

- review net classes and assignment strategy
- understand differential pair basics

Pass criteria:

- [ ] summarize [hardware/pcb/NETCLASS_TEMPLATE.md](hardware/pcb/NETCLASS_TEMPLATE.md)
- [ ] summarize [hardware/pcb/NET_ASSIGNMENT_MAP.md](hardware/pcb/NET_ASSIGNMENT_MAP.md)

### Day 20 — PCB Layout Review Mindset

Tasks:

- placement priorities, return paths, power loop awareness
- serviceability and connector access checks

Pass criteria:

- [ ] complete checklist review of [hardware/pcb/KICAD_CONSTRAINTS_CHECKLIST.md](hardware/pcb/KICAD_CONSTRAINTS_CHECKLIST.md)
- [ ] record at least 5 high-risk layout mistakes to avoid

### Day 21 — Week 3 Mini-Project

Tasks:

- run a mock pre-fab design review from docs only
- produce issues + recommendations list

Pass criteria:

- [ ] complete a filled review summary
- [ ] include severity tags (high/medium/low)

---

## Week 4 — RF + Integration + Final Readiness

### Day 22 — RF Fundamentals

Tasks:

- frequency, bandwidth, modulation, SNR, interference
- practical antenna and environment effects overview

Pass criteria:

- [ ] one-page RF cheat sheet completed
- [ ] explain 3 real-world RF constraints in field use

### Day 23 — SDR Workflow Basics

Tasks:

- inspect sample IQ concepts and processing steps
- map SDR workflow to project goals

Pass criteria:

- [ ] create SDR workflow diagram with input->processing->output
- [ ] list what can and cannot be validated without hardware

### Day 24 — GNU Radio/Wireshark Practice

Tasks:

- run a sample analysis workflow
- record assumptions and interpretation limits

Pass criteria:

- [ ] produce one analysis artifact
- [ ] include reproducible steps used

### Day 25 — Integrate Automation + Analysis

Tasks:

- connect Python scripts with analysis outputs
- standardize naming and output path

Pass criteria:

- [ ] run end-to-end pipeline once successfully
- [ ] outputs organized in a clear folder structure

### Day 26 — Project Docs Deep Review

Tasks:

- read architecture, motherboard spec, execution plan, checklist docs
- identify dependencies and critical path

Pass criteria:

- [ ] produce dependency map (what must happen before what)
- [ ] identify top 5 blockers if hardware starts today

### Day 27 — Mock Bring-Up Planning

Tasks:

- simulate first 48 hours of bring-up decisions
- prepare issue logging format

Pass criteria:

- [ ] complete a mock bring-up timeline
- [ ] create template for issue capture and triage

### Day 28 — Readiness Scoring and Gap Closure

Tasks:

- run no-hardware readiness scripts
- list missing tooling/skills and concrete fixes

Pass criteria:

- [ ] updated readiness output recorded
- [ ] gap list includes owner + deadline

### Day 29 — Final Integration Rehearsal

Tasks:

- perform full dry run: tools, scripts, documentation flow
- test whether a new collaborator can follow your notes

Pass criteria:

- [ ] collaborator checklist is clear enough to execute
- [ ] no ambiguous steps remain in your guide

### Day 30 — Final Deliverable Day

Tasks:

- write final 30-day readiness report
- define next 30-day plan (hardware-prototype phase)

Pass criteria:

- [ ] report includes strengths, gaps, risks, next actions
- [ ] next-phase plan has weekly goals and measurable outputs

---

## Weekly Review Template

Week: `WEEK-X`

- Completed:
- Missed:
- Main blocker:
- Mitigation for next week:
- Confidence score (0-10):

---

## Final Outcome Target (Day 30)

By Day 30, you should be able to:

- explain Omnideck architecture and motherboard scope confidently
- run and interpret core no-hardware tooling workflows
- understand interface-level hardware decisions (UART/SPI/I2C/GPIO, power, constraints)
- produce structured reports and reproducible automation scripts
- enter hardware phase with clear risk, checklist, and execution discipline
