chdir /d "C:\Program Files (x86)\MSBuild\14.0\Bin\"
msbuild.exe "C:\vagrant\QT.Menus.sln" /p:Configuration=Vagrant
(robocopy C:\vagrant\QT.Admin.Client C:\inetpub\wwwroot\QTMenus\QT.Admin.Client /MIR /Z /W:5) ^& IF %ERRORLEVEL% LEQ 4 exit /B 0
(robocopy C:\vagrant\QT.Deploy.API C:\inetpub\wwwroot\QTMenus\QT.Deploy.API.Shared /MIR /Z /W:5) ^& IF %ERRORLEVEL% LEQ 4 exit /B 0
msbuild.exe "C:\vagrant\QT.Menus.sln" /p:Configuration=Debug
(robocopy C:\vagrant\QT.Deploy.API C:\inetpub\wwwroot\QTMenus\QT.Deploy.API.KMS /MIR /Z /W:5) ^& IF %ERRORLEVEL% LEQ 4 exit /B 0
