#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2014, Aol
#

gperftools_package	= "#{node['rpm']['gperftools']['package']}"
gperftools_arch 		= "#{node['rpm']['gperftools']['arch']}"
redis_package 		= "#{node['rpm']['redis']['package']}-#{node['rpm']['redis']['version']}.#{node['rpm']['redis']['arch']}.#{node['rpm']['filetype']}"

yum_package "#{gperftools_package}" do
	package_name	"#{gperftools_package}"	
	arch			"#{gperftools_arch}"
	action			:install
end

cookbook_file "#{redis_package}" do
	path		"/tmp/#{redis_package}"
	action		:create
	mode		'0664'
end
package "#{redis_package}" do
	source	"/tmp/#{redis_package}"
	provider	Chef::Provider::Package::Rpm
	action	:install
end

hcmbcs "redis_conf_package" do
	package 	"#{node['hcmbcs']['redis']['package']}"
	build 		"#{node['hcmbcs']['redis']['build']}"
	release 		"#{node['hcmbcs']['redis']['release']}"
	repository	"#{node['hcmbcs']['redis']['repository']}"
	action :install
end

include_recipe "redis::redis_conf"
