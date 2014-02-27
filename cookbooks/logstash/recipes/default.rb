#
# Cookbook Name:: logstash
# Recipe:: default
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#

logstash_build = node['logstash']['build']
logstash_release = node['logstash']['release']
logstash_package = node['logstash']['package']
logstash_repository = node['logstash']['repository']


python_supervisor_build = node['logstash']['dependencies']['python-supervisor']['build']
python_supervisor_release = node['logstash']['dependencies']['python-supervisor']['release']
python_supervisor_package = node['logstash']['dependencies']['python-supervisor']['package']

adcom_supervisord_build = node['logstash']['dependencies']['adcom_supervisord']['build']
adcom_supervisord_release = node['logstash']['dependencies']['adcom_supervisord']['release']
adcom_supervisord_package = node['logstash']['dependencies']['adcom_supervisord']['package']
adcom_supervisord_repo = node['logstash']['dependencies']['adcom_supervisord']['repository']


hcmbcs python_supervisor_package do
  package python_supervisor_package
  build python_supervisor_build
  release python_supervisor_release
  action :install
end

hcmbcs adcom_supervisord_package do
  package adcom_supervisord_package
  build adcom_supervisord_build
  release adcom_supervisord_release
  repository adcom_supervisord_repo
  action :install
end

hcmbcs logstash_package do
  package logstash_package
  build logstash_build
  release logstash_release
  repository logstash_repository
  action :install
end