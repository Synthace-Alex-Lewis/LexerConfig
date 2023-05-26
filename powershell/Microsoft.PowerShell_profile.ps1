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

function init_syn_cloud_vm() {
  $path = "$HOME\Repos\SynthCloudVM-PowerShell\SynthCloudVM"
  Import-Module $path
  Push-Location $path
  $version = $(git id)
  $branch = $(git rev-parse --abbrev-ref HEAD)
  Pop-Location
  return @($branch, $version)
}

function StartAlexVM() {
  param(
      [Parameter(Mandatory=$false)][string]$vmName
  )
  $started = $false
  try {
    # if no VM name was passed offer a list of choices because no-one likes typing out VM names
    if (!$vmName) {
      $vms = Get-SynthCloudVM -owner "alex.lewis@synthace.com"
      $i = 0
      foreach ($vm in $vms) {
        Write-Host -ForegroundColor Cyan "$i. " -NoNewline
        Write-Host -ForegroundColor Green "$($vm.Name)"
        $i++
      }
      $choice = Read-Host -Prompt "Please select a VM: "
      $vmName = $vms[$choice].Name
      Write-Host "Starting `"$vmName`""
    }
    $started = $true
    Start-SynthCloudVM $vmName
    $job = Start-Job -ScriptBlock { Start-Sleep -Seconds 1; & "$env:WINDIR\system32\mstsc.exe" /v:localhost:3390 }
    Start-SynthCloudVMTunnel $vmName
  } finally {
    if ($started) {
      Stop-Job -Job $job
      Stop-SynthCloudVM $vmName
    }
  }
}

init_posh_git
$info = init_syn_cloud_vm

Write-Host -ForegroundColor Green "## Lexer WorkConfig v1.0.2 ##"

Write-Host "History location " -NoNewLine
Write-Host -ForegroundColor Green "$($(Get-PSReadlineOption).HistorySavePath)"

Write-Host "Powershell Profile loaded " -NoNewLine
Write-Host -ForegroundColor Green "$profile"

Write-Host "SynthCloudVM " -NoNewLine
Write-Host -ForegroundColor Green "$($info[0]) @ $($info[1])"

Write-Host "==============================================================================================="