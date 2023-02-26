function Start-WinFormDataGridView {
  # Data
  $Processes = Get-Process | Select-Object Name, Id, Description, @{n="Memory"; e={$_.WorkingSet}}
  $ArrayList = New-Object System.Collections.ArrayList
  $ArrayList.AddRange($Processes)
  $Properties = @{Size = New-Object System.Drawing.Size(800,400); ColumnHeadersVisible = $true; DataSource = $ArrayList}

  # Form
  $Form = New-Object System.Windows.Forms.Form
  $Form.Size = New-Object System.Drawing.Size(900,600) 
  $DataGridView = New-Object System.Windows.Forms.DataGridView -Property $Properties
  $Form.Controls.Add($DataGridView)
  $Form.ShowDialog()
}