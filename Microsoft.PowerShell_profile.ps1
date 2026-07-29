################################################################################
# PowerShell Profile
################################################################################

# Box drawing characters.
# Defined by code point so that this file stays ASCII only.
# (Windows PowerShell 5.1 reads a BOM-less script as the ANSI code page.)
$PromptCornerTop    = [char]0x250C  # Top left corner
$PromptCornerBottom = [char]0x2514  # Bottom left corner
$PromptLine         = [char]0x2500  # Horizontal line

# Colors
$PromptFrameColor  = "DarkBlue"
$PromptIdentColor  = "DarkGreen"
$PromptPathColor   = "DarkBlue"
$PromptBranchColor = "DarkGreen"

# Resolve git availability once, to keep the prompt cheap
$PromptGitAvailable = [bool](Get-Command git -ErrorAction SilentlyContinue)

function Get-PromptGitBranch() {
  if (-not $PromptGitAvailable) {
    return $null
  }

  # Returns nothing outside of a work tree
  $branch = & git rev-parse --abbrev-ref HEAD 2>$null
  if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrEmpty($branch)) {
    return $null
  }

  # Detached HEAD: show the short commit hash instead
  if ($branch -eq "HEAD") {
    $branch = & git rev-parse --short HEAD 2>$null
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrEmpty($branch)) {
      return $null
    }
  }
  $gitMarker = "git://"

  return "$gitMarker$branch"
}

function Get-PromptPath() {
  $location = Get-Location

  # Replace home directory with ~
  $path = $location.Path.Replace($HOME, "~")

  # Drop the drive letter (not present for non file system providers)
  if ($location.Drive) {
    $path = $path.Replace("$($location.Drive.Name):", "")
  }

  return $path.Replace("\", "/")
}

function prompt() {
  $userName     = $env:USERNAME
  $computerName = $env:COMPUTERNAME.ToLower()
  $currentPath  = Get-PromptPath
  $branch       = Get-PromptGitBranch

# Set the prompt display format
# ---(userName@PCName)-[path]-[branch]
# L-$
  Write-Host "$PromptCornerTop$PromptLine$PromptLine(" -ForegroundColor $PromptFrameColor -NoNewline
  Write-Host "$userName@$computerName" -ForegroundColor $PromptIdentColor -NoNewline
  Write-Host ")-[" -ForegroundColor $PromptFrameColor -NoNewline
  Write-Host "$currentPath" -ForegroundColor $PromptPathColor -NoNewline
  Write-Host "]" -ForegroundColor $PromptFrameColor -NoNewline

  if ($branch) {
    Write-Host "-[" -ForegroundColor $PromptFrameColor -NoNewline
    Write-Host "$branch" -ForegroundColor $PromptBranchColor -NoNewline
    Write-Host "]" -ForegroundColor $PromptFrameColor -NoNewline
  }

  Write-Host ""
  Write-Host "$PromptCornerBottom$PromptLine" -ForegroundColor $PromptFrameColor -NoNewline
  Write-Host "$" -ForegroundColor $PromptIdentColor -NoNewline
  return " "
}
