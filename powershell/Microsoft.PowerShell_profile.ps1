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

function gitSync {
  git fetch -tpf
  git pull
}

function gitdifftoolToCommonAncestor {
  param ([Parameter()][string]$branchToCompTo)
  $currentBranch = git rev-parse --abbrev-ref HEAD
  $changeset = git merge-base $currentBranch $branchToCompTo
  git difftool -d $currentBranch $changeset
}

Set-Alias -name gdt -Value gitdifftoolToCommonAncestor
Set-Alias -Name here -Value expdot
Set-Alias -Name gs -Value gitStatus
Set-Alias -Name gap -Value gitAddPatch
Set-Alias -Name gsync -Value gitSync

function init_posh_git() {
  Import-Module posh-git
}

function init_analyzer() {
  Install-Module -Name PSScriptAnalyzer -Force
}

init_posh_git

Write-Host -ForegroundColor Green "## LexerConfig v1.0.2 ##"

Write-Host "History location " -NoNewLine
Write-Host -ForegroundColor Green "$($(Get-PSReadlineOption).HistorySavePath)"

Write-Host "Powershell Profile loaded " -NoNewLine
Write-Host -ForegroundColor Green "$profile"

Write-Host "==============================================================================================="
