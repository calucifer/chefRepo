#
# Cookbook Name:: stevens_vms
# Recipe:: default
#
# Copyright 2014, Aol
#

package "aptitude" do
	package_name case node['platform_family']
	when 'debian'
		'aptitude'
	end
end	

