function Start-SystemTrayApp {
  Add-Type -AssemblyName PresentationFramework
  Add-Type -AssemblyName System.Drawing
  Add-Type -AssemblyName System.Windows.Forms
  Add-Type -AssemblyName WindowsFormsIntegration
  
  $NotifyIcon = New-Object System.Windows.Forms.NotifyIcon
  $NotifyIcon.Text = "My App"
  #$NotifyIcon.Icon = New-Object System.Drawing.Icon("$PSScriptRoot\ghost.ico") # uncomment to use a custom .ico file
  $NotifyIcon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon("C:\Windows\System32\mmc.exe")
  $NotifyIcon.ContextMenu = New-Object System.Windows.Forms.ContextMenu
  
  $NewReport = New-Object System.Windows.Forms.MenuItem
  $NewReport.Enabled = $true
  $NewReport.Text = "New Report"
  $NewReport.Add_Click({ })
  $NotifyIcon.ContextMenu.MenuItems.AddRange($NewReport)
  
  $ShowLog = New-Object System.Windows.Forms.MenuItem
  $ShowLog.Enabled = $true
  $ShowLog.Text = "Show Log"
  $ShowLog.Add_Click({ })
  $NotifyIcon.ContextMenu.MenuItems.AddRange($ShowLog)
  
  $Quit = New-Object System.Windows.Forms.MenuItem
  $Quit.Text = "Quit"
  $Quit.Add_Click({ $NotifyIcon.Dispose(); Stop-Process $pid })
  $NotifyIcon.ContextMenu.MenuItems.AddRange($Quit)
  
  $NotifyIcon.Visible = $true
  
  $ApplicationContext = New-Object System.Windows.Forms.ApplicationContext
  [System.Windows.Forms.Application]::Run($ApplicationContext)
}