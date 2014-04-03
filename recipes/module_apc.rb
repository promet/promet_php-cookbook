#
# Cookbook Name:: promet_php
# Recipe:: module_apc
#
# Copyright 2013, Promet Solutions, Inc.
#
# All rights reserved - Redistribute
#

include_recipe 'php'

#dependency for PECL APC
package "libpcre3-dev" do
  action :install
end

php_pear "apc" do
  version "3.1.13"
  action :install
end

template "/etc/php5/conf.d/apc.ini" do
 source "apc.ini.erb"
 owner "root"
 group 0
 mode 00644
 notifies :reload, "service[apache2]"
end
