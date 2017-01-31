SchTasks /Delete /TN "KitchenSync" /f
SchTasks /Create /SC minute /MO 5 /TN "KitchenSync" /TR "C:\vagrant\QT.Deploy.SyncService\obj\Debug\QT.DeploySyncService.exe"
SchTasks /Run /TN "KitchenSync"
