#
# Cookbook Name:: promet_php
# Recipe:: apache2
#
# Copyright 2013, Promet Solutions, Inc.
#
# All rights reserved - Redistribute
#

template "#{node['promet_php']['ini_dir']}/php.ini" do
 source "php.ini.erb"
 owner "root"
 group 0
 mode 00644
end
