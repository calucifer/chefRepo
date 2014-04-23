#
# Cookbook Name:: memBase
# Recipe:: default
#
# Copyright 2014, Aol
#

# copy the rpm locally
membase_package_file = "#{node['membase']['package']}_#{node['membase']['arch']}_#{node['membase']['version']}.#{node['membase'][node.platform_family]}"
cookbook_file "#{membase_package_file}" do
	path		"/tmp/#{membase_package_file}"
	action		:create
	mode		'0664'
end

# dependancy for membase package
package "#{node['membase']['dependancy']['package']}" do
	action	:install
end

# install my local rpm
package "#{membase_package_file}" do
	source	"/tmp/#{membase_package_file}"
	provider	Chef::Provider::Package::Rpm
	action	:install
end

# now stop the membase process
service "#{node['membase']['service']}" do
	action	:stop
end

# copy my config file in, replacing the existing one
cookbook_file "#{node['membase']['config']['file']}" do
	path		"#{node['membase']['config']['location']}"
	action		:create
	mode		'0664'
end

# enable the service at boot
service "#{node['membase']['service']}" do
	action	:enable
end
# and restart the service
service "#{node['membase']['service']}" do
	action	:start
end

# finally a quick config command
execute "#{node['membase']['extraCommand']}" do
	action	:run
end


