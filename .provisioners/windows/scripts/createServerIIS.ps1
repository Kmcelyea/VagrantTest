New-Item C:\inetpub\wwwroot\QTMenus -type Directory

New-Item C:\inetpub\wwwroot\QTMenus\QT.Deploy.API.Shared -type Directory
New-Website -Name "QT.Deploy.API.Shared" -PhysicalPath C:\inetpub\wwwroot\QTMenus\QT.Deploy.API.Shared -Port 59913 -Force
New-Item C:\inetpub\wwwroot\QTMenus\QT.Deploy.API.KMS -type Directory
New-Website -Name "QT.Deploy.API.KMS" -PhysicalPath C:\inetpub\wwwroot\QTMenus\QT.Deploy.API.KMS -Port 59999 -Force
New-Item C:\inetpub\wwwroot\QTMenus\QT.Admin.Client -type Directory
New-Website -Name "QT.Admin" -PhysicalPath C:\inetpub\wwwroot\QTMenus\QT.Admin.Client -Port 51960 -Force
