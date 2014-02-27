#
# Cookbook Name:: sshdata
# Recipe:: jenkins-build-slave-ssh.rb
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#

sshdir = node['sshdata']['ssh_dir']

cookbook_file "#{sshdir}/id_rsa_ci-stash-dmps" do
  source "id_rsa_ci-stash-dmps"
  mode 0400
  owner "dmps"
  group "aolusers"
  action :create
end

cookbook_file "#{sshdir}/id_rsa_ci-stash-dmps.pub" do
  source "id_rsa_ci-stash-dmps.pub"
  mode 0644
  owner "dmps"
  group "aolusers"
  action :create
end

cookbook_file "#{sshdir}/dmps-jenkins.pub" do
  source "dmps-jenkins.pub"
  mode 0644
  owner "dmps"
  group "aolusers"
  action :create
end

cookbook_file "#{sshdir}/stash_config" do
  source "stash_config"
  mode 0644
  owner "dmps"
  group "aolusers"
  action :create
end

execute "add-jenkins-key-to-authorized-keys" do
  command "cd #{sshdir} && cat dmps-jenkins.pub >> authorized_keys && rm dmps-jenkins.pub"
end

execute "add-stash-config-to-ssh-config" do
  command "cd #{sshdir} && cat stash_config >> config && rm stash_config"
end
