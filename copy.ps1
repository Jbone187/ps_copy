$LocalOutbox = "D:\SFTP\*####*"
$RemoteCifs =  "\\remote_server"

$PeopletoNotify = '#####'
$LogFile = 'D:\Scripts\_Logs\######' + $(Get-Date -Format MMddyyyy-HHmmss-ffff) + '.log'


function SendError() {
    $Log = Get-Content $LogFile
    Send-MailMessage -To $PeopletoNotify -From "#####" -SmtpServer "server.com" -Subject "#####" -Body ($Log | Out-String)
}


function EOS() {
    Remove-Variable * -ErrorAction SilentlyContinue
    exit
}

function COM_ADF_PUT() {

    if (Test-Path -Path $LocalOutbox) {

    Set-Content -Path $LogFile -Value "Starting Script"
    Add-Content -Path $LogFile -Value "Stuff"

    $Results = Copy-Item -Path $LocalOutbox -Destination $RemoteCifs
    $NewdummyFile = Get-ChildItem 'D:\SFTP\######' -Filter *#####* -Recurse
    New-Item -Path $RemoteCifs -Name  $NewdummyFile'.flg' -ItemType File
    
    $Result = $Result -split "`r`n"
            
    }

   else {

       $Result = $Result -split "`r`n"
       foreach ($Line in $Result) {Add-Content -Path $LogFile -Value $Line}
       Add-Content -Path $LogFile -Value "Message"
       SendError
       EOS
      
    }
        
}

COM_ADF_PUT
