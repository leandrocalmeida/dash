Vagrant.configure("2") do |config|

    config.vm.define "dashServer" do |ds|
        ds.vm.box = "ubuntu/xenial64"
        ds.vm.hostname = "dashServer"
        ds.vm.network "private_network", ip: "192.168.50.50",mac: "080027000000",
            virtualbox__intnet: "dash-S1"
        ds.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 1
        end
        ds.vm.provision "ansible" do |ansible| 
            ansible.playbook = "host-setup/dashServer/dashServer-playbook.yml"
        end
    end
    
    config.vm.define "bmv2" do |bmv2|
        bmv2.vm.box = "leandrocdealmeida/bmv2-p4"
        bmv2.vm.hostname = "bmv2"
        bmv2.vm.network "private_network", ip: "192.168.56.201",
            name: "vboxnet0"
        bmv2.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "dash-S1"
        bmv2.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S1-client"
        bmv2.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 4
            v.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
            v.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
        end
        bmv2.vm.provision "ansible" do |ansible| 
            ansible.playbook = "switch-setup/bmv2/bmv2-playbook.yml"
        end
    end
    

    config.vm.define "clientVlc1" do |cvlc|
        cvlc.vm.box = "leandrocdealmeida/ubuntu-vlc"
        cvlc.vm.hostname = "clientVlc"
        cvlc.vm.network "private_network", ip: "192.168.50.51", mac: "080027000001",
            virtualbox__intnet: "S1-client"
        cvlc.vm.provider "virtualbox" do |v|
            v.memory = 4096
            v.cpus = 4
            v.customize ["modifyvm", :id, "--vrde", "on"]
            v.customize ["modifyvm", :id, "--vrdeport", "19101"]
        end
        cvlc.vm.provision "ansible" do |ansible| 
            ansible.playbook = "host-setup/clientVlc/clientVlc-playbook.yml"
        end
    end
end
