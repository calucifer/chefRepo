#
# Cookbook Name:: vnc
# Recipe:: default
#
# Copyright 2014, Aol
#

package "tigervnc-server" do
	action	:install
end

jenkinsUser = data_bag_item('users', 'jenkins_user')
pkg_conf_dir = data_bag_item('system_properties', 'rhel')


template "#{pkg_conf_dir[node.chef_environment]["pkg_config_dir"]}/vncservers" do
	  source 'vncservers.erb'
	  variables(
		  {
					:vnc_user		=> jenkinsUser[node.chef_environment]["name"],
					:vnc_geometry	=> "1024x768"
		  }
	  )
end

directory "#{jenkinsUser[node.chef_environment]['home']}/.vnc" do
	owner	"#{jenkinsUser[node.chef_environment]['name']}"
	group	"#{jenkinsUser[node.chef_environment]['gid']}"
	action	:create
end

cookbook_file "passwd" do
	path 	"#{jenkinsUser[node.chef_environment]['home']}/.vnc/passwd"
	owner	"#{jenkinsUser[node.chef_environment]['name']}"
	group	"#{jenkinsUser[node.chef_environment]['gid']}"
	mode	"0600"
	action	:create
end
	
service "vncserver" do
	action	:enable
end

service "vncserver" do
	action	:start
end
