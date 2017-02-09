. C:\LocProvision\psscripts\menu\menu_front.ps1

Show-Menu –Title 'Deploy Application'
 $selection = Read-Host "Please make a selection"
 switch ($selection)
 {
     '1' {
			Invoke-Expression C:\LocProvision\psscripts\menu\menup_trigger.ps1
     } '2' {
			Invoke-Expression C:\LocProvision\psscripts\menu\menud_trigger.ps1
     } 'q' {
         return
     }
  
 }
 pause
 until ($selection -eq 'q')