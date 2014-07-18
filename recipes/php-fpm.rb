#
# Cookbook Name:: promet_nginx-cookbook
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

include_recipe	'nginx'

package 'php5-fpm' do
  action :install
end

service 'php5-fpm' do
  supports :status => true, :restart => true, :reload => true, :stop => true
  action [ :enable, :start ]
end

template "/etc/php5/fpm/php.ini" do
 source "php.ini.erb"
 owner "root"
 group 0
 mode 00644
 notifies :reload, "service[php5-fpm]"
end
