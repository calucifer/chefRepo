#
# Cookbook Name:: mysql
# Recipe:: mysql_dev
#
# Copyright 2014, Aol
#

if platform_family?("rhel")
	yum_package "#{node['mysql']['dev']}" do
		action	:install
	end
end

