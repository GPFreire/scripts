# Script for change the JobTitle, CompanyName, Department and OfficeLocation attribute in EntraID

# Unblock the script execution
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned

# Connect EntraID
Connect-AzureAD
Connect-MsolService

# Data import
Import-Csv -Path "c:\temp\Change_Attributes_EntraID.csv" | ForEach-Object {
$UPN = $_.upn
$JobTitle = $_.JobTitle
$CompanyName = $_.CompanyName
$Department = $_.Department
$OfficeLocation = $_.officeLocation

# Change the attributes
Set-AzureADUser -ObjectId $UPN -Department $Department -JobTitle $JobTitle -CompanyName $CompanyName
Set-MsolUser -UserPrincipalName $upn -Office $OfficeLocation
}