#
# Cookbook Name:: maven
# Recipe:: default
#
# Copyright 2014, Aol
#

jenkinsUser = Chef::EncryptedDataBagItem.load('users', 'jenkins_user')
owner 		= jenkinsUser[node.chef_environment]["name"]
group 		= jenkinsUser[node.chef_environment]["gid"]
home		= jenkinsUser[node.chef_environment]['home']


srcFolder	= "apache-maven-" + node['maven']['version']
destFolder	= node['maven']['folder']


m2_home 	= "#{home}/#{(node['maven']['m2'])}"

Chef::Log.info('#{m2_home}/settings.xml')

mvnEnvFile = node['maven']['profile'] 


remote_directory destFolder do
	:create_if_missing
	source		srcFolder
	owner		owner
	group		group
	mode		'0755'
	recursive	true
end

directory m2_home do
	action 		:create 
	path		m2_home
	owner		owner
	group		group
	mode		'0755'
end

cookbook_file 'settings.xml' do
	:create
	owner	owner
	group	group
	path	"#{m2_home}/settings.xml"
	mode	'0644'
end

template mvnEnvFile do
  source "mvn.sh.erb"
  variables(
    mvnBin: "#{destFolder}/bin",
    mvnHome: "#{destFolder}"
  )
end




#java_home = node['jdk']['debian']['java_home']
#java_profile = node['jdk']['profile']


#template mvnEnvFile do#
#  source "mvn.sh.erb"
#  variables(
#    how_often: "daily",
#    keep: "31"
#  )
#end

#file mvnEnvFile do
#  content "export JAVA_HOME=#{java_home}/"
#  mode "0755"
#  action :create_if_missing
#end

		

