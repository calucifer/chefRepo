#
# Cookbook Name:: sonar
# Recipe:: create_sonar_db
#
# Copyright 2014, Aol
#
#!/bin/bash
 
sonar_settings_bag 	= data_bag_item('applications', 'sonar')
mysql_password_bag 	= Chef::EncryptedDataBagItem.load('encrypted_passwords', 'mysql')

sonar_password		= mysql_password_bag[node.chef_environment]['sonar']
mysql_root_pwd		= mysql_password_bag[node.chef_environment]['root']

sonar_db_schema 	= sonar_settings_bag[node.chef_environment]['database_name']
sonar_db_user 		= sonar_settings_bag[node.chef_environment]['database_user']

execute "create_sonar_dbs" do
  command "sh /tmp/sonar_sql_script"
  action :nothing
end

template '/tmp/sonar_sql_script' do
  source 'sonar_sql_script.erb'
  variables(
  	  {
				:admin_user		=> "root",
				:admin_password	=> "#{mysql_root_pwd}",
				:schema			=> "#{sonar_db_schema}",
				:user			=> "#{sonar_db_user}",
				:user_password	=> "#{sonar_password}"
		  	}
  )
  notifies :run, 'execute[create_sonar_dbs]'
end




