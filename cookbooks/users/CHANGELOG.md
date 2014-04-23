jenkins_user CHANGELOG
======================

0.1.6 (10-04-2014)
-----
- [Steven Satelle] - Pulled all the extra scripts out of this cookbook as was getting a bit ridiculous - put them into the extra scripts cookbook 

0.1.5 (08-04-2014)
-----
- [Steven Satelle] - Added selenium server setup to this cookbook for the jenkins_user

0.1.4 (08-04-2014)
-----
- [Steven Satelle] - Added in the creation of the atp_components_dir + setting global env vars for atp_components_dir and jenkins_cicd_home 

0.1.3 (24-03-2014)
-----
- [Steven Satelle] - Added in steps to create the bin and tools dir in the user home for the jenkins user, also create the ssh known_hosts files containing the stash keys - IF IT DOESNT ALREADY EXIST 
					 Adds a script to /etc/rc.local to startup any sh files in the users ~/bin folder

0.1.2 (26-02-2014)
-----
- [Steven Satelle] - modified the data bags to take environments into account - so updating recipes
					also added my user for cicd envs

0.1.1 (25-02-2014)
-----
- [Steven Satelle] - Added in the SSH config

0.1.0 (25-02-2014)
-----
- [Steven Satelle] - Initial release of jenkins_user

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
