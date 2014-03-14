tomcat Cookbook
===============
This cookbook installs the Tomcat web server - only via hcmbcs for now (no yum package)

Requirements
------------
- hcmbcs 

Attributes
----------
default['tomcat']['rhel']['install']['package']					= 'tomcat7'
default['tomcat']['rhel']['install']['build'] 						= '7.0.42'
default['tomcat']['rhel']['install']['release'] 					= '1'
default['tomcat']['rhel']['install']['lifecycle'] 					= 'stable'
default['tomcat']['rhel']['install']['tomcat_install']				= '/opt/bcs/packages/tomcat7'
default['tomcat']['rhel']['install']['package']					= 'tomcat'
default['tomcat']['rhel']['install']['version'] 					= '7'
default['tomcat']['rhel']['cicd']['catalina_home']				= '/etc/tomcat7'
default['tomcat']['rhel']['qa']['catalina_home']				= '/etc/tomcat7'
default['tomcat']['rhel']['cicd']['catalina_base_folder']			= 'tomcat_instances'
default['tomcat']['rhel']['cicd']['catalina_base_ingestor']		= 'tomcat_ingestor'
default['tomcat']['rhel']['cicd']['catalina_base_atp-api']		= 'tomcat_atp-api'
default['tomcat']['rhel']['qa']['catalina_base_folder']			= 'tomcat_instances'
default['tomcat']['rhel']['qa']['catalina_base_ingestor']		= 'tomcat_ingestor'
default['tomcat']['rhel']['qa']['catalina_base_atp-api']			= 'tomcat_atp-api'
default['tomcat']['debian']['install']['package']				= 'tomcat'
default['tomcat']['debian']['install']['version'] 				= '7'
default['tomcat']['debian']['cicd']['catalina_home']			= '/usr/share/tomcat7'
default['tomcat']['debian']['qa']['catalina_home']				= '/usr/share/tomcat7'
default['tomcat']['debian']['cicd']['catalina_base_folder']		= 'tomcat_instances'
default['tomcat']['debian']['cicd']['catalina_base_ingestor']	= 'tomcat_ingestor'
default['tomcat']['debian']['cicd']['catalina_base_atp-api']		= 'tomcat_atp-api'
default['tomcat']['debian']['qa']['catalina_base_folder']		= 'tomcat_instances'
default['tomcat']['debian']['qa']['catalina_base_ingestor']		= 'tomcat_ingestor'
default['tomcat']['debian']['qa']['catalina_base_atp-api']		= 'tomcat_atp-api'

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
