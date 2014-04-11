#
# Cookbook Name:: promet_php
# Recipe:: module_apc
#
# Copyright 2013, Promet Solutions, Inc.
#
# All rights reserved - Redistribute
#

#dependency for PECL APC
package "libpcre3-dev" do
  action :upgrade
end

php_pear 'APC' do
  version '3.1.13'
  action :install
end

template "/etc/php5/conf.d/apc.ini" do
 source "apc.ini.erb"
 owner "root"
 group 0
 mode 00644
 if node["nginx"] == true
   notifies :reload, "service[php5-fpm]"
 end
 if node["apache"] == true
   notifies :reload, "service[apache2]"
 end
end
