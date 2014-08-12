# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = "promet-php-cookbook-berkshelf"
  config.omnibus.chef_version = :latest

  #config.vm.synced_folder ".", "/home/vagrant/kirkberk", :nfs => true

  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "opscode_debian-7.1.0_provisionerless.box"
  #config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_debian-7.1.0_provisionerless.box"
  config.vm.box = "opscode_centos-6.5_chef-provisionerless.box"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, ip: "10.33.33.102"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.

  # config.vm.network :public_network

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.
  #config.vm.boot_timeout = 120
  #config.ssh.max_tries = 40
  #config.ssh.timeout   = 120

  # The path to the Berksfile to use with Vagrant Berkshelf
  config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :promet_php => {
        :memory_limit => "196M",
        :upload_max_filesize => "30M",
        :post_max_size => "10M",
        :expose_php => "Off",
        :max_execution_time => "300",
        :max_input_time => "300",
        :realpath_cache_size => "64k",
        :conf_dir => "/etc/php5/apache2",
        :apc => {
          :shm_size => "96"
        }
      }
    }

    chef.run_list = [
      #"recipe[apt]",
      "recipe[yum]",
      "recipe[yum-epel]",
      "recipe[build-essential]",
      "recipe[nginx]",
      "recipe[promet_php]",
      #"recipe[promet_php::apache2]",
      "recipe[promet_php::php-fpm]",
      "recipe[php::module_mysql]",
      "recipe[php::module_gd]",
      "recipe[php::module_curl]",
      "recipe[promet_php::module_mcrypt]",
      "recipe[promet_php::module_apc]",
      "recipe[memcached-cookbook]",
      "recipe[promet_php::module_memcached]"
    ]
  end
end
