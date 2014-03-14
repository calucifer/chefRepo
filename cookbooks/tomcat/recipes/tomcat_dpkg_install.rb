#
# Cookbook Name:: 	
# Recipe:: tomcat_dpkg_install
#
# Copyright 2014, Aol
#
package_name =	"#{node['tomcat']['rhel']['install']['package']}#{node['tomcat']['rhel']['install']['version']}"

package 'tomcat7' do
	action	:install
end
