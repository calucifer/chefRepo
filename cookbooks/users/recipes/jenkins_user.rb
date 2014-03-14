#
# Cookbook Name:: jenkins_user
# Recipe:: jenkins_user
#
# Copyright 2014, Aol
#

jenkinsUser = data_bag_item('users', 'jenkins_user')
jenkinsUserPasswd = Chef::EncryptedDataBagItem.load('encrypted_passwords', 'jenkins_user')
jenkinsGroup = data_bag_item('groups', 'jenkins_group')

gem_package "ruby-shadow" do
  action :install
end

group jenkinsGroup[node.chef_environment]["name"] do
	action 		:create
end

user jenkinsUser[node.chef_environment]["name"] do
	action 		:create
	comment 	jenkinsUser[node.chef_environment]["comment"] 
	home 		jenkinsUser[node.chef_environment]["home"] 
	password	jenkinsUserPasswd[node.chef_environment]["password"]
	gid			jenkinsUser[node.chef_environment]["gid"] 
	shell		jenkinsUser[node.chef_environment]["shell"] 
	manage_home true
end
