stevens_vms Cookbook
====================
This cookbook will do various vm setup taks for me
At the moment it just installs aptitude if the machine is of the debian family

Requirements
------------
none

Attributes
----------
none

Usage
-----
#### stevens_vms::default


Just include `stevens_vms` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[stevens_vms]"
  ]
}
```

Contributing
------------
License and Authors
-------------------
Authors: Steven Satelle
