default['jdk']['rpm'] = 'yum'
default['jdk']['dpkg'] = 'apt'
default['jdk']['profile'] = '/etc/profile.d/jdk.sh'
default['jdk']['rhel']['java_home'] = '/usr/java/default'
default['jdk']['debian']['java_home'] = '/usr/lib/jvm/java-6-oracle'
default['jdk']['hcmbcs']['package'] = 'jdk6'
default['jdk']['hcmbcs']['build'] = '1.6.0_31'
default['jdk']['hcmbcs']['release'] = '1'
default['jdk']['hcmbcs']['lifecycle'] = 'stable'
default['jdk']['hcmbcs']['java_home'] = '/opt/bcs/packages/jdk6-1.6.0_31'