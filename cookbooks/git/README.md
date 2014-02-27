git Cookbook
============
Cookbook will install git onto a machine
It will also (if this is a jenkins slave_) configure git global properties 


Requirements
------------
data bag::users


Attributes
----------
default['git']['config']['file'] = '.gitconfig' 
default['git']['config']['name'] = 'ATP Jenkins User'
default['git']['config']['email'] = 'atp_jenkins@teamaol.com'


Usage
-----
#### git::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `git` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[git]"
  ]
}
```


License and Authors
-------------------
Authors: 
dpms team
Steven Satelle steven.satelle@teamaol.com
