jenkins_user Cookbook
=====================
This cookbook create a jenkins user for the slave nodes
It create the user (jenkins) and sets up the ssh keys needed - it's own private/public keys and puts the jenkins masters key into the authorized_keys file 
It created the needed ssh config file for stash access
It also adds, to /etc/rc.local a small script that will run any scripts in $USER/bin that are named start*.sh (Whcih doesn't alway work, ask redhat)

Requirements
------------
data bag::users
data bag::encrypted_passwords
data bag::ssh_keys

Attributes
----------
none (all in the data bags)


Usage
-----
#### jenkins_user::default

running `jenkins_user` will call jenkins_user and jenkins_group
Just include `jenkins_user` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[jenkins_user]"
  ]
}
```

License and Authors
-------------------
Authors: Steven Satelle
