# --- declaring variables ---
$source = "D:\" # path must end with "\"
$destination = "E:\" # path must end with "\"
$logFilePath = "C:\" # path must end with "\"

# --- script ---
$date = Get-Date -Format "yyyy.MM.dd_HH.mm"
$logFile = $logFilePath + "Backup-Robocopy-Mirror_Log_" + $date + ".log"
Write-Output "Files and folders are being mirrored from $source to $destination. Please wait..."
ROBOCOPY $source $destination /MIR /V /TS /FP /LOG+:$logFile /R:0 /W:0 /COPY:DAT
# syntax /MIR - mirror, /V - detailed log, /TS - time stamp, /FP - full paths, /LOG+ - appending logfile, /UNILOG+ - Unicode formatting, /R - retry on read error, /W - retry on write error, /COPY:DAT - copy file data + attributes + timestamp
Write-Output "Mirroring files and folders completed. Please check the logfile at '$logFile' if any error occured."
Write-Host "Press any key to close this window..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')