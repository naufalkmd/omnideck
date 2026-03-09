#!/usr/bin/env bash
set -euo pipefail

checks=(
  "python3"
  "git"
  "jq"
  "kicad-cli"
  "wireshark"
  "gnuplot"
)

pass_count=0
fail_count=0

echo "[info] Verifying no-hardware toolchain..."

for cmd in "${checks[@]}"; do
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "[pass] $cmd"
    pass_count=$((pass_count + 1))
  else
    echo "[fail] $cmd not found"
    fail_count=$((fail_count + 1))
  fi
done

echo

echo "[summary] pass=$pass_count fail=$fail_count"
if [[ "$fail_count" -gt 0 ]]; then
  echo "[next] Install missing tools via software/scripts/bootstrap_macos.sh or manual setup."
  exit 2
fi

echo "[done] All required checks passed."
