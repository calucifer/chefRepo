#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2014, Aol
#

sysProps = data_bag_item('system_properties', "#{node.platform_family}")
#tomcat_env = "#{sysProps[node.chef_environment]["profile.d"]}/tomcat_env.sh"

tomcat_settings = data_bag_item('applications', 'tomcat')
catalina_home 	= node['tomcat'][node.platform_family][node.chef_environment]['catalina_home']
Chef::Log.info("*************************************************************") 
Chef::Log.info("#{catalina_home}")
Chef::Log.info("*************************************************************")

if platform_family?("rhel")
	include_recipe "tomcat::tomcat_hcmbcs_install"
elsif platform_family?("debian")
	include_recipe "tomcat::tomcat_dpkg_install"
end

include_recipe "tomcat::tomcat_create_instances"

#file tomcat_env do
#  content "export CATALINA_HOME=#{[node.chef_environment]}\n"
#  mode "0755"
#  action :create_if_missing
#end


