#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2014, Aol
#

users_bag 			= data_bag_item('users', "jenkins_user")
user_name			= users_bag[node.chef_environment]["name"]
user_group 			= users_bag[node.chef_environment]["gid"]
user_home 			= users_bag[node.chef_environment]["home"] 
tool_home			= node['jenkins']['tools']['home']

if platform_family?("rhel")
	include_recipe "tomcat::tomcat_hcmbcs_install"
	include_recipe "tomcat::tomcat_create_instances"
elsif platform_family?("debian")
	include_recipe "tomcat::tomcat_dpkg_install"
end

Chef::Log.info("*************************************************************") 
Chef::Log.info("#{node['jdk']['java_home']}")
Chef::Log.info("*************************************************************")



