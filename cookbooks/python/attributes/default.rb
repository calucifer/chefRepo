#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: python
# Attribute:: default
#
# Copyright 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['python']['install_method'] = 'hcmbcs'

if python['install_method'] == 'package'
	case platform
  	when "smartos"
  	  default['python']['prefix_dir']         = '/opt/local'
  	  default['pip']['prefix_dir']         = '/opt/local'
  	  
  	else
  	  default['python']['prefix_dir']         = '/usr'
  	  default['pip']['prefix_dir']         = '/usr'
  	end
elsif python['install_method'] == 'hcmbcs'
	default['python']['prefix_dir']         = '/opt/bcs/packages/python2-2.7.3'
	default['pip']['prefix_dir']         	= '/opt/bcs/packages/python-modules-2.0'
else
	default['python']['prefix_dir']         = '/usr/local'
	default['pip']['prefix_dir']	        = '/usr/local'
end

default['python']['binary'] 	= "#{node['python']['prefix_dir']}/bin/python"
default['pip']['binary'] 	= "#{node['pip']['prefix_dir']}/bin/pip"

default['python']['url'] = 'http://www.python.org/ftp/python'
default['python']['version'] = '2.7.5'
default['python']['checksum'] = '3b477554864e616a041ee4d7cef9849751770bc7c39adaf78a94ea145c488059'
default['python']['configure_options'] = %W{--prefix=#{python['prefix_dir']}}
default['python']['make_options'] = %W{install}

default['python']['pip_location'] = "#{node['python']['prefix_dir']}/bin/pip"
default['python']['virtualenv_location'] = "#{node['python']['prefix_dir']}/bin/virtualenv"
default['python']['setuptools_version'] = nil # defaults to latest
default['python']['virtualenv_version'] = nil

default['python']['hcmbcs']
default['python']['hcmbcs']['package'] 	= 'python2'
default['python']['hcmbcs']['build'] 	= '2.7.3'
default['python']['hcmbcs']['release'] 	= '1'
default['python']['hcmbcs']['lifecycle']= 'stable'
default['python']['hcmbcs']['install']	='/opt/bcs/packages/python2-2.7.3'

default['python']['home'] = "#{node['python']['prefix_dir']}"
