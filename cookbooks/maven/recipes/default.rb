#
# Cookbook Name:: hcmbcs
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

hcmbcs mvn_package do
    package mvn_package
    build mvn_build
    release mvn_release
    lifecycle mvn_lifecycle
    action :install        
end

directory "#{mvn_repository}" do
  owner "dmps"
  group "aolusers"
  mode 00755
  action :create
end

# Copy maven settings.xml to maven repository
cookbook_file "#{mvn_repository}#{mvn_settings}" do
	source mvn_settings
	mode 0644
	owner "dmps"
	group "aolusers"
	action :create_if_missing
end