tomcat Cookbook
===============
This cookbook installs the Tomcat web server - only via hcmbcs for now (no yum package)

Requirements
------------
- hcmbcs 
- data bag::users
- data bag::applications
- data bag::system_properties

	


Attributes
----------
TODO: List your cookbook attributes here.
All inside the data bags bar the hcmbcs install:
default['tomcat']['hcmbcs']['package'] = 'tomcat7'
default['tomcat']['hcmbcs']['build'] = '7.0.42'
default['tomcat']['hcmbcs']['release'] = '1'
default['tomcat']['hcmbcs']['lifecycle'] = 'stable'
default['tomcat']['hcmbcs']['tomcat_install'] = '/opt/bcs/packages/tomcat7'

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
