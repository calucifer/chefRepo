#
# Cookbook Name:: jdk
# Recipe:: default
#
# Copyright 2014, AOL
#                                                               
# All rights reserved - Do Not Redistribute
#

if platform_family?("rhel")
    include_recipe "jdk::jdk-#{node['jdk']['hcmbcs']['aol']}"
end
if platform_family?("debian")
	include_recipe "jdk::jdk-#{node['jdk']['dpkg']}"
end
