tomcat Cookbook
===============
This cookbook installs the Tomcat web server - only via hcmbcs for now (no yum package)
It also sets up 2 instances (tomcat_create_instances recipe

Requirements
------------
- hcmbcs 

Attributes
----------
default['tomcat']['rhel']['install']['package']						= 'tomcat7'
default['tomcat']['rhel']['install']['build'] 							= '7.0.42'
default['tomcat']['rhel']['install']['release'] 						= '1'
default['tomcat']['rhel']['install']['lifecycle'] 						= 'stable'
default['tomcat']['rhel']['install']['tomcat_install']					= '/opt/bcs/packages/tomcat7'
default['tomcat']['rhel']['install']['package']						= 'tomcat'
default['tomcat']['rhel']['install']['version'] 						= '7'
default['tomcat']['rhel']['cicd']['catalina_home']					= '/etc/tomcat7'
default['tomcat']['rhel']['qa']['catalina_home']					= '/etc/tomcat7'

default['tomcat']['debian']['install']['package']					= 'tomcat'
default['tomcat']['debian']['install']['version'] 					= '7'

default['tomcat']['instance']['cicd']['catalina_base_folder']			= 'tomcat_instances'
default['tomcat']['instance']['cicd']['tomcat_ingestor_port']		= '8081'
default['tomcat']['instance']['cicd']['tomcat_ingestor_port_control']	= '8089'
default['tomcat']['instance']['cicd']['tomcat_atp-api_port']			= '10080'
default['tomcat']['instance']['cicd']['tomcat_atp-api_port_control']	= '10089'
default['tomcat']['instance']['qa']['catalina_base_folder']			= 'tomcat_instances'
default['tomcat']['instance']['qa']['tomcat_ingestor_port']			= '8081'
default['tomcat']['instance']['qa']['tomcat_ingestor_port_control']	= '8089'
default['tomcat']['instance']['qa']['tomcat_atp-api_port']			= '10080'
default['tomcat']['instance']['qa']['tomcat_atp-api_port_control']	= '10089'

Usage
-----
#### tomcat::default
TODO: Write usage instructions for each cookbook.


Just include `tomcat` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[tomcat]"
  ]
}
```

Contributing
------------


License and Authors
-------------------
Authors: 
	Steven Satelle (steven.satelle@teamaol.com)
