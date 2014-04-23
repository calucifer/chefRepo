#
# Cookbook Name:: jdk
# Recipe:: jdk-hcmbcs
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#
system_bag	 	= data_bag_item('system_properties', node["platform_family"])
profile_dir 	= system_bag[node.chef_environment]['profile.d']

py_build = node['python']['hcmbcs']['build']
py_package = node['python']['hcmbcs']['package']
py_release = node['python']['hcmbcs']['release']
py_lifecycle = node['python']['hcmbcs']['lifecycle']
py_profile = "#{profile_dir}/python.sh"
py_home = node['python']['home']

hcmbcs py_package do
  package py_package
  build py_build
  release py_release
  lifecycle py_lifecycle
  action :install
end

file py_profile do
  content "export PY_HOME=#{py_home}\nexport PATH=${PY_HOME}/bin:${PATH}\n"
  mode "0755"
  action :create_if_missing
end
