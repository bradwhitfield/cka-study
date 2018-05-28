Vagrant.configure("2") do |config|
  config.vm.box = "kmm/ubuntu-xenial64"
  config.vm.network "public_network", bridge: "External"
  config.vm.hostname = "cka"

  config.vm.provider "hyperv" do |h|
    h.vmname = "cka"
    h.cpus = 4
    h.memory = 8192
    h.maxmemory = 8192

    h.enable_virtualization_extensions = true
    h.differencing_disk = true
    h.auto_start_action = "Nothing"
  end
end