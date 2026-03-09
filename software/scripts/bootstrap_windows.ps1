$ErrorActionPreference = 'Stop'

Write-Host "[info] Cyberdeck no-hardware bootstrap (Windows)"

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "[warn] winget not found. Install App Installer from Microsoft Store and re-run."
    exit 1
}

$packages = @(
    @{ Name = 'Git.Git'; Label = 'git' },
    @{ Name = 'Python.Python.3.12'; Label = 'python' },
    @{ Name = 'jqlang.jq'; Label = 'jq' },
    @{ Name = 'Kitware.CMake'; Label = 'cmake' },
    @{ Name = 'WiresharkFoundation.Wireshark'; Label = 'wireshark' },
    @{ Name = 'KiCad.KiCad'; Label = 'kicad' },
    @{ Name = 'gnuplot.gnuplot'; Label = 'gnuplot' }
)

foreach ($pkg in $packages) {
    Write-Host "[info] Installing $($pkg.Label) via winget ($($pkg.Name))"
    try {
        winget install --id $pkg.Name --silent --accept-source-agreements --accept-package-agreements
    }
    catch {
        Write-Host "[warn] Failed to install $($pkg.Label) ($($pkg.Name)); continue and verify manually."
    }
}

$pythonCmd = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonCmd) {
    $pythonCmd = Get-Command py -ErrorAction SilentlyContinue
}

if (-not $pythonCmd) {
    Write-Host "[warn] Python executable not found after install. Please install/repair Python and rerun pip setup."
    exit 0
}

Write-Host "[info] Installing Python packages for scripting and analysis"
if ($pythonCmd.Name -eq 'py') {
    py -m pip install --upgrade pip
    py -m pip install pyyaml pandas matplotlib pytest
}
else {
    python -m pip install --upgrade pip
    python -m pip install pyyaml pandas matplotlib pytest
}

Write-Host "[done] Bootstrap complete. Run: bash software/scripts/verify_toolchain.sh"
