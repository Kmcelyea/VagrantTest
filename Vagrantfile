# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
#provision... , run:"always" to force provisions to run on reloads and ups after first

Vagrant.configure(2) do |config|

  config.vm.boot_timeout = 1000

  needed_executables_for_windows = [
    'SQLEXPRWT_x64_ENU.exe',
    'rinetd.exe',
    'NDP452-KB2901907-x86-x64-AllOS-ENU.exe'
  ]

  needed_executables_for_windows.each do |executable|
    unless File.exists?(".provisioners/windows/executables/#{executable}")
      puts "You are missing #{executable}, which is required to properly provision the windows vm"
      exit 1
    end
  end

  config.vm.define "windowsClient" do |windowsClient|
    windowsClient.vm.box = "williamtsoi/windows_10"
    windowsClient.vm.box_version = "1.0.0"
    windowsClient.vm.network "private_network", ip: "192.168.0.10"
    windowsClient.vm.network :forwarded_port, guest: 80, host: 8081
    windowsClient.vm.network :forwarded_port, guest: 2201, host: 2201
    windowsClient.vm.network :forwarded_port, guest: 2202, host: 2202

    windowsClient.vm.communicator = "winrm"
    windowsClient.winrm.retry_limit = 30
    windowsClient.winrm.retry_delay = 10
    windowsClient.winrm.username = "vagrant"
    windowsClient.winrm.password = "vagrant"

    windowsClient.vm.provision :shell, path: ".provisioners/windows/scripts/config-winrm.bat"
    windowsClient.vm.provision :shell, path: ".provisioners/windows/scripts/install-dot-net-45.cmd"
    windowsClient.vm.provision :shell, path: ".provisioners/windows/scripts/install-iis-windows.ps1"
    windowsClient.vm.provision :shell, path: ".provisioners/windows/scripts/delete-default-iis-website.ps1"
    windowsClient.vm.provision :shell, path: ".provisioners/windows/scripts/install-sql-server.cmd"
    windowsClient.vm.provision :shell, path: ".provisioners/windows/scripts/copyWindowsClient.bat", run: "always"

    #windowsClient.vm.synced_folder ".", "C:/inetpub/wwwroot/QTKiosk", create:true, type: "virtualbox", mount_options: ["dmode=775,fmode=664"]
  end

  config.vm.define "windowsServer" do |windowsServer|
    windowsServer.vm.box = "opentable/win-2012r2-standard-amd64-nocm"
    windowsServer.vm.box_version = "1.0.0"

    windowsServer.vm.communicator = "winrm"
    windowsServer.winrm.retry_limit = 30
    windowsServer.winrm.retry_delay = 10
    windowsServer.winrm.username = "vagrant"
    windowsServer.winrm.password = "vagrant"

    windowsServer.vm.network "private_network", ip: "192.168.0.11"
    windowsServer.vm.network :forwarded_port, guest: 80, host: 8080

    windowsServer.vm.provision :shell, path: ".provisioners/windows/scripts/config-winrm.bat"
    windowsServer.vm.provision :shell, path: ".provisioners/windows/scripts/install-dot-net.ps1"
    windowsServer.vm.provision :shell, path: ".provisioners/windows/scripts/install-dot-net-45.cmd"
    windowsServer.vm.provision :shell, path: ".provisioners/windows/scripts/install-iis-WinServer.cmd"
    windowsServer.vm.provision :shell, path: ".provisioners/windows/scripts/delete-default-iis-website.ps1"
    windowsServer.vm.provision :shell, path: ".provisioners/windows/scripts/install-sql-server.cmd"
  end
end
