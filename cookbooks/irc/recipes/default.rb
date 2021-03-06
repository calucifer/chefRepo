#
# Cookbook Name:: irc
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user 'tdi' do
  action :create
  comment "Test Driven Infrastructure"
  home "/home/tdi"
  manage_home true
end#

package 'irssi' do
	action :install
end

directory '.tdi' do
	action 	:create
	owner	"tdi"
	group 	"tdi"
	mode 	0744
end

cookbook_file 	"irssi_conf" do
	path 	".irssi/config"
	owner	"tdi"
end
