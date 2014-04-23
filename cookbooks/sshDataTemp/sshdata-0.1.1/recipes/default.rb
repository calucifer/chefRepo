#
# Cookbook Name:: sshdata
# Recipe:: default
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#
sshdir = node['sshdata']['ssh_dir']

available_ssh_overrides = %w{
  jenkins-build-slave-ssh
}

directory "#{sshdir}" do
  owner "dmps"
  group "aolusers"
  mode 00755
  action :create
end


# re-create/ reset on each run
cookbook_file "#{sshdir}/config" do
  source "ssh_config"
  mode 0644
  owner "dmps"
  group "aolusers"
  action :create
end

# re-create/ reset on each run
cookbook_file "#{sshdir}/authorized_keys" do
  source "authorized_keys"
  mode 0644
  owner "dmps"
  group "aolusers"
  action :create
end

node['roles'].each do |role|
  config = "#{role}-ssh"
  if available_ssh_overrides.include?(config)
    include_recipe "sshdata::#{config}"
  end
end