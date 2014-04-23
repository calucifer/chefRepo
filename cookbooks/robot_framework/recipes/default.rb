#
# Cookbook Name:: robot_framework
# Recipe:: default
#
# Copyright 2014, Aol
#
system_bag	 	= data_bag_item('system_properties', node["platform_family"])
profile_dir 		= system_bag[node.chef_environment]['profile.d']
users_bag 		= data_bag_item('users', "jenkins_user")

user_name		= users_bag[node.chef_environment]["name"]
user_group 		= users_bag[node.chef_environment]["gid"]
user_home 		= users_bag[node.chef_environment]["home"] 

py_env_32bit_var	= node['robotframework']['python']['env']['version']['var']
py_env_32bit_value 	= node['robotframework']['python']['env']['version']['value']
py_interpreter 		= node['robotframework']['python']['env']['interpeter']
py_virt_location 	= node['robotframework']['python']['virtualenv']['folder']
py_virt_env		= "#{user_home}/tools/#{py_virt_location}"

include_recipe "build-essential"
include_recipe "python"
include_recipe "python::pip"
include_recipe "python::virtualenv"



file "#{profile_dir}/py_robot_env.sh" do
  content "export #{py_env_32bit_var}=#{py_env_32bit_value}\nexport ROBOT_FRAMEWORK_VM=#{py_virt_env}\n"
  mode "0755"
  action :create_if_missing
end

include_recipe "robot_framework::install_python_robot_framework"
include_recipe "robot_framework::install_cx_oracle"
