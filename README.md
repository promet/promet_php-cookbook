promet_php Cookbook
===================
A Chef Cookbook to provide PHP greater attribute customization to Opscode Community recipes.

Requirements
------------
Operating Systems: Debian, Ubuntu.  Syntax not extended to non-deb based distros yet.

`promet_php::apache2` - requires the Opscode `php::default` recipe. 

`promet_php::module_apc` - requires the Opscode `php::module_apc` recipe.

Attributes
----------

````
default['promet_php']['realpath_cache_size']                    = "16k"
default['promet_php']['realpath_cache_ttl']                     = "120"
default['promet_php']['expose_php']                             = "On"
default['promet_php']['max_execution_time']                     = "30"
default['promet_php']['max_input_time']                         = "60"
default['promet_php']['max_input_nesting_level']                = "64"
default['promet_php']['memory_limit']                           = "128M"
default['promet_php']['error_reporting']                        = "E_ALL & ~E_DEPRECATED"
default['promet_php']['display_errors']                         = "Off"
default['promet_php']['display_startup_errors']                 = "Off"
default['promet_php']['log_errors']                             = "On"
default['promet_php']['log_errors_max_len']                     = "1024"
default['promet_php']['ignore_repeated_errors']                 = "Off"
default['promet_php']['ignore_repeated_source']                 = "Off"
default['promet_php']['safe_mode']                              = "Off"
default['promet_php']['track_errors']                           = "Off"
default['promet_php']['xmlrpc_errors']                          = "0"
default['promet_php']['xmlrpc_error_number']                    = "0"
default['promet_php']['post_max_size']                          = "8M"
default['promet_php']['magic_quotes_gpc']                       = "Off"
default['promet_php']['magic_quotes_runtime']                   = "Off"
default['promet_php']['magic_quotes_sybase']                    = "Off"
default['promet_php']['file_uploads']                           = "On"
default['promet_php']['upload_tmp_dir']                         = ""
default['promet_php']['upload_max_filesize']                    = "2M"
default['promet_php']['max_file_uploads']                       = "20"
default['promet_php']['date_timezone']                          = ""
default['promet_php']['date_default_latitude']                  = "31.7667"
default['promet_php']['date_default_longitude']                 = "35.2333"
default['promet_php']['date_sunrise_zenith']                    = "90.583333"
default['promet_php']['date_sunset_zenith']                     = "90.583333"
default['promet_php']['apc']['apc_rfc1867']                     = "1"
default['promet_php']['apc']['apc_enabled']                     = "1"
default['promet_php']['apc']['shm_segments']                    = "1"
default['promet_php']['apc']['ttl']                             = "3600"
default['promet_php']['apc']['user_ttl']                        = "3600"
default['promet_php']['apc']['num_files_hint']                  = "1024"
default['promet_php']['apc']['enable_cli']                      = "1"
default['promet_php']['apc']['shm_size']                        = "64"
````

Usage
-----

### Apache2 

In your run_list or role, include:
`"recipe[promet_php::apache2]"`

The apache2 recipe includes the opscode php::default recipe and provides customizable attributes for apache2-php.

In your run_list or role, include:
`"recipe[promet_php::module_apc]"`

### Module_APC

The module_apc recipe includes the Opscode php::module_apc recipe and provides customizable attributes for the apc extension.

This role shows the inclusion of the base Opscode recipes with this cookbook's extensions:

```json
name "php"
description "PHP role"
run_list(
    "recipe[promet_php::apache2]",
    "recipe[php::module_mysql]",
    "recipe[php::module_gd]",
    "recipe[php::module_memcache]",
    "recipe[promet_php::module_apc]",
    "recipe[php::module_curl]",
)

default_attributes(
  "promet_php" => {
        "memory_limit" => "196M",
        "upload_max_filesize" => "30M"
	}
)
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
License: None.  Do as you wish.
Authors: gregpalmier
