#
# Cookbook Name:: maven
# Recipe:: maven_env
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#

maven_home = node['maven']['home']
maven_profile = node['maven']['profile']

file maven_profile do
  content "export MAVEN_HOME=#{maven_home}\nexport PATH=#{maven_home}/bin:$PATH\n"
  mode "0755"
  action :create_if_missing
end
