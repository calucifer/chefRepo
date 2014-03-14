#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2014, Aol
#

sysProps = data_bag_item('system_properties', "#{node.platform_family}")
tomcat_env = "#{sysProps[node.chef_environment]["profile.d"]}/tomcat_env.sh"

tomcat_settings = data_bag_item('applications', 'tomcat')
catalina_home = tomcat_settings[node.chef_environment]["catalina_home"]
catalina_base = tomcat_settings[node.chef_environment]["catalina_base"]

if platform_family?("rhel")
	include_recipe "tomcat::tomcat_hcmbcs_install"
end
                               
file tomcat_env do
  content "export CATALINA_HOME=#{catalina_home}\nexport CATALINA_BASE=#{catalina_base}\n"
  mode "0755"
  action :create_if_missing
end

include_recipe "tomcat::tomcat_create_instances"
