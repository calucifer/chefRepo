#
# Cookbook Name:: maven
# Recipe:: default
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#

mvn_build = node['maven']['build']
mvn_release = node['maven']['release']
mvn_package = node['maven']['package']
mvn_settings = node['maven']['settings']
mvn_lifecycle = node['maven']['lifecycle']
mvn_repository = node['maven']['repository']
mvn_install = node['maven']['install']
mvn_home = node['maven']['home']
	

hcmbcs mvn_package do
    package mvn_package
    build mvn_build
    release mvn_release
    lifecycle mvn_lifecycle
    action :install        
end

link "#{mvn_home}" do
  target_file #{mvn_home}
  to "#{mvn_install}"
end

directory "#{mvn_repository}" do
  owner "jkin_atp"
  group "aolusers"
  mode 00755
  action :create
end



# Copy maven settings.xml to maven repository
cookbook_file "#{mvn_repository}#{mvn_settings}" do
	source mvn_settings
	mode 0644
	owner "jkin_atp"
	group "aolusers"
	action :create
end