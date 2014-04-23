#
# Cookbook Name:: robot_framework
# Recipe:: install_cx_oracle
#
# Copyright 2014, Aol
#

system_bag	 	= data_bag_item('system_properties', node["platform_family"])
profile_dir 		= system_bag[node.chef_environment]['profile.d']
users_bag 		= data_bag_item('users', "jenkins_user")
user_name		= users_bag[node.chef_environment]["name"]
user_group 		= users_bag[node.chef_environment]["gid"]
user_home 		= users_bag[node.chef_environment]["home"] 

oracle_home		= node['robotframework']['oracle']['home']
ld_lib_path		= node['robotframework']['oracle']['ld_library_path']	
cx_package		= "#{node['robotframework']['cxOracle']['library']['name']}-#{node['robotframework']['cxOracle']['library']['version']}"
virtFolder		= node['robotframework']['python']['virtualenv']['folder']
py_virt_env		= "#{user_home}/tools/#{virtFolder}"

env = ({
        "#{node['robotframework']['python']['env']['version']['var']}" => "#{node['robotframework']['python']['env']['version']['value']}",
        "ORACLE_HOME" => "#{oracle_home}",
        "LD_LIBRARY_PATH" => "#{ld_lib_path}"
      })

["basic", "devel"].each do |package|
	rpmFile = "#{Chef::Config[:file_cache_path]}/#{node['robotframework']['instantclient']['package']}-#{package}-#{node['robotframework']['instantclient']['version']}.#{node['robotframework']['instantclient']['arch']}.rpm"
	cookbook_file "#{rpmFile}" do
	  mode "0644"
	end	
	
	package "oracle_client" do
		source		"#{rpmFile}"
		provider	Chef::Provider::Package::Rpm
		action		:install
	end
end

file "#{profile_dir}/oracle.sh" do
  content "export ORACLE_HOME=#{oracle_home}\nexport LD_LIBRARY_PATH=#{ld_lib_path}\n"
  mode "0755"
  action :create_if_missing
end

cookbook_file "#{Chef::Config[:file_cache_path]}/#{cx_package}.tar.gz" do
  mode "0644"
end	

execute "tar zxf #{Chef::Config[:file_cache_path]}/#{cx_package}.tar.gz" do
	cwd "/tmp"
end

execute "install-cx-Oracle" do
  cwd "/tmp/#{cx_package}"
  environment env
  command <<-EOF
  echo $PWD
  source "#{py_virt_env}/bin/activate"
  python setup.py install
  EOF
end

cookbook_file "connection_manager.py" do
	path	"#{py_virt_env}/lib/python2.7/site-packages/DatabaseLibrary/connection_manager.py"
	source	"connection_manager.py"
	mode	0644
end;