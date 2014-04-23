#
# Cookbook Name:: activemq
# Recipe:: default
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'jdk::default'

users_bag 			= data_bag_item('users', "jenkins_user")

user_name			= users_bag[node.chef_environment]["name"]
user_group 			= users_bag[node.chef_environment]["gid"]
user_home 			= users_bag[node.chef_environment]["home"] 

tmp = Chef::Config[:file_cache_path]
version = node['activemq']['version']
mirror = node['activemq']['mirror']
activemq_home = "#{user_home}/tools/#{node['activemq']['home']}/apache-activemq-#{version}"

directory "#{user_home}/tools/#{node['activemq']['home']}" do
	recursive true
	owner	"#{user_name}"
	group	"#{user_group}"
	action :create
end

unless File.exists?("#{activemq_home}/bin/activemq")
	cookbook_file "apache-activemq-#{version}-bin.tar.gz" do
		path	"#{user_home}/tools/#{node['activemq']['home']}/apache-activemq-#{version}-bin.tar.gz" 
		action	:create
		owner	"#{user_name}"
		group	"#{user_group}"
		mode	'0655'
	end
  execute "tar zxf #{user_home}/tools/#{node['activemq']['home']}/apache-activemq-#{version}-bin.tar.gz" do
    	cwd "#{user_home}/tools/#{node['activemq']['home']}"
    	user		"#{user_name}"
	group		"#{user_group}"
  end
end

cookbook_file "dot_activemqrc" do
	path	"#{user_home}/.activemqrc"
	owner	"#{user_name}"
	group	"#{user_group}"
	mode	'0644'
end

file "#{activemq_home}/bin/activemq" do
  	owner	"#{user_name}"
  	group	"#{user_group}"
  	mode  '0755'
end

# TODO: make this more robust
arch = node['kernel']['machine'] == 'x86_64' ? 'x86-64' : 'x86-32'

template "#{activemq_home}/conf/activemq.xml" do
	source   'activemq.xml.erb'
	mode     '0755'
	owner	"#{user_name}"
  	group	"#{user_group}"
end

template "#{user_home}/bin/startActiveMQ.sh" do
	source   "startActiveMQ.sh.erb"
	mode     '0755'
	owner	"#{user_name}"
  	group	"#{user_group}"
	variables(
		{
			:jdk_env_settings	=> node['jdk']['profile'],
			:activemq_executable	=> "#{activemq_home}/bin/linux-#{arch}/activemq"	
		}
	)
	action	:create
end



# symlink so the default wrapper.conf can find the native wrapper library
link "#{activemq_home}/bin/linux" do
  to "#{activemq_home}/bin/linux-#{arch}"
end

# symlink the wrapper's pidfile location into /var/run
link '/var/run/activemq.pid' do
  to "#{activemq_home}/bin/linux/ActiveMQ.pid"
  not_if 'test -f /var/run/activemq.pid'
end

template "#{activemq_home}/bin/linux/wrapper.conf" do
  source   'wrapper.conf.erb'
  mode     '0644'
end

