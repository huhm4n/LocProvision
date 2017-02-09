function Show-Menu
{
     param (
           [string]$Title = 'Lets Deploy'
     )
     cls
     
	 Write-Host "=================== Welcome to Self Service ==================="
     Write-Host "1: Provision Application"
     Write-Host "2: Deprovision"
     Write-Host "3: Other"
	 Write-Host "Q: Oops wrong window! Take me out"
}
