Get-CIMInstance -class Win32_operatingsystem |select Caption,Version | findstr 'Microsoft'