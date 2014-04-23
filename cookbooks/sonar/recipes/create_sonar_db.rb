#
# Cookbook Name:: sonar
# Recipe:: create_sonar_db
#
# Copyright 2014, Aol
#
#!/bin/bash
 

mysql_password_bag 	= Chef::EncryptedDataBagItem.load('encrypted_passwords', 'mysql')

sonar_password		= mysql_password_bag[node.chef_environment]['sonar']
mysql_root_pwd		= mysql_password_bag[node.chef_environment]['root']

sonar_db_schema 	= node['sonar'][node.chef_environment]['database_name']
sonar_db_user 		= node['sonar'][node.chef_environment]['database_user']

execute "create_sonar_dbs" do
  command "sh /tmp/sonar_sql_script.sh"
  action :nothing
end

template '/tmp/sonar_sql_script.sh' do
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
  mode		0775
  notifies :run, 'execute[create_sonar_dbs]'
end




