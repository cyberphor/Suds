function Start-WinFormDataGridView {
  $Form = New-Object System.Windows.Forms.Form
  $Form.Size = "400,500" 
  $DataGridView = New-Object System.Windows.Forms.DataGridView
  $DataGridView.Size = "365,440"
  $DataGridView.Location = "10,10"
  $DataGridView.RowHeadersVisible = $false # don't show first column
  $DataGridView.ColumnHeadersVisible = $true
  $DataGridView.AutoSizeColumnsMode = "Fill"
  $DataGridView.AllowUserToAddRows = $false
  $DataGridView.AllowUserToResizeRows = $false

  $IndicatorTypes = @("ipv4-addr","domain-name","url")
  $IndicatorTypesColumn = New-Object System.Windows.Forms.DataGridViewComboBoxColumn
  $IndicatorTypesColumn.Name = "Indicator Type"
  $IndicatorTypesColumn.DataSource = $IndicatorTypes
  $IndicatorTypesColumn.DefaultCellStyle.NullValue = $IndicatorTypes[0] 
  $DataGridView.Columns.Add($IndicatorTypesColumn)

  $IndicatorValuesColumn = New-Object System.Windows.Forms.DataGridViewTextBoxColumn
  $IndicatorValuesColumn.Name = "Indicator Value"
  $DataGridView.Columns.Add($IndicatorValuesColumn)

  $DataGridView.RowCount = 10
  $Form.Controls.Add($DataGridView)
  $Form.ShowDialog()
}