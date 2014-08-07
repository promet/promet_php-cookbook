#
# Cookbook Name:: promet_nginx-cookbook
# Recipe:: php-fpm
#
# Copyright (C) 2013 Greg Palmier
# 
# All rights reserved - Do Not Redistribute
#

include_recipe	'nginx'

package "#{node['promet_php']['fpm_pkg']}" do
  action :install
end

service "#{node['promet_php']['fpm_pkg']}" do
  supports :status => true, :restart => true, :reload => true, :stop => true
  action [ :enable, :start ]
end

template "#{node['promet_php']['fpm_dir']}/php.ini" do
 source "php.ini.erb"
 owner "root"
 group 0
 mode 00644
 notifies :reload, "service[#{node['promet_php']['fpm_pkg']}]"
end
