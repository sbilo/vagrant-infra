VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"

  config.vm.box_url = "http://downloads.blueshift.nl/precise64.box"

  config.vm.define :puppet do |puppet_config|
    puppet_config.vm.host_name = "puppet"
    puppet_config.vm.network :public_network, :bridge => 'en0: Ethernet', :mac => '080027be7677'
    puppet_config.vm.provider "virtualbox" do |vb|
    	vb.customize ["modifyvm", :id, "--memory", "2048"]
    end
    puppet_config.vm.synced_folder "manifests/", "/etc/puppet/manifests"
    puppet_config.vm.synced_folder "modules/", "/etc/puppet/modules"
    puppet_config.vm.provision "shell", inline: "/usr/bin/puppet apply --modulepath=/etc/puppet/modules -e \"class {'puppet::master': webserver => 'unicorn'} \""
  end

  config.vm.define :db1 do |db1_config|
    db1_config.vm.host_name = "db1"
    db1_config.vm.network :public_network, :bridge => 'en0: Ethernet', :mac => '080027be7678'
    db1_config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
  end

  config.vm.define :db2 do |db2_config|
    db2_config.vm.host_name = "db2"
    db2_config.vm.network :public_network, :bridge => 'en0: Ethernet', :mac => '080027be7679'
    db2_config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
  end

  config.vm.define :db3 do |db3_config|
    db3_config.vm.host_name = "db3"
    db3_config.vm.network :public_network, :bridge => 'en0: Ethernet', :mac => '080027be7680'
    db3_config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
  end

  config.vm.define :logstash do |logstash_config|
    logstash_config.vm.host_name = "logstash"
    logstash_config.vm.network :public_network, :bridge => 'en0: Ethernet', :mac => '080027be7681'
  end
end
