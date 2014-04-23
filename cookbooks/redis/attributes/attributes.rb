default['rpm']['filetype']									= 'rpm'

default['rpm']['redis']['package']							= 'redis'
default['rpm']['redis']['version']							= '2.6.16-1.el6.remi'
default['rpm']['redis']['arch']								= 'x86_64'

default['rpm']['gperftools']['package']						= 'gperftools-libs'
default['rpm']['gperftools']['arch']						= 'x86_64'

default['hcmbcs']['redis']['package']						= 'AT_REDIS_rte'
default['hcmbcs']['redis']['build'] 						= '2.6.16'
default['hcmbcs']['redis']['release'] 						= '4'
default['hcmbcs']['redis']['repository']					= 'composition'

default['redis']['executable']								= '/usr/sbin/redis-server'

# redis conf file config a number of these are the default values
default['redis']['conf']['daemonize']						= "no"
default['redis']['conf']['pid_file']							= "/home/jkin_atp/tools/redis/redis.pid"
default['redis']['conf']['port']							= "6379"
default['redis']['conf']['bind_addr']						= "0.0.0.0"
default['redis']['conf']['timeout']						= "0"
default['redis']['conf']['tcp_keepalive']					= "0"
default['redis']['conf']['log_level']						= "verbose"
default['redis']['conf']['log_file']							= "/home/jkin_atp/tools/redis/logs/localhost_6379.log"
default['redis']['conf']['databases_number']				= "1"
# SNAPSHOTTING
default['redis']['conf']['stop_writes_on_bgsave_erro']		= "yes"
default['redis']['conf']['rdbcompression']					= "yes"
default['redis']['conf']['rdbchecksum']					= "yes"
default['redis']['conf']['dbfilename']						= "localhost_6379.rdb"
default['redis']['conf']['working_dir']						= "/home/jkin_atp/tools/redis/data"
# REPLICATION
default['redis']['conf']['slave_serve_stale_data']			= "yes"
default['redis']['conf']['slave_read_only']					= "yes"
default['redis']['conf']['repl_disable_tcp_nodelay']			= "no"
default['redis']['conf']['slave_priority']					= "100"
# APPEND ONLY MODE
default['redis']['conf']['append_only']					= "yes"
default['redis']['conf']['append_filename']				= "localhost_6379.aof"
default['redis']['conf']['appendfsync']					= "everysec"
default['redis']['conf']['no_appendfsync_on_rewrite']		= "no"
default['redis']['conf']['auto_aof_rewrite_percentage']		= "100"
default['redis']['conf']['auto_aof_rewrite_min_size']		= "64mb"
# LUA SCRIPTING
default['redis']['conf']['lua_time_limit']					= "5000"
# SLOW LOG 
default['redis']['conf']['slowlog_log_slower_than']			= "10000"
default['redis']['conf']['slowlog_max_len']				= "128"
# ADVANCED CONFIG
default['redis']['conf']['hash_max_ziplist_entries']			= "512"
default['redis']['conf']['hash_max_ziplist_value']			= "64"
default['redis']['conf']['list_max_ziplist_entries']			= "512"
default['redis']['conf']['list_max_ziplist_value']				= "64"
default['redis']['conf']['set_max_intset_entries']			= "512"
default['redis']['conf']['zset_max_ziplist_entries']			= "128"
default['redis']['conf']['zset_max_ziplist_value']			= "64"
default['redis']['conf']['activerehashing']					= "yes"
default['redis']['conf']['client_output_buffer_limit_normal']	= "0 0 0"
default['redis']['conf']['client_output_buffer_limit_slave']	= "256mb 64mb 60"
default['redis']['conf']['client_output_buffer_limit_pubsub']	= "32mb 8mb 60"
default['redis']['conf']['hz']								= "10"
default['redis']['conf']['aof_rewrite_incremental_fsync']	= "yes"

