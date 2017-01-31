(robocopy C:\vagrant\QT.Kiosk C:\QTKiosk /MIR /Z /W:5) ^& IF %ERRORLEVEL% LEQ 4 exit /B 0
