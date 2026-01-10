################################################################################
# PowerShellのプロファイルスクリプト                                           #
################################################################################
function prompt() {
  # ユーザー名を取得
  $userName = $env:USERNAME
  
  # PC名を取得、小文字に変換
  $computerName = $env:COMPUTERNAME.ToLower()
  
  # ドライブレターを取得
  $driveLetter = $(Get-Location).Drive.Name

  # ドライブ名(C:)を除いて、ホームディレクトリはチルダ(~)で表示
  $editHomePath = $(Get-Location).Replace($HOME, "~").Replace("${driveLetter}:", "")

  # プロンプトの表示形式を設定
  # userName@PC名: ~
  # $ 
  Write-Host "$userName@$computerName" -ForegroundColor "DarkGreen" -NoNewline
  Write-Host ":" -NoNewline
  Write-Host "$editHomePath" -ForegroundColor "DarkGreen" -NoNewline
  return " "
  
}