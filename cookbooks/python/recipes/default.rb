#
# Cookbook Name:: python
# Recipe:: default
#
# Copyright 2014, AOL
#
# All rights reserved - Do Not Redistribute
#

python_package = node['python']['package']
python_release = node['python']['release']
python_profile = node['python']['profile']
python_build = node['python']['build']
python_bin = node['python']['bin']

python_setuptools_package = node['python']['python-setuptools']['package']
python_setuptools_release = node['python']['python-setuptools']['release']
python_setuptools_build = node['python']['python-setuptools']['build']


hcmbcs "#{python_package}" do
  package python_package
  build python_build
  release python_release
  action :install
end

hcmbcs "#{python_setuptools_package}" do
  package python_setuptools_package
  build python_setuptools_build
  release python_setuptools_release
  action :install
end

file python_profile do
  content "export PATH=#{python_bin}:${PATH}"
  mode "0755"
  action :create
end
