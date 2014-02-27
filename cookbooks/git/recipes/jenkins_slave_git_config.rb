#
# Cookbook Name:: git
# Recipe:: jenkins_slave_git_config
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute

jenkinsUser 	= Chef::EncryptedDataBagItem.load('users', 'jenkins_user')
jenkinsGroup	= Chef::EncryptedDataBagItem.load('groups', 'jenkins_group')

cookbook_file "gitconfig" do
	path	"#{jenkinsUser[node.chef_environment]["home"]}/#{node['git']['config']['file']}" 
	action	:create
	mode	'0664'
	owner	jenkinsUser[node.chef_environment]["name"]
	group	jenkinsUser[node.chef_environment]["gid"]
end
