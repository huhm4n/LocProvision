function Deploy-linuxseven{
	Param ($a)
	
	If ($a -eq 'linuxseven') {
		$hostname = 'centos7.test'
		$ADOK = $True
		$SamOK = $False
		$Index = 1
	Do {
		$sam = $hostname + ("{0:D2}" -f $Index++)
		$Check = Test-Path C:\LocProvision\vagrant_f\$sam
		Try {
			If ($Check -eq $True) {
			"already taken." | Write-Host
		} Else {
			"OK, still free." | Write-Host
			$SamOK = $True
		}
	}
	Catch {
		"Error!" | Write-Host
		$_.Exception | Out-String | Write-Error
		$ADOK = $False
	}
} Until ($SamOK -Or !$ADOK -Or ($Index -ge 99))
If ($SamOK) {
	New-Item c:\LocProvision\vagrant_f\$sam -type directory
} ElseIf (!$ADOK) {
	"Error accessing AD!" | Write-Host
} Else {
	"Unable to find a free index between 1 and 99!" | Write-Host
}
	$h = echo $sam
	Copy-Item -Path c:\LocProvision\vagrant_template\linux7\* -Destination c:\LocProvision\vagrant_f\$h -recurse -Force
	(Get-Content c:\LocProvision\vagrant_f\$h\Vagrantfile) -replace "centos7.test",$h | out-file -Encoding utf8 c:\LocProvision\vagrant_f\$h\Vagrantfile
	(Get-Content c:\LocProvision\vagrant_f\$h\provision\set_hostname.sh) -replace "centos7.test",$h | out-file -Encoding utf8 c:\LocProvision\vagrant_f\$h\provision\set_hostname.sh
	$command = 'vagrant up'
	cd c:\LocProvision\vagrant_f\$h
	& Invoke-Expression $command
	$EmailFrom = "notification@manish.com"
	$EmailTo = "7202244079@tmomail.net" 
	$Subject = "server is ready" 
	$Body = "$($h) is ready." 
	$SMTPServer = "smtp.gmail.com" 
	$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
	$SMTPClient.EnableSsl = $true 
	$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("neplearn.upload", "HamiGorkha1"); 
	$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
	
}
	Else {
	"$($a) is not supported at this time."
	}
}