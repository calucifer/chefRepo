#
# Cookbook Name:: jdk
# Recipe:: jdk-apt
#
# Copyright 2014, AOL
#                                                               
# All rights reserved - Do Not Redistribute
#

package 'oracle-java6-installer' do
	action :install
	response_file "debian_java_licence_response_file"
end


java_home = node['jdk']['debian']['java_home']
java_profile = node['jdk']['profile']

file java_profile do
  content "export JAVA_HOME=#{java_home}/\nexport PATH=${PATH}:${JAVA_HOME}/bin\n"
  mode "0755"
  action :create_if_missing
end
