#
# CookbookName::redis
# Recipe::redis_conf
#
# Copyright2014,Aol
#

bag_jenkins_user	= data_bag_item('users', 'jenkins_user')

conf_dir	= "#{bag_jenkins_user[node.chef_environment]['home']}/tools/redis"


directory "#{conf_dir}" do
	owner "#{bag_jenkins_user[node.chef_environment]['name']}"
	group "#{bag_jenkins_user[node.chef_environment]['gid']}"
	mode 00766
	action :create
end

directory "#{node['redis']['conf']['working_dir']}" do
	owner 	"#{bag_jenkins_user[node.chef_environment]['name']}"
	group 	"#{bag_jenkins_user[node.chef_environment]['gid']}"
	mode 	00766
	action :create
end
directory "#{conf_dir}/logs" do
	owner "#{bag_jenkins_user[node.chef_environment]['name']}"
	group "#{bag_jenkins_user[node.chef_environment]['gid']}"
	mode 00766
	action :create
end

cookbook_file "#{conf_dir}/redis.conf" do
	mode 	0751
	owner 	"#{bag_jenkins_user[node.chef_environment]['name']}"
	group 	"#{bag_jenkins_user[node.chef_environment]['gid']}"
	action	:create_if_missing
end

# startup file
file "#{bag_jenkins_user[node.chef_environment]['home']}/bin/startRedis.sh" do
	content	"source #{node['jdk']['profile']}\n#{node['redis']['executable']} #{conf_dir}/redis.conf &\n"
	owner 	"#{bag_jenkins_user[node.chef_environment]['name']}"
	group 	"#{bag_jenkins_user[node.chef_environment]['gid']}"
	mode 	00766
	action :create
end


