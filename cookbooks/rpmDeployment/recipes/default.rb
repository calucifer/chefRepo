#
# Cookbook Name:: rpmDeployment
# Recipe:: default
#
# Copyright 2014, Aol
#


yum_package "#{node['rpmDeployment']['builder']}" do
	action	:install
end

yum_package "#{node['rpmDeployment']['cads']}" do
	action	:install
end
