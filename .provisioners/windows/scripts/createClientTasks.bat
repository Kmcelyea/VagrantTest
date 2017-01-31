SchTasks /Delete /TN "KioskSync" /f
SchTasks /Create /SC minute /MO 5 /TN "KioskSync" /TR "C:\vagrant\QT.Deploy.SyncService\obj\Debug\QT.DeploySyncService.exe \" kiosk\"
SchTasks /Run /TN "KioskSync"
