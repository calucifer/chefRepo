tomcat CHANGELOG
================
0.1.8(09-04-2014)
-----
- [Steven Satelle] - changed setenv.sh into a template, reading variables from the attributes file

0.1.7(31-03-2014)
-----
- [Steven Satelle] - added a shutdown script creation and the setenv script for startup options startups

0.1.6(24-03-2014)
-----
- [Steven Satelle] - changed the instance server.xml to be a template file

0.1.5(14-03-2014)
-----
- [Steven Satelle] - couldn't set properties in data bag (limit of 2 levels on bags) so moved all settings out of data bags and into attributes

0.1.4(14-03-2014)
-----
- [Steven Satelle] - updated to also install on debian family hosts (needed for cicd testing env)

0.1.3(12-03-2014)
-----
- [Steven Satelle] - updated instance script to create multiple instances using data bag (tomcat) settings

0.1.2(10-03-2014)
-----
- [Steven Satelle] - Created manager App instance per catalina_base

0.1.1(05-03-2014)
-----
- [Steven Satelle] - Created catalina_base (webapps) instance

0.1.0
-----
- [Steven Satelle] - Initial release of tomcat

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
