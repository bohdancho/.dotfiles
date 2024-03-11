Set-Alias -Name vim -Value nvim

$ENV:STARSHIP_CONFIG = "\\wsl.localhost\Ubuntu-22.04\home\bohdancho\.dotfiles\.config\starship.toml"
Invoke-Expression (&starship init powershell)
