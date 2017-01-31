# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
#provision... , run:"always" to force provisions to run on reloads and ups after first

Vagrant.configure(2) do |config|

  config.vm.boot_timeout = 1000

  # needed_executables_for_windows = [
  #   'NDP452-KB2901907-x86-x64-AllOS-ENU.exe'
  # ]
  #
  # needed_executables_for_windows.each do |executable|
  #   unless File.exists?(".provisioners/windows/executables/#{executable}")
  #     puts "You are missing #{executable}, which is required to properly provision the windows vm"
  #     exit 1
  #   end
  # end

  config.vm.define "client" do |client|
    client.vm.box = "win10_dev"
    client.vm.box_version = "0"
    client.vm.network "private_network", ip: "10.1.1.33"

    client.vm.communicator = "winrm"
    client.winrm.retry_limit = 30
    client.winrm.retry_delay = 10
    client.winrm.username = "vagrant"
    client.winrm.password = "vagrant"

    client.vm.provision :shell, path: ".provisioners/windows/scripts/nuget-restore.cmd", run: "always"
    client.vm.provision :shell, path: ".provisioners/windows/scripts/msbuild.bat", run: "always"
    client.vm.provision :shell, path: ".provisioners/windows/scripts/copyClient.bat", run: "always"
    client.vm.provision :shell, path: ".provisioners/windows/scripts/createClientTasks.bat", run: "always"
  end

  config.vm.define "server" do |server|
    server.vm.box = "win10_dev"
    server.vm.box_version = "0"

    server.vm.communicator = "winrm"
    server.winrm.retry_limit = 30
    server.winrm.retry_delay = 10
    server.winrm.username = "vagrant"
    server.winrm.password = "vagrant"

    server.vm.network "private_network", ip: "10.1.1.34"
    server.vm.network :forwarded_port, guest: 8080, host: 8080
    server.vm.network :forwarded_port, guest: 59999, host: 59999 #KMS API PORT
    server.vm.network :forwarded_port, guest: 59913, host: 59913 #Shared API PORT
    server.vm.network :forwarded_port, guest: 51960, host: 51960 #Admin Client PORT
    server.vm.network :forwarded_port, guest: 2201, host: 2201
    server.vm.network :forwarded_port, guest: 2202, host: 2202

    server.vm.provision :shell, path: ".provisioners/windows/scripts/createServerIIS.ps1"
    server.vm.provision :shell, path: ".provisioners/windows/scripts/nuget-restore.cmd", run: "always"
    server.vm.provision :shell, path: ".provisioners/windows/scripts/buildCopyServer.bat", run: "always"
    server.vm.provision :shell, path: ".provisioners/windows/scripts/migrateDevServer.bat", run: "always"
    server.vm.provision :shell, path: ".provisioners/windows/scripts/createServerTasks.bat", run: "always"


  end
end
