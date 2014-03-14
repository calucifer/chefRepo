#
# Cookbook Name:: 	
# Recipe:: default
#
# Copyright 2014, Aol
#

sysProps = data_bag_item('system_properties', "#{node.platform_family}")
tomcat_settings = data_bag_item('applications', 'tomcat')
catalina_home = tomcat_settings[node.chef_environment]['catalina_home']
catalina_base = tomcat_settings[node.chef_environment]['catalina_base']

if platform_family?("rhel")
	tomcat_install 		= node['tomcat']['hcmbcs']['tomcat_install']
	
	tomcat_build 		= node['tomcat']['hcmbcs']['build']
	tomcat_package 		= node['tomcat']['hcmbcs']['package']
	tomcat_release 		= node['tomcat']['hcmbcs']['release']
	tomcat_lifecycle	= node['tomcat']['hcmbcs']['lifecycle']
		
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
	
	
end
