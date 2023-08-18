function prompt { 
    $PS1 = "PS " + (Split-Path -Path (Get-Location) -Leaf) + "> "
    Write-Host -NoNewline $PS1
}
