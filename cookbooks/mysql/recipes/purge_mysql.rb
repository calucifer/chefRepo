#
# Cookbook Name:: mysql
# Recipe:: purge_mysql
#
# Copyright 2014, Aol
#

package "#{node['mysql']['package']}" do
	action	:purge
end

