maven Cookbook
==============
This cookbook installs Maven and sets the M2_HOME and MAVEN home environment variables
On AOL Centos systems it installs via hcmbcs

Requirements
------------
- hcmbcs


Attributes
----------
#### maven::default
<table>
  <tr>
    <th>['maven']['build']</th>
    <th>String</th>
    <th>Build Version</th>
    <th>Default</th>
  </tr>
  <tr>
    <th>['maven']['release']</th>
    <th>String</th>
    <th>Release Number</th>
    <th>Default</th>
  </tr>
  <tr>
    <th>['maven']['package']</th>
    <th>String</th>
    <th>Package name</th>
    <th>Default</th>
  </tr>
  <tr>
    <th>['maven']['lifecycle']</th>
    <th>String</th>
    <th>lifecycle state</th>
    <th>Default</th>
  </tr>
  <tr>
    <th>['maven']['settings']</th>
    <th>String</th>
    <th>settings file</th>
    <th>Default</th>
  </tr>
  <tr>
    <th>['maven']['repository']</th>
    <th>String</th>
    <th>m2 home</th>
    <th>Default</th>
  </tr>
  <tr>
    <th>['maven']['install']</th>
    <th>String</th>
    <th>hcmbcs install folder</th>
    <th>Default</th>
  </tr>
  <tr>
    <th>['maven']['home']</th>
    <th>String</th>
    <th>MAVEN_HOME folder</th>
    <th>Default</th>
  </tr>
  <tr>
    <th>['maven']['profile']</th>
    <th>String</th>
    <th>Location of the maven profile.d file</th>
    <th>Default</th>
  </tr>
</table>

Usage
-----
#### maven::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `maven` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[maven]"
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
