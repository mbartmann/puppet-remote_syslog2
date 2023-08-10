# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v|
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant-root", "1"]
  end

  # https://github.com/joebew42/diaspora-replica/issues/10
  if Vagrant.has_plugin?('vagrant-puppet-install')
    config.puppet_install.puppet_version = '4.10.12'
  end

  config.vm.box = "puppetlabs/ubuntu-18.04-64-puppet"

  config.vm.synced_folder "./", "/etc/puppet/modules/remote_syslog2"

  config.librarian_puppet.puppetfile_dir = "puppet"
  config.librarian_puppet.placeholder_filename = ".keep"

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "spec/fixtures/manifests/"
    puppet.manifest_file  = "site.pp"
    puppet.module_path = "modules"
    puppet.hiera_config_path = "spec/fixtures/puppet/hiera.yaml"
    # puppet.options = "--verbose --debug"
  end

  # Fix "stdin: is not a tty" message
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
end
