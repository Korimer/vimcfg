winget install Neovim.Neovim
winget install --id MikeFarah.yq

$nvide = 'neovide.exe'
$nvimbin = 'C:\Program Files\Neovim\bin'
$nvimcfg = "$env:USERPROFILE\AppData\Local\nvim"
$nvimsessions = "$home\vimsessions"

Invoke-Webrequest 'https://github.com/neovide/neovide/releases/latest/download/neovide.exe.zip' -OutFile "$nvide.zip"
7z x "$nvide.zip"
rm "$nvide.zip"

$nvimlink = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Neovim\Neovim.lnk'
$redirect = ".\Neovim.lnk"

Start-Process powershell -Verb RunAs -ArgumentList @(
    '-c'
    @(
        "cd $(Get-Location)"
        "mv '$nvide' '$nvimbin' -Force"
        "mv lua $nvimbin"
        "mv '$redirect' '$nvimlink' -Force"
    ) -join ';'
)

New-Item $nvimcfg -ItemType Directory -Force
New-Item $nvimsessions -ItemType Directory -Force

@(
    "init.lua"
    "Sync-VimSetup.ps1"
    ".git"
) | % {mv $_ $nvimcfg}
