$ErrorActionPreference = 'Stop'

$checks = @(
    @{ Display = 'python'; Commands = @('python', 'python3', 'py') },
    @{ Display = 'git'; Commands = @('git') },
    @{ Display = 'jq'; Commands = @('jq') },
    @{ Display = 'kicad-cli'; Commands = @('kicad-cli', 'kicad') },
    @{ Display = 'wireshark'; Commands = @('wireshark', 'tshark') },
    @{ Display = 'gnuplot'; Commands = @('gnuplot') }
)

$passCount = 0
$failCount = 0

Write-Host "[info] Verifying no-hardware toolchain (Windows)..."

foreach ($check in $checks) {
    $found = $false
    foreach ($cmd in $check.Commands) {
        if (Get-Command $cmd -ErrorAction SilentlyContinue) {
            $found = $true
            break
        }
    }

    if ($found) {
        Write-Host "[pass] $($check.Display)"
        $passCount++
    }
    else {
        Write-Host "[fail] $($check.Display) not found"
        $failCount++
    }
}

Write-Host ""
Write-Host "[summary] pass=$passCount fail=$failCount"

if ($failCount -gt 0) {
    Write-Host "[next] Install missing tools via software/scripts/bootstrap_windows.ps1 or manual setup."
    exit 2
}

Write-Host "[done] All required checks passed."
