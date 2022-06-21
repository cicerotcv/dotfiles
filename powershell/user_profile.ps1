# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Paradox


# Load Prompt Config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'user.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression


# Icons
Import-Module -Name Terminal-Icons


# PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionViewStyle ListView 
Set-PSReadLineOption -PredictionSource History


# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'


# Aliases
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'


# Utility Functions
function touch {
  $relative_path = $args[0]
  if ($relative_path -eq $null) {
    return Write-Error "You must provide file's relative path or absolute path"
  }
  if (Test-Path $relative_path) {
    (Get-ChildItem $relative_path).LastWriteTime = Get-Date
  }
  else {
    echo $null > $relative_path
  }
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function home {
  return $HOME
}


Clear-Host
