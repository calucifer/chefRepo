#
# Cookbook Name:: gradle
# Recipe:: default
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#

gradle_archive = node["gradle"]["archive"]
install_dir = node["gradle"]["install_dir"]
extracted_dir = node["gradle"]["extracted_dir"]
symlink_source = node["gradle"]["symlink_source"]
symlink_target = node["gradle"]["symlink_target"]


cookbook_file "#{install_dir}#{gradle_archive}" do
	source gradle_archive
	mode 0755
	owner "root"
	group "root"
	action :create_if_missing
end

execute "unzip-gradle-package" do
 	command "cd #{install_dir} && unzip #{gradle_archive}"
	not_if { ::File.directory?("#{extracted_dir}")}
end

link "#{symlink_target}" do
	to "#{symlink_source}"
end