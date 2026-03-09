#!/usr/bin/env bash
set -euo pipefail

required=("python3" "git")
recommended=("kicad-cli" "wireshark" "jq")
optional=("gnuplot" "ngspice" "qemu-system-aarch64")

score=0
max_score=0

check_group() {
  local weight="$1"
  shift
  for cmd in "$@"; do
    max_score=$((max_score + weight))
    if command -v "$cmd" >/dev/null 2>&1; then
      score=$((score + weight))
      echo "[ok] $cmd"
    else
      echo "[missing] $cmd"
    fi
  done
}

echo "[info] Calculating no-hardware readiness..."

echo "[group] Required"
check_group 20 "${required[@]}"

echo "[group] Recommended"
check_group 10 "${recommended[@]}"

echo "[group] Optional"
check_group 5 "${optional[@]}"

percent=0
if [[ "$max_score" -gt 0 ]]; then
  percent=$((score * 100 / max_score))
fi

echo
echo "[result] readiness_score=${score}/${max_score} (${percent}%)"

if [[ "$percent" -ge 85 ]]; then
  echo "[status] Strong no-hardware execution readiness"
elif [[ "$percent" -ge 65 ]]; then
  echo "[status] Moderate readiness; install missing recommended tools"
else
  echo "[status] Low readiness; run bootstrap and resolve missing tools"
fi
