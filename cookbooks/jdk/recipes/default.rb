

#
# Cookbook Name:: jdk
# Recipe:: default
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#
if platform_family?("rhel")
	require 'hcmbcs', '>= 0.1.0'
    include_recipe "jdk::jdk-#{node['jdk']['rpm']}"
end
if platform_family?("debian")
	#require 'apt', '>= 0.1.0'
	include_recipe "jdk::jdk-#{node['jdk']['dpkg']}"
end
