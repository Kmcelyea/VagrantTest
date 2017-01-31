@echo off

echo "Restoring Nuget Packages for QTMenus"
chdir /d C:\vagrant\.provisioners\windows\executables\
nuget.exe restore C:\vagrant\QT.Menus.sln -noninteractive
nuget.exe update-package --reinstall -Project "C:\vagrant\QT.Admin.Client\QT.Admin.Client.csproj"

echo "Done!"
