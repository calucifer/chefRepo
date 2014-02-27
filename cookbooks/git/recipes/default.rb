#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#

package "git" do
	action :install
end



if platform_family?("rhel")
	ruby_block "publish-git-version" do
	  block do
		node.default['git']['version'] = `yum info git | grep "^Version" | cut -d':' -f2`
	  end
	  action :create
	end
end

