function Menu-deProvision
{
     param (
           [string]$Title = 'Lets Deploy some shit'
     )
     cls
     
	 Write-Host "=================== Welcome to Application Deprovision ==================="
     Write-Host "Type the fqdn name to deprovision"
	 Write-Host "B: Go back"
	 Write-Host "Q: Oops wrong window! Take me out"
}
