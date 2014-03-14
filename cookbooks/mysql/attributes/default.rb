default['mysql']['package'] 		= 	'mysql-server'
default['mysql']['arch']			=	'x86_64'
default['mysql']['provider']		=	'yum_package'
default['mysql']['service']			=	'mysqld'
default['mysql']['root_passwd_cmd'] = 	'/usr/bin/mysqladmin -u root password'
default['mysql']['root_password'] 	= 	'cicd'

