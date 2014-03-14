#
# Cookbook Name:: sonar
# Recipe:: default
#
# Copyright 2014, Aol
#
bag_jenkins_user	= data_bag_item('users', 'jenkins_user')
bag_sonar_settings	= data_bag_item('applications', 'sonar')

jenkins_user		= bag_jenkins_user[node.chef_environment]['name']
jenkinsUserHome		= bag_jenkins_user[node.chef_environment]['home']
jenkinsUserGroup	= bag_jenkins_user[node.chef_environment]['gid']

sonar_version 		= bag_sonar_settings[node.chef_environment]['version']
sonar_install_to_dir= bag_sonar_settings[node.chef_environment]['install_dir']
sonar_link_name		= bag_sonar_settings[node.chef_environment]['symlink']

sonar_zip_file		= "sonar-#{sonar_version}.tar.gz"


cookbook_file "#{sonar_zip_file}" do
	path		"/tmp/#{sonar_zip_file}"
	action		:create
	mode		'0664'
	owner		"#{jenkins_user}"
	group		"#{jenkinsUserGroup}"
end

execute "sonar_extract" do
	command		"tar zxf /tmp/#{sonar_zip_file}"
	cwd			"#{jenkinsUserHome}/#{sonar_install_to_dir}" 
	user		"#{jenkins_user}"
	group		"#{jenkinsUserGroup}"
end

link "#{jenkinsUserHome}/#{sonar_link_name}" do
	action		:create
	to 			"#{jenkinsUserHome}/#{sonar_install_to_dir}/sonar-#{sonar_version}"
	owner		"#{jenkins_user}"
	group		"#{jenkinsUserGroup}"
end
	
include_recipe "sonar::create_sonar_db"
	
