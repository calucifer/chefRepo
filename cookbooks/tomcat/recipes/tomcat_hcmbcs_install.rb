#
# Cookbook Name:: 	
# Recipe:: tomcat_hcmbcs_install
#
# Copyright 2014, Aol
#

tomcat_build 	= node['tomcat']['rhel']['install']['build']
tomcat_package	= node['tomcat']['rhel']['install']['package']
tomcat_release 	= node['tomcat']['rhel']['install']['release']
tomcat_lifecycle	= node['tomcat']['rhel']['install']['lifecycle']

tomcat_install 	= node['tomcat']['rhel']['install']['tomcat_install']
catalina_home 	= node['tomcat']['rhel']['cicd']['catalina_home']

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
