memBase Cookbook
================
Installs membase 1.7.2 from a local rpm file

Requirements
------------

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### memBase::default
<table>
  <tr>
    <th>['membase']['package']</th>
    <th>String</th>
    <th>membase package name</th>
    <th>membase-server-enterprise</th>
  </tr>
  <tr>
    <th>['membase']['arch']</th>
    <th>String</th>
    <th>membase package architecture</th>
    <th>x86_64</th>
  </tr>
   <tr>
    <th>['membase']['version']</th>
    <th>String</th>
    <th>membase package version</th>
    <th>1.7.2</th>
  </tr>
  <tr>
    <th>['membase']['rhel']</th>
    <th>String</th>
    <th>Package installer type</th>
    <th>rpm</th>
  </tr>
</table>

Usage
-----
#### memBase::default

Just include `memBase` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[memBase]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Steven Satelle
