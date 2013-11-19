#
# Cookbook Name:: promet_php
# Recipe:: apache2
#
# Copyright 2013, Promet Solutions, Inc.
#
# All rights reserved - Redistribute
#

include_recipe "php"
include_recipe "apache2::mod_php5"

template "/etc/php5/apache2/php.ini" do
 source "php.ini.erb"
 owner "root"
 group 0
 mode 00644
end
