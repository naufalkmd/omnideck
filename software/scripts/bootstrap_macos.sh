#!/usr/bin/env bash
set -euo pipefail

echo "[info] Cyberdeck no-hardware bootstrap (macOS)"

if ! command -v brew >/dev/null 2>&1; then
  echo "[warn] Homebrew not found. Install from https://brew.sh and re-run."
  exit 1
fi

packages=(
  python
  git
  wget
  jq
  cmake
)

optional_casks=(
  kicad
  wireshark
)

echo "[info] Installing core packages: ${packages[*]}"
brew install "${packages[@]}"

echo "[info] Installing optional GUI tools (may take time): ${optional_casks[*]}"
for cask in "${optional_casks[@]}"; do
  if brew list --cask "$cask" >/dev/null 2>&1; then
    echo "[skip] $cask already installed"
  else
    brew install --cask "$cask" || echo "[warn] Failed to install cask: $cask"
  fi
done

echo "[info] Installing Python packages for scripting and analysis"
python3 -m pip install --upgrade pip
python3 -m pip install pyyaml pandas matplotlib pytest

echo "[done] Bootstrap complete. Run: bash software/scripts/verify_toolchain.sh"
