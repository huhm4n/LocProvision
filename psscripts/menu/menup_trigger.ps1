. C:\LocProvision\psscripts\menu\menu_p.ps1

Menu-Provision –Title 'Deploy Application'
 $selection = Read-Host "Please make a selection"
 switch ($selection)
 {
	'1' {
			Invoke-Expression C:\LocProvision\psscripts\call\call_linux6.ps1
	} '2' {
			Invoke-Expression C:\LocProvision\psscripts\call\call_linux7.ps1
	} '3' {
			Invoke-Expression C:\LocProvision\psscripts\call\call_ansible.ps1
	} 'b' {
			Invoke-Expression C:\LocProvision\psscripts\menu\menupd_trigger.ps1
    } 'q' {
         return
     }
  
 }
 pause
 until ($selection -eq 'q')