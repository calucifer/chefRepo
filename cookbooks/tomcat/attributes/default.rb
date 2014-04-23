default['jenkins']['tools']['home']					= 'tools'
default['tomcat']['tools']['startup_file']				= 'bin/startTomcatInstances.sh'
default['tomcat']['tools']['shutdown_file']				= 'bin/shutdownTomcatInstances.sh'

default['tomcat']['rhel']['cicd']['install']['build'] 			= '7.0.42'
default['tomcat']['rhel']['cicd']['install']['release'] 		= '1'
default['tomcat']['rhel']['cicd']['install']['lifecycle'] 		= 'stable'
default['tomcat']['rhel']['cicd']['install']['tomcat_install']		= '/opt/bcs/packages/tomcat7'
default['tomcat']['rhel']['cicd']['install']['package']			= 'tomcat'
default['tomcat']['rhel']['cicd']['install']['version'] 		= '7'

default['tomcat']['rhel']['qa']['install']['build'] 			= '7.0.42'
default['tomcat']['rhel']['qa']['install']['release'] 			= '1'
default['tomcat']['rhel']['qa']['install']['lifecycle'] 		= 'stable'
default['tomcat']['rhel']['qa']['install']['tomcat_install']		= '/opt/bcs/packages/tomcat7'
default['tomcat']['rhel']['qa']['install']['package']			= 'tomcat'
default['tomcat']['rhel']['qa']['install']['version'] 			= '7'

default['tomcat']['debian']['cicd']['install']['package']		= 'tomcat'
default['tomcat']['debian']['cicd']['install']['version'] 		= '7'
default['tomcat']['debian']['qa']['install']['package']			= 'tomcat'
default['tomcat']['debian']['qa']['install']['version'] 		= '7'


default['tomcat']['rhel']['cicd']['catalina_home']			= '/etc/tomcat7'
default['tomcat']['rhel']['qa']['catalina_home']			= '/etc/tomcat7'

default['tomcat']['instance']['cicd']['catalina_base_folder']		= 'tools/tomcat'
default['tomcat']['instance']['qa']['catalina_base_folder']		= 'tools/tomcat'



default['tomcat']['template']['cicd']['ingestor']['server_port']	= '8005'
default['tomcat']['template']['cicd']['ingestor']['connector_port']	= '8081'
default['tomcat']['template']['cicd']['ingestor']['redirect_port']	= '8443'
default['tomcat']['template']['cicd']['ingestor']['ajp_connector_port']	= '8009'
default['tomcat']['template']['cicd']['ingestor']['jmxremote_port']	= '7009'
default['tomcat']['template']['cicd']['atp-api']['server_port']		= '10005'
default['tomcat']['template']['cicd']['atp-api']['connector_port']	= '10080'
default['tomcat']['template']['cicd']['atp-api']['redirect_port']	= '10443' 
default['tomcat']['template']['cicd']['atp-api']['ajp_connector_port']	= '10009'
default['tomcat']['template']['cicd']['atp-api']['jmxremote_port']	= '12071'

default['tomcat']['template']['qa']['ingestor']['server_port']		= '8005'
default['tomcat']['template']['qa']['ingestor']['connector_port']	= '8081'
default['tomcat']['template']['qa']['ingestor']['redirect_port']	= '8443'
default['tomcat']['template']['qa']['ingestor']['ajp_connector_port']	= '8009'
default['tomcat']['template']['qa']['ingestor']['jmxremote_port']	= '7009'
default['tomcat']['template']['qa']['atp-api']['server_port']		= '10005'
default['tomcat']['template']['qa']['atp-api']['connector_port']	= '10080'
default['tomcat']['template']['qa']['atp-api']['redirect_port']		= '10443' 
default['tomcat']['template']['qa']['atp-api']['ajp_connector_port']	= '10009'
default['tomcat']['template']['qa']['atp-api']['jmxremote_port']	= '12071'
