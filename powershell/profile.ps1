Set-Theme Agnoster

Import-Module PSColor
# Import-Module posh-p4 -- Conflicts with TabExpansion from posh-git


# Start SshAgent if not already
# Need this if you are using github as your remote git repository
if (! (Get-Process | Where-Object { $_.Name -eq 'ssh-agent' })) {
    Start-SshAgent
}


function mklink ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
} 


# TODO -option AllScope prob needs to be renamed to -Force
# Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

# Add windows/cmds to PATH
#$env:PATH += ";C:/users/abrien/.dotfiles/windows/cmds"


Push-Location (Split-Path -parent $profile)
"components", "functions", "aliases", "exports", "extra" | Where-Object { Test-Path "$_.ps1" } | ForEach-Object -process { Invoke-Expression ". .\$_.ps1" }
Pop-Location