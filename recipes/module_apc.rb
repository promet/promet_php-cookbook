#
# Cookbook Name:: promet_php
# Recipe:: module_apc
#
# Copyright 2013, Promet Solutions, Inc.
#
# All rights reserved - Redistribute
#

include_recipe "php::module_apc"

template "/etc/php5/conf.d/apc.ini" do
 source "apc.ini.erb"
 owner "root"
 group 0
 mode 00644
end
