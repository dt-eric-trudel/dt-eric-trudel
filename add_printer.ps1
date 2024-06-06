# ~ Scripted by Eric TRUDEL ~
# Edition : [Home]=Yes [Pro/Business]=Yes [Server]=Yes
# Elevated Rights Required

# Warning : This Script doesn't care much for existing Printers & Printer Ports with the same infos you provide. Make sure your Printer Mapping doesn't overlap another existing Printer

# Initiate Variables
# Please, replace the Value inside the quotes with correct informations before using
$path_infFilePath = ""
$str_PrinterDName = ""
$str_DriverName = ""
$str_PrinterIPAddress = ""

#Gives time for Drivers to finish Downloading
#Start-Sleep -Seconds 10 <-- only use if you are using this script as part of an MDM Profile that handles the drivers Download on the system

# Run checks
$list_Printer = Get-Printer
$list_PrinterDriver = Get-PrinterDriver
$list_PrinterPort = Get-PrinterPort
  
if($str_PrinterDName -in $list_Printer.Name) {
    Remove-Printer -Name $str_PrinterDName
}

if($str_DriverName -in $list_PrinterDriver.Name) {
    Remove-PrinterDriver -Name $str_DriverName
}

if("IP_$str_PrinterIPAddress" -in $list_PrinterPort.Name) {
    Remove-PrinterPort -Name "IP_$str_PrinterIPAddress"
}

pnputil.exe -i -a $path_infFilePath
Add-PrinterDriver -Name "$str_DriverName"
Add-PrinterPort -Name "IP_$str_PrinterIPAddress" -PrinterHostAddress $str_PrinterIPAddress
Add-Printer -Name $str_PrinterDName -DriverName $str_DriverName -PortName "IP_$str_PrinterIPAddress"
Write-Verbose -Message "Printer $str_PrinterDName Added"
