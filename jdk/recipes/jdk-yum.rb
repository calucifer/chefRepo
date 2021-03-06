#
# Cookbook Name:: jdk
# Recipe:: default
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#



package 'jdk' do
  action :install
end

ruby_block "publish-jdk-version" do
  block do
    node.default['jdk']['version'] = `yum info jdk | grep "^Version" | cut -d':' -f2`
  end
  action :create
end

java_home = node['jdk']['rhel']['java_home']
java_profile = node['jdk']['profile']

file java_profile do
  content "export JAVA_HOME=#{java_home}/"
  mode "0755"
  action :create_if_missing
end