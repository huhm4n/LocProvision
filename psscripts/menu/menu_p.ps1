function Menu-Provision
{
     param (
           [string]$Title = 'Lets Deploy some shit'
     )
     cls
     
	 Write-Host "=================== Welcome to Application Provision Center ==================="
     Write-Host "1: Centos (Kernel Version 6.8)"
     Write-Host "2: Centos (Kernel Version 7.2)"
     Write-Host "3: Ansible Master (on Centos 6)"
	 Write-Host "B: Go back"
	 Write-Host "Q: Oops wrong window! Take me out"
}
