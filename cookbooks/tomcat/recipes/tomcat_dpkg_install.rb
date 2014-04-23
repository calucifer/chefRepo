#
# Cookbook Name:: 	
# Recipe:: tomcat_dpkg_install
#
# Copyright 2014, Aol
#
users_bag 			= data_bag_item('users', "jenkins_user")

user_name			= users_bag[node.chef_environment]["name"]
user_group 			= users_bag[node.chef_environment]["gid"]
user_home 			= users_bag[node.chef_environment]["home"] 

package_name		=	"#{node[node.platform_family][node.chef_environment]['install']['package']}#{node[node.platform_family][node.chef_environment]['install']['version']}"
catalina_base_parent	="#{user_home}/#{node['tomcat']['instance'][node.chef_environment]['catalina_base_folder']}"

ingestor_folder		= "#{catalina_base_parent}/tomcat_ingestor"
ingestor_port		= node['tomcat']['instance'][node.chef_environment]['tomcat_ingestor_port']	
ingestor_port_control = node['tomcat']['instance'][node.chef_environment]['tomcat_ingestor_port_control']

atp_folder			= "#{catalina_base_parent}/tomcat_atp-api"
atp_port				= node['tomcat']['instance'][node.chef_environment]['tomcat_atp-api_port']	
atp_port_control 		= node['tomcat']['instance'][node.chef_environment]['tomcat_atp-api_port_control']




package "#{package_name}" do
	action	:install
end


package "#{package_name}-admin" do
	action	:install
end

package "#{package_name}-user" do
	action	:install
end

directory "#{catalina_base_parent}" do
	owner	"#{user_name}"
	group	"#{user_group}"
	action	:create
end;

execute "create_ingestor_instance" do
	command	"tomcat7-instance-create -p $HTTP_PORT -c $CONTROL_PORT $INSTANCE_FOLDER"
	user	"#{user_name}"
	group	"#{user_group}"
	environment(
		{
			"HTTP_PORT"			=> "#{ingestor_port}",
			"CONTROL_PORT"		=> "#{ingestor_port_control}",
			"INSTANCE_FOLDER"	=> "#{ingestor_folder}"
		}
	)
	not_if do ::File.exists?("#{ingestor_folder}/conf/server.xml") end
end
cookbook_file "tomcat-users.xml" do
	path 	"#{ingestor_folder}/conf/tomcat-users.xml"
	user 	"#{user_name}"
	group 	"#{user_group}"
	action	:create
end
cookbook_file "tomcat_ingestor-server.xml" do
	path	"#{ingestor_folder}/conf/server.xml"
	user 	"#{user_name}"
	group 	"#{user_group}"
	action	:create
end

execute "create_atp_instance" do
	command	"tomcat7-instance-create -p $HTTP_PORT -c $CONTROL_PORT $INSTANCE_FOLDER"
	user	"#{user_name}"
	group	"#{user_group}"
	environment(
		{
			"HTTP_PORT"			=> "#{atp_port}",
			"CONTROL_PORT"		=> "#{atp_port_control}",
			"INSTANCE_FOLDER"	=> "#{atp_folder}"
		}
	)
	not_if do ::File.exists?("#{atp_folder}/conf/server.xml") end
end
 'tomcat_atp-api'
cookbook_file "tomcat-users.xml" do
	path 	"#{atp_folder}/conf/tomcat-users.xml"
	user 	"#{user_name}"
	group 	"#{user_group}"
	action	:create
end
cookbook_file "tomcat_atp-api-server.xml" do
	path	"#{atp_folder}/conf/server.xml"
	user 	"#{user_name}"
	group 	"#{user_group}"
	action	:create
end
