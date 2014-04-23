#
# Cookbook Name:: 	
# Recipe:: tomcat_hcmbcs_install
#
# Copyright 2014, Aol
#

tomcat_build 		= node['tomcat'][node.platform_family][node.chef_environment]['install']['build']
tomcat_package		= "#{node['tomcat'][node.platform_family][node.chef_environment]['install']['package']}#{node['tomcat'][node.platform_family][node.chef_environment]['install']['version']}"
tomcat_release 		= node['tomcat'][node.platform_family][node.chef_environment]['install']['release']
tomcat_lifecycle	= node['tomcat'][node.platform_family][node.chef_environment]['install']['lifecycle']

tomcat_install 		= node['tomcat'][node.platform_family][node.chef_environment]['install']['tomcat_install']
catalina_home 		= node['tomcat'][node.platform_family][node.chef_environment]['catalina_home']

hcmbcs tomcat_package do
	package tomcat_package
	build tomcat_build
	release tomcat_release
	lifecycle tomcat_lifecycle
	action :install
end
	
link "#{catalina_home}" do
  target_file "#{catalina_home}"
  to "#{tomcat_install}"
end
	
bash "chown_files" do
	code <<-EOH
		chmod -R go+r  "#{catalina_home}"
		chmod go-r "#{catalina_home}/conf/tomcat-users.xml"
	EOH
end
