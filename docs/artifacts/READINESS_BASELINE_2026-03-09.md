# No-Hardware Readiness Baseline (2026-03-09)

## Toolchain Verification Output

- Pass: `python3`, `git`, `jq`
- Missing: `kicad-cli`, `wireshark`, `gnuplot`

## Readiness Score

- Score: `55/85`
- Percent: `64%`
- Status: `Low readiness; run bootstrap and resolve missing tools`

## Missing Tools to Install Next

1. `kicad-cli`
2. `wireshark`
3. `gnuplot`
4. `ngspice` (optional but strongly recommended)

## Recommended Next Command

```bash
bash software/scripts/bootstrap_macos.sh
```
