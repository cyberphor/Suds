Get-Content .\people.txt | 
ForEach-Object {
    $LastName = ($_ -split " ")[0]
    $FirstName = ($_ -split " ")[1]
    $MiddleName = ($_ -split " ")[2]

    if ($MiddleName) {
        $LastName + ", " + $FirstName + " " + $MiddleName[0] + ";"
    } else {
        $LastName + ", " + $FirstName + ";"
    }
} | Out-File "people2.txt"

$File = Get-Content .\people3.txt
$Emails = $File -split ";"
$Emails.Trim() | Sort-Object -Property Length

Get-Content .\people4.txt |
ForEach-Object {
    $Email = ($_ -split "<")[1]
    $Email.Replace(">","")
} | Out-File "people5.txt"

Get-Content .\4BN.csv |
ConvertFrom-Csv |
ForEach-Object {
    $Officer = New-Object psobject 
    $Officer | Add-Member -MemberType NoteProperty -Name "Last" -Value ($_.Name -split " ")[0]
    $Officer | Add-Member -MemberType NoteProperty -Name "First" -Value ($_.Name -split " ")[1]
    $Middle = ($_.Name -split " ")[2]
    if ($Middle) { $Officer | Add-Member -MemberType NoteProperty -Name "Middle" -Value $Middle[0] }
    $Officer | Add-Member -MemberType NoteProperty -Name "Branch" -Value $_.Branch
    $Officer | Add-Member -MemberType NoteProperty -Name "CONGR" -Value $_.CONGR
    $Officer | Add-Member -MemberType NoteProperty -Name "AOC" -Value $_.AOC
    $Officer | Add-Member -MemberType NoteProperty -Name "Type" -Value $_.Type
    $Officer
} | Export-Csv "people6.csv"

$Emails = cat .\people5.txt
cat .\people6.csv |
ConvertFrom-Csv |
ForEach-Object {
    $First = $_.First.ToLower()
    $Last = $_.Last.ToLower()
    $Email1 = $Emails | Where-Object { $_ -match $Last }
    $Email2 = $Email1 | Where-Object { $_ -match $First }

    if ($Email2) {
        New-Object psobject -Property @{
            "First" = $_.First; 
            "Middle" = $_.Middle;
            "Last" = $_.Last;
            "Email" = $Email2;
            "Branch" = $_.Branch;
            "CONGR" = $_.CONGR;
            "AOC" = $_.AOC;
            "Type" = $_.Type;
        } 
    } 
} | Export-Csv "24-01-Movers.csv" -NoTypeInformation
