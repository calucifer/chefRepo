#
# Cookbook Name:: extra_scripts
# Recipe:: default
#
# Copyright 2014, Aol
#
# 
users_bag 		= data_bag_item('users', "jenkins_user")

atp_components_dir	= "sad"

user_name		= users_bag[node.chef_environment]["name"]
user_group 		= users_bag[node.chef_environment]["gid"]
user_home 		= users_bag[node.chef_environment]["home"] 

user_bin		= "#{user_home}/bin"
tool_home		= "#{user_home}/tools"
selenium_home		="#{tool_home}/seleniumGrid"
jenkins_home		= "#{user_home}/jenkins"
atp_components_dir 	= "#{jenkins_home}/components"
jenkins_cicd_home 	= "#{atp_components_dir}/jenkins_cicd"

json_config = "json_configs.tar.gz"
mysql_scripts = "mysql_databases.tar.gz"

rh_tz			= "#{node['system']['timezone']['utc']}"
rh_tz_file 		= "#{node['system']['timezone']['rhel']}"

# set some of the jenkins variables as system variables 
file "/etc/profile.d/jenkins.sh" do
	content	"export ATP_COMPONENTS_DIR=#{atp_components_dir}\nexport JENKINS_CICD_HOME=${ATP_COMPONENTS_DIR}/jenkins_cicd"
  	mode 	0775
	action	:create_if_missing
end

# add a small script to rc.local to start all tasks in the jenkins user bin folder
template "/etc/rc.d/rc.local" do
	source	"rc.local.erb"
	mode 	0755
	owner 	"root"
	group 	"root"
	variables(
	{
		:user 		=> "#{user_name}",
		:user_bin 	=> "#{user_bin}"
	})
end

cookbook_file "#{selenium_home}/selenium-server-standalone-2.41.0.jar" do
	owner	"#{user_name}"
	group	"#{user_group}"
	action	:create_if_missing
end

file "#{user_bin}/startSeleniumGrid.sh" do
	owner	"#{user_name}"
	group	"#{user_group}"
  	mode 	0775
	content	"source /etc/profile.d/jdk.sh\nnohup java -jar #{selenium_home}/selenium-server-standalone-2.41.0.jar -role hub > #{selenium_home}/selenium-server.log &\n"
	action	:create_if_missing
end

# scripts to create the databases
cookbook_file "#{Chef::Config[:file_cache_path]}/#{mysql_scripts}" do
  mode "0644"
end	

execute "tar zxf #{Chef::Config[:file_cache_path]}/#{mysql_scripts}" do
	cwd 	"#{user_home}"
end

execute "chown -R #{user_name}.#{user_group} #{user_home}" do
	cwd 	"#{user_home}"
end

# A script to check of the rest are runnng
cookbook_file "#{user_bin}/jenkinsUserChecks.sh" do
	owner	"#{user_name}"
	group	"#{user_group}"
	action	:create_if_missing
end

# Finally the required json config files -  will be extracted into /srv
cookbook_file "#{Chef::Config[:file_cache_path]}/#{json_config}" do
	mode	"0644"
end	

execute "tar zxf #{Chef::Config[:file_cache_path]}/#{json_config}" do
	cwd 	"/"
end

execute "chown -R #{user_name}.#{user_group} /srv" do
	cwd 	"/"
end

# if this is a redhat box, set the timezone to utc
if platform_family?("rhel")
	link "#{rh_tz_file}" do
		to	"#{rh_tz}"
	end 	  
end
