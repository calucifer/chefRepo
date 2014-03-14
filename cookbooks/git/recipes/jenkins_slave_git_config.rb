#
# Cookbook Name:: git
# Recipe:: jenkins_slave_git_config
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
bag_jenkins_user	= data_bag_item('users', 'jenkins_user')
jenkins_user		= bag_jenkins_user[node.chef_environment]['name']
jenkinsUserHome		= bag_jenkins_user[node.chef_environment]['home']
jenkinsUserGroup	= bag_jenkins_user[node.chef_environment]['gid']

cookbook_file "gitconfig" do
	path	"#{jenkinsUserHome}/#{node['git']['config']['file']}" 
	action	:create
	mode	'0664'
	owner	"#{jenkins_user}"
	group	"#{jenkinsUserGroup}"
end



	
	
