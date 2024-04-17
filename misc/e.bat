@echo off

set EXE_PATH="C:/Program Files/Alacritty/alacritty.exe"
start "" %EXE_PATH% -e "nvim %*"