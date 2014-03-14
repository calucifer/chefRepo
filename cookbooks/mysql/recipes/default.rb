#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2014, Aol
#

if platform_family?("rhel")
	package "#{node['mysql']['package']}" do
		action	:install
	end
	service "#{node['mysql']['service']}" do
		action	[ :enable, :start ]
	end
end
if platform_family?("debian")
    package "#{node['mysql']['package']}" do
	  	action 	:install
	end

end


	
#execute "SetRootPasswd" do
#	command	"#{node['mysql']['root_passwd_cmd']} \'#{node['mysql']['root_password']}\'"
#	action	:run
#end
