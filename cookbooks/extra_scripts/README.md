Extra Scripts
=============
This simple manual package is used to do some of the manuals steps required
* creates a folder ~/mysql which contains scripts to create the 2 mysql dbs and users needed (segment_stats and asms) - you need to them manually run them!
* Puts the required json configs into /srv
* The mysql db creation scripts are put into the users home dir
* A script is put in /etc/rc.local to startup all files in the users ~/bin folder that are named start*.sh
* The jenkins system variables (JENKINS_CICD_HOME AND ATP_COMPONENTS_DIR) made system variables (script in /etc/profile.d)
* The selenium server is put into the tools folder & a startup script put into ~/bin
* A script to output the running services in ~/bin

