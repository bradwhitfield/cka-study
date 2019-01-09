Vagrant.configure("2") do |config|
  config.vm.box = "kmm/ubuntu-xenial64"
  config.vm.network "public_network", bridge: "External"
  config.vm.hostname = "k8s-master"

  config.vm.provider "hyperv" do |h|
    h.vmname = "cka-single-node-k8s"
    h.cpus = 4
    h.memory = 8192
    h.maxmemory = 8192

    h.enable_virtualization_extensions = true
    h.linked_clone = true
    h.auto_start_action = "Nothing"
  end

  config.vm.provision "shell", inline: <<-SHELL
    swapoff -a
    sed -i '$d' /etc/fstab
    systemctl mask dev-sda3.swap
  SHELL

  config.vm.provision :reload

  config.vm.provision "shell", path: "cluster/templates/master.tpl"
end