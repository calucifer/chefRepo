#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2014, Aol
#

gem_package "ruby-shadow" do
  action :install
end

include_recipe "users::jenkins_user"


if node.chef_environment == "cicd" then 
	include_recipe "users::ssatelle"
end
	
