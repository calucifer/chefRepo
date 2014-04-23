#
# Cookbook Name:: sonar
# Recipe:: default
#
# Copyright 2014, Aol
#
bag_jenkins_user	= data_bag_item('users', 'jenkins_user')

jenkins_user		= bag_jenkins_user[node.chef_environment]['name']
jenkinsUserHome		= bag_jenkins_user[node.chef_environment]['home']
jenkinsUserGroup	= bag_jenkins_user[node.chef_environment]['gid']

sonar_version 		= node['sonar'][node.chef_environment]['version']
sonar_install_to_dir	= node['sonar'][node.chef_environment]['install_dir']
sonar_link_name		= node['sonar'][node.chef_environment]['symlink']


sonar_zip_file		= "sonar-#{sonar_version}.tar.gz"



cookbook_file "#{sonar_zip_file}" do
	path	"/tmp/#{sonar_zip_file}"
	action	:create
	mode	'0664'
	owner	"#{jenkins_user}"
	group	"#{jenkinsUserGroup}"
end

directory "#{jenkinsUserHome}/#{sonar_install_to_dir}" do
	action	:create
	mode	'0775'
	owner	"#{jenkins_user}"
	group	"#{jenkinsUserGroup}"
end

execute "sonar_extract" do
	command	"tar zxf /tmp/#{sonar_zip_file}"
	cwd	"#{jenkinsUserHome}/#{sonar_install_to_dir}" 
	user	"#{jenkins_user}"
	group	"#{jenkinsUserGroup}"
end

link "#{jenkinsUserHome}/#{sonar_install_to_dir}/#{sonar_link_name}" do
	action	:create
	to 	"#{jenkinsUserHome}/#{sonar_install_to_dir}/sonar-#{sonar_version}"
	owner	"#{jenkins_user}"
	group	"#{jenkinsUserGroup}"
end

# startup file
file "#{jenkinsUserHome}/bin/startSonar.sh" do
	content	"source #{node['jdk']['profile']}\n#{jenkinsUserHome}/#{sonar_install_to_dir}/#{sonar_link_name}/bin/linux-x86-64/sonar.sh start &"
	owner 	"#{bag_jenkins_user[node.chef_environment]['name']}"
	group 	"#{bag_jenkins_user[node.chef_environment]['gid']}"
	mode 	00755
	action :create
end
	
include_recipe "sonar::create_sonar_db"
	
