#
# Cookbook Name:: robot_framework
# Recipe:: install_python_robot_framework
#
# Copyright 2014, Aol
#

users_bag 	= data_bag_item('users', "jenkins_user")

user_name	= users_bag[node.chef_environment]["name"]
user_group 	= users_bag[node.chef_environment]["gid"]
user_home 	= users_bag[node.chef_environment]["home"] 

tools_dir	= "#{user_home}/tools"

virtFolder	= node['robotframework']['python']['virtualenv']['folder']

virtual_env_dir = "#{tools_dir}/#{virtFolder}" 


env = ({
        "PATH" => "#{node['python']['home']}/bin/:$PATH",
        "#{node['robotframework']['python']['env']['version']['var']}" => "#{node['robotframework']['python']['env']['version']['value']}"
      })

unless File.exists?("#{virtual_env_dir}")
	cookbook_file "#{Chef::Config[:file_cache_path]}/#{virtFolder}.tar.gz" do
	  mode "0644"
	end
	
	execute "tar zxf #{Chef::Config[:file_cache_path]}/#{virtFolder}.tar.gz" do
		cwd 	"#{tools_dir}"
		user	"#{user_name}"
		group	"#{user_group}"
	end	
end

