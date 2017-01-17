@echo off

if exist "C:\Program Files\Microsoft SQL Server\110\Tools\Binn\SQLCMD.EXE" (
  echo "SQL Server 2012 Express R2 detected, skipping installation..."
) else (
  echo Installing SQL Server 2012 Express R2, it will take a while...
  C:\vagrant\.provisioners\windows\executables\SQLEXPRWT_x64_ENU.exe /Q /Action=install /INDICATEPROGRESS /INSTANCENAME="SQLEXPRESS" /INSTANCEID="SQLExpress" /IAcceptSQLServerLicenseTerms /FEATURES=SQL,Tools /TCPENABLED=1 /SECURITYMODE="SQL" /SAPWD="#SAPassword!"
  echo Done!
)

echo Disabling firewall
netsh advfirewall set allprofiles state off
