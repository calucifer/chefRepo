#
# Cookbook Name:: tomcat_create_instances
# Recipe:: default
#
# Copyright 2014, Aol
#
users_bag 			= data_bag_item('users', "jenkins_user")

user_name			= users_bag[node.chef_environment]["name"]
user_group 			= users_bag[node.chef_environment]["gid"]
user_home 			= users_bag[node.chef_environment]["home"] 

tomcat_settings 		= data_bag_item('applications', 'tomcat')
catalina_home 		= tomcat_settings[node.chef_environment]["catalina_home"]
catalina_base_parent	= tomcat_settings[node.chef_environment]["catalina_base_folder"]

directory "#{user_home}/#{catalina_base_parent}" do
	owner	"#{user_name}"
	group	"#{user_group}"
	action	:create
end;

['tomcat_ingestor', 'tomcat_atp-api'].each do |instance|
	catalina_base	= 	"#{user_home}/#{catalina_base_parent}/#{instance}"
	bash "create_tomcat_instance" do
		user 	"#{user_name}"
		group 	"#{user_group}"
		cwd 	"#{user_home}"
		environment	(
						{
							"CATALINA_BASE" => "#{catalina_base}",
							"CATALINA_HOME" => "#{catalina_home}"
						}
					)
		code 	<<-EOH
			# this script will create a tomcat instance
			
			create_startup_script() {
				echo "#!/bin/sh"								> "${CATALINA_BASE}/bin/startup.sh";
				echo "export CATALINA_BASE=\"$CATALINA_BASE\"" 	>> "${CATALINA_BASE}/bin/startup.sh";
				echo "${CATALINA_HOME}/bin/startup.sh" 			>> "${CATALINA_BASE}/bin/startup.sh";
				echo "echo \"Tomcat started\"" 					>>  "${CATALINA_BASE}/bin/startup.sh";
				
				chmod 0755 "${CATALINA_BASE}/bin/startup.sh";
			}
			create_shutdown_script() {
				echo "#!/bin/sh" 								> "${CATALINA_BASE}/bin/shutdown.sh";
				echo "export CATALINA_BASE=\"$CATALINA_BASE\"" 	>> "${CATALINA_BASE}/bin/shutdown.sh";
				echo "${CATALINA_HOME}/bin/shutdown.sh" 		>> "${CATALINA_BASE}/bin/shutdown.sh";
				echo "echo \"Tomcat shutdown\"" 				>>  "${CATALINA_BASE}/bin/shutdown.sh";
				
				chmod 0755 ${CATALINA_BASE}/bin/shutdown.sh;
			}
			# are the needed env variables set
			[ -z "${CATALINA_HOME}" ] && { echo "CATALINA_HOME not set, exiting"; exit 1; }
			[ -z "${CATALINA_BASE}" ] && { echo "CATALINA_BASE not set, exiting"; exit 1; }
			echo "${CATALINA_HOME}";
			echo "${CATALINA_BASE}";
			
			# Do the required directories exist 
			[ ! -d "${CATALINA_BASE}" ] && mkdir "${CATALINA_BASE}";
			[ ! -d "${CATALINA_BASE}/bin" ] && mkdir "${CATALINA_BASE}/bin";
			[ ! -d "${CATALINA_BASE}/conf" ] && mkdir "${CATALINA_BASE}/conf";
			[ ! -d "${CATALINA_BASE}/lib" ] && mkdir "${CATALINA_BASE}/lib";
			[ ! -d "${CATALINA_BASE}/logs" ] && mkdir "${CATALINA_BASE}/logs";
			[ ! -d "${CATALINA_BASE}/webapps" ] && mkdir "${CATALINA_BASE}/webapps";
			[ ! -d "${CATALINA_BASE}/work" ] && mkdir "${CATALINA_BASE}/work";
			[ ! -d "${CATALINA_BASE}/temp" ] && mkdir "${CATALINA_BASE}/temp";
			
			# all good create the scripts ..
			create_startup_script
			create_shutdown_script
			
			# copy needed jar file to our $CATALINA_BASE/bin
			cp  "${CATALINA_HOME}/bin/tomcat-juli.jar" "${CATALINA_BASE}/bin/";
			
			# copy the confs ...
			cp  "${CATALINA_HOME}/conf/catalina.properties" "${CATALINA_BASE}/conf/";
			cp  "${CATALINA_HOME}/conf/context.xml" "${CATALINA_BASE}/conf/";
			cp  "${CATALINA_HOME}/conf/logging.properties" "${CATALINA_BASE}/conf/";
			#cp  "${CATALINA_HOME}/conf/server.xml" "${CATALINA_BASE}/conf/";
			#cp  "${CATALINA_HOME}/conf/tomcat-users.xml" "${CATALINA_BASE}/conf/";
			cp  "${CATALINA_HOME}/conf/web.xml" "${CATALINA_BASE}/conf/";
			cp  -rf "${CATALINA_HOME}/webapps/manager" "${CATALINA_BASE}/webapps/";
		EOH
	end
	cookbook_file "tomcat-users.xml" do
		path 	"#{catalina_base}/conf/tomcat-users.xml"
		user 	"#{user_name}"
		group 	"#{user_group}"
		action	:create
	end
	cookbook_file "#{instance}-server.xml" do
		path	"#{catalina_base}/conf/server.xml"
		user 	"#{user_name}"
		group 	"#{user_group}"
		action	:create
	end
end

	

