# Scripts

This folder contains no-hardware execution helpers for environment setup and readiness checks.

## Scripts

- `bootstrap_macos.sh` — installs baseline tooling via Homebrew (where available).
- `bootstrap_windows.ps1` — installs baseline tooling via `winget`.
- `verify_toolchain.sh` — checks required commands and prints pass/fail summary.
- `no_hardware_readiness.sh` — computes a simple readiness score from available tools.
- `verify_toolchain_windows.ps1` — native PowerShell toolchain verification.
- `no_hardware_readiness_windows.ps1` — native PowerShell readiness scoring.

## Usage

Run from repo root:

```bash
bash software/scripts/bootstrap_macos.sh
bash software/scripts/verify_toolchain.sh
bash software/scripts/no_hardware_readiness.sh
```

Windows (PowerShell):

```powershell
powershell -ExecutionPolicy Bypass -File .\software\scripts\bootstrap_windows.ps1
powershell -ExecutionPolicy Bypass -File .\software\scripts\verify_toolchain_windows.ps1
powershell -ExecutionPolicy Bypass -File .\software\scripts\no_hardware_readiness_windows.ps1
```

## Notes

- Scripts are non-destructive and do not modify hardware assets.
- You can safely run verification scripts before and after installations.
