# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "vagrant-debian-jessie"
  config.vm.box_url = "http://www.icpublishing.co.uk/vagrant/vagrant-debian-jessie.json"
  config.vm.box_version = "1.1.0"

  config.vm.synced_folder "./",
                          "/vagrant",
                          create: true,
                          owner: "www-data",
                          group: "www-data"
  config.vm.synced_folder "./html/app",
                          "/vagrant/html/app",
                          owner: "www-data",
                          group: "www-data",
                          mount_options: ["dmode=775,fmode=664"]
  config.vm.synced_folder "./html/media",
                          "/vagrant/html/media",
                          owner: "www-data",
                          group: "www-data",
                          mount_options: ["dmode=775,fmode=664"]

  config.vm.hostname = "humberevents.dev"
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash' "
  config.ssh.forward_agent = true
  config.ssh.insert_key = false

  config.vm.network "private_network", ip: "192.168.33.111"

  config.hostsupdater.aliases = [
    "humberevents.dev",
    "www.humberevents.dev"
  ]

 config.vm.provision "shell", path: "scripts/vagrant-provision.sh"

end