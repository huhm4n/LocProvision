. C:\LocProvision\psscripts\menu\menu_d.ps1

Menu-deProvision –Title 'Deprovision Application'
 $selection = Read-Host "Please type out the fqdn or type (b) to go back or (q) to quit"
 switch ($selection)
 {
     '1' {
			'not valid'
     } '2' {
         'not valid'
     } '3' {
         'not valid'
	} 'b' {
		 Invoke-Expression C:\LocProvision\psscripts\menu\menupd_trigger.ps1
     } 'q' {
         return
     }
  
 }
 pause
 until ($selection -eq 'q')