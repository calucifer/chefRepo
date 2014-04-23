echo 
echo Tomcat instances
echo
ps aux |grep [t]omcat;
echo 
echo Sonar instance 
echo
ps aux |grep -i [s]onar;
echo 
echo Redis
echo
ps aux |grep -i [r]edis;
echo 
echo Membase
echo
ps aux |grep -i [m]embase;
echo 
echo Selenium Server
echo
ps aux |grep -i [s]elenium;
echo 
echo VncConnections
echo
vncserver -list
echo
echo Done
echo
