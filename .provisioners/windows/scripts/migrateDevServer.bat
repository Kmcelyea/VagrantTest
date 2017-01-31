SET ConnectionString=data source=localhost;initial catalog=QuikTripMenus;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework
SET StartUpDirectory=C:\vagrant\QT.Admin.Data\bin\Debug\
SET projectPath=C:\vagrant
SET protractorPath=%projectPath%\QT.Admin.Client\node_modules\.bin
SET ConfigFilePath=%projectPath%\QT.Admin.Data\App.Config
SET MigrateExe=%projectPath%\packages\EntityFramework.6.1.3\tools\migrate.exe
SET P2SqlPath=%projectPath%\QT.Admin.P2SQL

%MigrateExe% QT.Admin.Data.dll /startUpDirectory:%StartUpDirectory% /startUpConfigurationFile:"%ConfigFilePath%" /connectionProviderName:"System.Data.SqlClient" /connectionString:"%ConnectionString%"
