if (($null -ne (Get-Command git -ErrorAction SilentlyContinue))) {
    Import-Module posh-git
    Import-Module oh-my-posh
}