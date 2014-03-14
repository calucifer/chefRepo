#
# Cookbook Name:: package_management
# Recipe:: default
#
# Copyright 2014, Aol
#

if platform_family?("rhel")
	system_properties = data_bag_item('system_properties', "#{node['platform_family']}")
	yum_repo_folder = "#{system_properties[node.chef_environment]["pm_folder"]}"
	
	cookbook_file "#{yum_repo_folder}/CentOS-Base.repo" do
		source 'CentOS-Base.repo'
		mode "0644"
		:create
	end
	
	cookbook_file "#{yum_repo_folder}/chef.repo" do
		source 'chef.repo'
		mode "0644"
		:create
	end
	
	cookbook_file "#{yum_repo_folder}/epel.repo" do
		source 'epel.repo'
		mode "0644"
		:create
	end
end
