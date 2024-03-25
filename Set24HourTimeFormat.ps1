<#
.SYNOPSIS
Enforces a 24-hour time format across all user profiles on a Windows 11 system.

.DESCRIPTION
This PowerShell script is designed to standardize the time format to a 24-hour clock (HH:mm) across all user profiles within a Windows 11 environment. It updates both the system-wide and individual user settings to ensure consistency in time display. The script meticulously applies these changes to all currently loaded user profiles and the system default profile, ensuring that new users inherit this configuration. Additionally, to make the changes effective immediately, it restarts Windows Explorer, which applies the updated time format settings across the entire operating system, including system interfaces like the lock screen and system tray clock.

The operation involves modifying registry keys related to the control panel's international settings, affecting how time is displayed throughout the system. This script is particularly useful for organizations or individuals who prefer the 24-hour time format for its clarity and wish to ensure a uniform user experience across multiple accounts on the same machine.

.AUTHOR
Aviad Ofek - This script is developed by Aviad Ofek, aiming to enhance system configuration and user experience consistency through automation.

.NOTES
Version: 1.0
Compatibility: Windows 11
Please ensure that you have the necessary administrative privileges to modify system settings and user profiles before executing this script.

.EXAMPLE
.\Set24HourTimeFormat.ps1
Executes the script to update the time format settings to a 24-hour clock across all user profiles and the system-wide setting on a Windows 11 machine.

#>

# Script content follows...


# Define a function to update the time format for all users
Function Update-TimeFormatForAllUsers {
    Param (
        [string]$timeFormat
    )
    # Iterate through all loaded user profiles and update their time format
    $userHives = Get-ChildItem HKU:\ -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "S-1-5-21" }
    foreach ($hive in $userHives) {
        $path = "HKU:\$($hive.PSChildName)\Control Panel\International"
        Set-ItemProperty -Path $path -Name sTimeFormat -Value $timeFormat -ErrorAction SilentlyContinue
    }
}

# Update the system-wide locale settings to enforce the 24-hour format
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Nls\Locale" -Name sTimeFormat -Value "HH:mm"
# Update the current user's time format settings
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sTimeFormat -Value "HH:mm"

# Apply the 24-hour format across all user profiles
Update-TimeFormatForAllUsers -timeFormat "HH:mm"

# Restart Windows Explorer to apply changes system-wide
Stop-Process -Name explorer -Force
Start-Process explorer
