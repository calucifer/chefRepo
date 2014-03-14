#
# Cookbook Name:: ssatelle
# Recipe:: jenkins_user
#
# Copyright 2014, Aol
#

vmUser = data_bag_item('users', 'ssatelle')
vmUserPasswd = Chef::EncryptedDataBagItem.load('encrypted_passwords', 'ssatelle')
jenkinsGroup = data_bag_item('groups', 'aolusers')

gem_package "ruby-shadow" do
  action :install
end

group jenkinsGroup[node.chef_environment]["name"] do
	action 		:create
end

user vmUser[node.chef_environment]["name"] do
	action 		:create
	comment 	vmUser[node.chef_environment]["comment"] 
	home 		vmUser[node.chef_environment]["home"] 
	password	vmUserPasswd[node.chef_environment]["password"]
	gid			vmUser[node.chef_environment]["gid"] 
	shell		vmUser[node.chef_environment]["shell"] 
	manage_home true
end

vmUserSSHKeys			= Chef::EncryptedDataBagItem.load('ssh_keys', 'ssatelle')
jenkinsSlaveSSHKeys 		= Chef::EncryptedDataBagItem.load('ssh_keys', 'jenkins_slave_ssh_keys')
jenkinsStashSSHKeys 		= Chef::EncryptedDataBagItem.load('ssh_keys', 'jenkins_stash_ssh_keys')
jenkinsMasterSSHKeys 	= Chef::EncryptedDataBagItem.load('ssh_keys', 'jenkins_master_ssh_keys')

home_folder 				= vmUser[node.chef_environment]["home"]
owner 					= vmUser[node.chef_environment]["name"]
group 					= vmUser[node.chef_environment]["gid"]
ssh_folder 				= "#{home_folder}/.ssh"



directory "#{ssh_folder}" do
	:create
	owner	owner
	group	group
	mode 	"0700"
end

cookbook_file "#{ssh_folder}/config" do
	source	"stash_ssh_config"
	owner	owner
	group	group
	mode "0644"
	:create
end

file "#{ssh_folder}/id_rsa_jenkinsSlave" do
	path "#{ssh_folder}/id_rsa_jenkinsSlave"
	content jenkinsSlaveSSHKeys[node.chef_environment]["priv_key"]
	owner	owner
	group	group
	mode "0600"
	action :create
end

file "#{ssh_folder}/id_rsa_jenkinsSlave.pub" do
	path "#{ssh_folder}/id_rsa_jenkinsSlave.pub"
	content jenkinsSlaveSSHKeys[node.chef_environment]["pub_key"]
	owner	owner
	group	group
	mode "0644"
	action :create
end

file "#{ssh_folder}/id_rsa_stash" do
	path "#{ssh_folder}/id_rsa_stash"
	content jenkinsStashSSHKeys[node.chef_environment]["priv_key"]
	owner	owner
	group	group
	mode "0600"
	action :create
end

file "#{ssh_folder}/id_rsa_stash.pub" do
	path "#{ssh_folder}/id_rsa_stash.pub"
	content jenkinsStashSSHKeys[node.chef_environment]["pub_key"]
	owner	owner
	group	group
	mode "0644"
	action :create
end

file "#{ssh_folder}/authorized_keys" do
	path "#{ssh_folder}/authorized_keys"
	content "#{jenkinsMasterSSHKeys[node.chef_environment]["pub_key"]}\n#{vmUserSSHKeys[node.chef_environment]["pub_key"]}"
	owner	owner
	group	group
	mode "0600"
	action :create_if_missing
end
