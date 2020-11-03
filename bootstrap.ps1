function mklink ($link, $target) {
    if (Test-Path $link) {
        Remove-Item $link
    }
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

function setupApplicationConfig($dir) {
    if (Test-Path $dir) {

    }

    Invoke-Expression ". .\$dir\setup.ps1 "
}

# Sets up symbolic links in the correct locations.

Write-Host "Linking dotfiles to their correct places..." -ForegroundColor "Yellow"

setupApplicationConfig("git")
setupApplicationConfig("vscode")

# powershell
Write-Host "Setting up Powershell..." -ForegroundColor "Yellow"

$profileDir = Split-Path -parent $profile
$componentDir = Join-Path $profileDir "components"

New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue
New-Item $componentDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Copy-Item -Path ./powershell/*.ps1 -Destination $profileDir
Copy-Item -Path ./powershell/components/** -Destination $componentDir -Include **
Copy-Item -Path ./windows/*.ps1 -Destination $profileDir

Remove-Variable componentDir
Remove-Variable profileDir
