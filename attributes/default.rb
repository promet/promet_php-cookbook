case node['platform_family']
when 'rhel', 'fedora', 'centos'
  default['promet_php']['ini_dir']      = '/etc'
  default['promet_php']['fpm_pkg']      = 'php-fpm'
  default['promet_php']['fpm_dir']      = '/etc'
when 'debian'
  default['promet_php']['ini_dir']      = '/etc/php5/apache2'
  default['promet_php']['fpm_pkg']      = 'php5-fpm'
  default['promet_php']['fpm_dir']      = '/etc/php5/fpm'
else
end
default['promet_php']['realpath_cache_size']			= "16k"
default['promet_php']['realpath_cache_ttl']			= "120"
default['promet_php']['expose_php']				= "Off"
default['promet_php']['max_execution_time']			= "30"
default['promet_php']['max_input_time']				= "60"
default['promet_php']['max_input_nesting_level']		= "64"
default['promet_php']['memory_limit']				= "128M"
default['promet_php']['error_reporting']			= "E_ALL & ~E_DEPRECATED"
default['promet_php']['display_errors']				= "Off"
default['promet_php']['display_startup_errors']			= "Off"
default['promet_php']['log_errors']				= "On"
default['promet_php']['log_errors_max_len']			= "1024"
default['promet_php']['ignore_repeated_errors']			= "Off"
default['promet_php']['ignore_repeated_source']			= "Off"
default['promet_php']['safe_mode']				= "Off"
default['promet_php']['sql_safe_mode']				= "On"
default['promet_php']['allow_url_fopen']			= "Off"
default['promet_php']['cgi_force_redirect']			= "1"
default['promet_php']['track_errors']				= "Off"
default['promet_php']['xmlrpc_errors']				= "0"
default['promet_php']['xmlrpc_error_number']			= "0"
default['promet_php']['post_max_size']				= "8M"
default['promet_php']['magic_quotes_gpc']			= "Off"
default['promet_php']['magic_quotes_runtime']			= "Off"
default['promet_php']['magic_quotes_sybase']			= "Off"
default['promet_php']['file_uploads']				= "On"
default['promet_php']['upload_tmp_dir']				= ""
default['promet_php']['upload_max_filesize']			= "2M"
default['promet_php']['max_file_uploads']			= "20"
default['promet_php']['date_timezone']				= ""
default['promet_php']['date_default_latitude']			= "31.7667"
default['promet_php']['date_default_longitude']			= "35.2333"
default['promet_php']['date_sunrise_zenith']			= "90.583333"
default['promet_php']['date_sunset_zenith']			= "90.583333"
default['promet_php']['apc']['apc_rfc1867']			= "1"
default['promet_php']['apc']['apc_enabled']			= "1"
default['promet_php']['apc']['shm_segments']			= "1"
default['promet_php']['apc']['ttl']				= "3600"
default['promet_php']['apc']['user_ttl']			= "3600"
default['promet_php']['apc']['num_files_hint']			= "1024"
default['promet_php']['apc']['enable_cli']			= "0"
default['promet_php']['apc']['shm_size']			= "96"
