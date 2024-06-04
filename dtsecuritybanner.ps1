$LastLoginPull = Get-WinEvent -LogName "Microsoft-Windows-Winlogon/Operational" -MaxEvents 1
$LastLoginTimeCreated = $LastLoginPull.TimeCreated
Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show("This system is restricted to DiliTrust authorized users. Unauthorized access is a violation of company policy and the law.

Last Login: $Env:USERNAME - $LastLoginTimeCreated",'DiliTrust','Ok','Info')