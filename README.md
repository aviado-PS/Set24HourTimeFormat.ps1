# Set 24-Hour Time Format Across Windows 11

This PowerShell script, created by Aviad Ofek, serves the purpose of standardizing the time format to a 24-hour clock (HH:mm) across all user profiles on a Windows 11 system. It ensures uniformity in the way time is displayed, enhancing the user experience by applying a clear and consistent time format. This is particularly beneficial for organizations or individuals with a preference for the 24-hour notation, providing clarity and avoiding confusion in time representation.

## Features

- **Universal Application**: Modifies the time format to a 24-hour clock for all current and future user profiles.
- **Immediate Update**: Restarts Windows Explorer to apply the changes across the system instantly, affecting areas like the lock screen and system tray clock.
- **Easy to Deploy**: Designed for straightforward execution, requiring minimal user interaction.
- **Windows 11 Compatibility**: Tailored specifically for Windows 11 systems, ensuring reliable performance and compatibility.

## Prerequisites

Before running this script, ensure you have:
- Administrative privileges on the Windows 11 machine.
- PowerShell access to execute scripts.

## Usage

To apply the 24-hour time format across all user profiles on your Windows 11 system, follow these steps:

1. **Download the Script**: Save the `Set24HourTimeFormat.ps1` file to your computer.
2. **Open PowerShell as Administrator**: Right-click on the PowerShell icon and select "Run as administrator" to ensure sufficient privileges.
3. **Execute the Script**: Navigate to the directory containing the script and run it by typing:
.\Set24HourTimeFormat.ps1

This will automatically update the time format settings and apply them system-wide.

## How It Works

The script performs the following actions:
- Updates the system-wide locale settings to enforce the 24-hour time format.
- Applies the 24-hour time format to the current user profile and all loaded user profiles.
- Restarts the Windows Explorer process to make the changes effective immediately across the system.

## Version

- Version: 1.0
- Compatibility: Windows 11

Please ensure that you execute this script with the necessary administrative privileges to modify system settings and user profiles.

## Contributing

Your contributions are welcome! If you have suggestions for improving this script, please feel free to fork the repository, make your changes, and submit a pull request. Let's work together to enhance system configuration and user experience consistency.

---
