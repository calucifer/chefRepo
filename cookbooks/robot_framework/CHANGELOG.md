robot_framework CHANGELOG
=========================

This file is used to list changes made in each version of the robot_framework cookbook.

0.1.4 (2014-04-04))
-----
- [Steven Satelle] - 	had to move robotframeowrk out to its own src install (with recipe) and thigthened up the versions of the libs to install

0.1.3 (2014-04-01))
-----
- [Steven Satelle] - 	bug fixes

0.1.2 (2014-03-28))
-----
- [Steven Satelle] - 	rewrote - setting up cx oracle from rpm's/src, installing all pylibs to a new virtualenv
						This means that installl will need to be proceeded by the virtualenv setup and runs wil need to be proceeded by source ${PY_ROBOT_VM}/bin/activate
						Also setups up a number of env variables in /etc/profile.d/oracle.sh and /etc/profile.d/python.sh 
						


0.1.1 (2014-03-26))
-----
- [Steven Satelle] - added in tasks to install the selenium 1 pylibs and setup cx_oracle

0.1.0
-----
- [Steven Satelle] - Initial release of robot_framework

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
