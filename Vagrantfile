# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.ssh.username   = 'root'
  config.ssh.password   = 'root'

  config.vm.provider "docker" do |d|
    d.build_dir       = "."
    d.has_ssh         = true
    d.remains_running = true
  end

  config.vm.hostname = "dotfiles-test"

  config.vm.provision :ansible_local do |ansible|
    ansible.playbook   = "machine.yml"
    ansible.extra_vars = {
      settings_file: 'settings/test.yml'
    }
  end

end
