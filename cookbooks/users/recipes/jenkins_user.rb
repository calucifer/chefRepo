#
# Cookbook Name:: jenkins_user
# Recipe:: jenkins_user
#
# Copyright 2014, Aol
#

jenkinsUser = data_bag_item('users', 'jenkins_user')
jenkinsUserPasswd = Chef::EncryptedDataBagItem.load('encrypted_passwords', 'jenkins_user')


user_name	= jenkinsUser[node.chef_environment]["name"]
user_group	= jenkinsUser[node.chef_environment]["gid"] 
user_home	= jenkinsUser[node.chef_environment]["home"]

user_bin	= "#{user_home}/bin"
tool_home	= "#{user_home}/tools"
selenium_home	="#{tool_home}/seleniumGrid"
jenkins_home	= "#{user_home}/jenkins"
atp_components_dir = "#{jenkins_home}/components"
jenkins_cicd_home  = "#{atp_components_dir}/jenkins_cicd"
	
gem_package "ruby-shadow" do
  action :install
end

user "#{user_name}" do
	action 		:create
	home 		"#{user_home}"
	gid		"#{user_group}"
	password	jenkinsUserPasswd[node.chef_environment]["password"]
	comment 	jenkinsUser[node.chef_environment]["comment"] 
	shell		jenkinsUser[node.chef_environment]["shell"] 
	manage_home true
end

directory "#{user_bin}" do
	owner	"#{user_name}"
	group	"#{user_group}"
  	mode 	0775
	action	:create
end

directory "#{tool_home}" do
	owner	"#{user_name}"
	group	"#{user_group}"
  	mode 	0775
	action	:create
end
# add and configure the selenium grid server
directory "#{selenium_home}" do
	owner	"#{user_name}"
	group	"#{user_group}"
  	mode 	0775
	action	:create
end

#

directory "#{atp_components_dir}" do
	owner	"#{user_name}"
	group	"#{user_group}"
  	mode 	0775
	action	:create
end



include_recipe "users::jenkins_user_ssh_config"

		
