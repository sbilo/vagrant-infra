VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"

  config.vm.box_url = "http://downloads.blueshift.nl/precise64.box"

  config.vm.define :puppet do |puppet_config|
    puppet_config.vm.network :public_network, ip: '192.42.172.20', :bridge => 'en0: Wi-Fi (AirPort)', :mac => '080027be7683'
    puppet_config.vm.host_name = "puppet"
    puppet_config.vm.provider "virtualbox" do |vb|
    	vb.customize ["modifyvm", :id, "--memory", "2048"]
    end
    puppet_config.vm.synced_folder "manifests/", "/etc/puppet/manifests"
    puppet_config.vm.synced_folder "modules/", "/etc/puppet/modules"
    puppet_config.vm.synced_folder "shared/", "/tmp/shared"
    puppet_config.vm.provision "shell", inline: "/usr/bin/apt-get update; /usr/bin/puppet apply --modulepath=/etc/puppet/modules -e \"class {'puppet::master': } \"; /etc/init.d/puppet restart"
  end

  config.vm.define :db do |db_config|
    db_config.vm.host_name = "db"
    db_config.vm.network :public_network, ip: '192.42.172.21', :bridge => 'en0: Wi-Fi (AirPort)', :mac => '080027be7684'
    db_config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
    db_config.vm.synced_folder "shared/", "/tmp/shared"
    db_config.vm.provision "shell", inline: "/usr/bin/apt-get update; /usr/bin/puppet apply -e \"host { 'puppet': name => 'puppet', ip => '192.42.172.20'} \"; /etc/init.d/puppet restart"
  end
  
  config.vm.define :tomee do |tomee_config|
    tomee_config.vm.host_name = "tomee"
    tomee_config.vm.network :public_network, ip: '192.42.172.22', :bridge => 'en0: Wi-Fi (AirPort)', :mac => '080027be7685'
    tomee_config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
    tomee_config.vm.synced_folder "shared/", "/tmp/shared"
    tomee_config.vm.provision "shell", inline: "/usr/bin/apt-get update; /usr/bin/puppet apply -e \"host { 'puppet': name => 'puppet', ip => '192.42.172.20'} \"; /etc/init.d/puppet restart"
  end
end