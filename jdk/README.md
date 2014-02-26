jdk Cookbook
============
This cookbook will install java 1.6.0_45 

Requirements
------------
------------
### Platforms
- Debian, Ubuntu
- CentOS 6+, Red Hat 6+, Fedora, Amazon Oracle

### Dependencies
- hcmbcs

Attributes
----------
default['jdk']['rpm'] = 'yum'
default['jdk']['dpkg'] = 'apt'
default['jdk']['profile'] = '/etc/profile.d/jdk.sh'
default['jdk']['java_home'] = '/usr/java/default'
default['jdk']['hcmbcs']['package'] = 'jdk6'
default['jdk']['hcmbcs']['build'] = '1.6.0_31'
default['jdk']['hcmbcs']['release'] = '1'
default['jdk']['hcmbcs']['lifecycle'] = 'stable'
default['jdk']['hcmbcs']['java_home'] = '/opt/bcs/packages/jdk6-1.6.0_31'

Usage
-----
#### jdk::default
Just include `jdk` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[jdk]"
  ]
}
```


License and Authors
-------------------
Authors: 
-- Niall O'Connor (hcmbcs and yum recipes) 
-- Steven Satelle (apt recipe)
