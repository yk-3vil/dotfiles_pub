################################################################################
# PowerShell Profile
################################################################################
function prompt() {
  # Get User Name
  $userName = $env:USERNAME
  
  # Get Computer Name
  $computerName = $env:COMPUTERNAME.ToLower()
  
  # Get Current Drive Letter
  $driveLetter = $(Get-Location).Drive.Name

  # Get Current Path (C:) and replace home directory with ~
  $editHomePath = $(Get-Location).Path.Replace($HOME, "~").Replace("${driveLetter}:", "")

# Set the prompt display format
# userName@PCName: ~
# $
  Write-Host "$userName@$computerName" -ForegroundColor "DarkGreen" -NoNewline
  Write-Host ":" -NoNewline
  Write-Host "$editHomePath" -ForegroundColor "DarkBlue"
  Write-Host "$" -ForegroundColor "DarkGreen" -NoNewline
  return " "
}