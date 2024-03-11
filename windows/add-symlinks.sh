cmd.exe /c "mklink C:\Users\bogda\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 \\\wsl.localhost\Ubuntu-22.04\home\bohdancho\.dotfiles\windows\Microsoft.PowerShell_profile.ps1"

settings_path="C:\Users\bogda\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
cmd.exe /c "del ${settings_path} & mklink ${settings_path} \\\wsl.localhost\Ubuntu-22.04\home\bohdancho\.dotfiles\windows\terminal.json"

powershell.exe '$Shortcut = (New-Object -comObject WScript.Shell).CreateShortcut("$HOME/Desktop/nvim-wsl.bat.lnk"); $Shortcut.TargetPath = "\\wsl.localhost\Ubuntu-22.04\home\bohdancho\.dotfiles\windows\nvim-wsl.bat"; $Shortcut.Save()'
