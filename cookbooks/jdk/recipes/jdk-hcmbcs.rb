#
# Cookbook Name:: jdk
# Recipe:: jdk-hcmbcs
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#
jdk_build = node['jdk']['hcmbcs']['build']
jdk_package = node['jdk']['hcmbcs']['package']
jdk_release = node['jdk']['hcmbcs']['release']
jdk_lifecycle = node['jdk']['hcmbcs']['lifecycle']
java_profile = node['jdk']['profile']
java_home = node['jdk']['java_home']
jdk_home = node['jdk']['hcmbcs']['java_home']

hcmbcs jdk_package do
  package jdk_package
  build jdk_build
  release jdk_release
  lifecycle jdk_lifecycle
  action :install
end

directory "/usr/java/" do
  owner "root"
  group "root"
  mode 	"0755"
  :create
end

link "#{java_home}" do
  target_file #{java_home}
  to "#{jdk_home}"
end

file java_profile do
  content "export JAVA_HOME=#{java_home}/\nexport PATH=${PATH}:${JAVA_HOME}/bin\n"
  mode "0755"
  action :create_if_missing
end

