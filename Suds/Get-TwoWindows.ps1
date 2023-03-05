function Get-TwoWindows {
  1..2 | ForEach-Object { Start-Process -WindowStyle Normal powershell }
}
