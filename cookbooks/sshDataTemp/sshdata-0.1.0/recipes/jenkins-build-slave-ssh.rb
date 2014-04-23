#
# Cookbook Name:: sshdata
# Recipe:: jenkins-build-slave-ssh.rb
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#


#
# Cookbook Name:: jenkins_user
# Recipe:: jenkins_user_ssh_config
#
# Copyright 2014, Aol
#

jenkinsUser 			= Chef::EncryptedDataBagItem.load('users', 'jenkins_user')
jenkinsSlaveSSHKeys 	= Chef::EncryptedDataBagItem.load('ssh_keys', 'jenkins_slave_ssh_keys')
jenkinsStashSSHKeys 	= Chef::EncryptedDataBagItem.load('ssh_keys', 'jenkins_stash_ssh_keys')
jenkinsTargetingSSHKeys	= Chef::EncryptedDataBagItem.load('ssh_keys', 'targeting-jenkins_ssh_keys')

home_folder 			= '/home/jkin_atp'
owner 					= 'jkin_atp'
group 					= 'jkin_atp'
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

file "#{ssh_folder}/id_rsa" do
	path "#{ssh_folder}/id_rsa"
	content jenkinsSlaveSSHKeys[node.chef_environment]["priv_key"]
	owner	owner
	group	group
	mode "0600"
	action :create
end

file "#{ssh_folder}/id_rsa.pub" do
	path "#{ssh_folder}/id_rsa.pub"
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
	content "#{jenkinsTargetingSSHKeys[node.chef_environment]["pub_key"]}"
	owner	owner
	group	group
	mode "0600"
	action :create_if_missing
end
