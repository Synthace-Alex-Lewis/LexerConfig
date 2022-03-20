function expdot {
    C:\Windows\explorer.exe .
}

function bg() {
    Start-Process -NoNewWindow @args
}

function gitStatus {
    git status
}

function gitAddPatch {
    git add --patch
}

Set-Alias -Name here -Value expdot
Set-Alias -Name gs -Value gitStatus
Set-Alias -Name gap -Value gitAddPatch

Import-Module posh-git

Write-Host -ForegroundColor Green "## LexerConfig v1.0.0 ##"
Write-Host "History location $($(Get-PSReadlineOption).HistorySavePath)"
Write-Host "Powershell Profile loaded $profile"
Write-Host "==============================================================================================="