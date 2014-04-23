redis Cookbook
==============
Installs The Redis Package
Installs redis-2.6.16-1 from rpm package and the config from hcmbcs package AT_REDIS_rte_2.6.16_4
also installs the redis dependency gperftools-lib

Requirements
------------
System	rhel
Package hcmbcs >= 0.1.0


Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### redis::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['redis']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### redis::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `redis` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[redis]"
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
Authors: TODO: List authors
