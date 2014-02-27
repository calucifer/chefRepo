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
include_recipe "users::jenkins_user_ssh_config"


