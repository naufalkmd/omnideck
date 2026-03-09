$ErrorActionPreference = 'Stop'

$required = @(
    @{ Display = 'python'; Commands = @('python', 'python3', 'py') },
    @{ Display = 'git'; Commands = @('git') }
)

$recommended = @(
    @{ Display = 'kicad-cli'; Commands = @('kicad-cli', 'kicad') },
    @{ Display = 'wireshark'; Commands = @('wireshark', 'tshark') },
    @{ Display = 'jq'; Commands = @('jq') }
)

$optional = @(
    @{ Display = 'gnuplot'; Commands = @('gnuplot') },
    @{ Display = 'ngspice'; Commands = @('ngspice') },
    @{ Display = 'qemu-system-aarch64'; Commands = @('qemu-system-aarch64') }
)

$score = 0
$maxScore = 0

function Test-CommandSet {
    param(
        [array]$Checks,
        [int]$Weight,
        [string]$GroupName
    )

    Write-Host "[group] $GroupName"

    foreach ($check in $Checks) {
        $script:maxScore += $Weight
        $found = $false
        foreach ($cmd in $check.Commands) {
            if (Get-Command $cmd -ErrorAction SilentlyContinue) {
                $found = $true
                break
            }
        }

        if ($found) {
            $script:score += $Weight
            Write-Host "[ok] $($check.Display)"
        }
        else {
            Write-Host "[missing] $($check.Display)"
        }
    }
}

Write-Host "[info] Calculating no-hardware readiness (Windows)..."
Test-CommandSet -Checks $required -Weight 20 -GroupName 'Required'
Test-CommandSet -Checks $recommended -Weight 10 -GroupName 'Recommended'
Test-CommandSet -Checks $optional -Weight 5 -GroupName 'Optional'

$percent = 0
if ($maxScore -gt 0) {
    $percent = [int](($score * 100) / $maxScore)
}

Write-Host ""
Write-Host "[result] readiness_score=$score/$maxScore ($percent%)"

if ($percent -ge 85) {
    Write-Host "[status] Strong no-hardware execution readiness"
}
elseif ($percent -ge 65) {
    Write-Host "[status] Moderate readiness; install missing recommended tools"
}
else {
    Write-Host "[status] Low readiness; run bootstrap and resolve missing tools"
}
