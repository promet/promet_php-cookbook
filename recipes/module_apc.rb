#
# Cookbook Name:: promet_php
# Recipe:: module_apc
#
# Copyright 2013, Promet Solutions, Inc.
#
# All rights reserved - Redistribute
#
include_recipe "build-essential"
#dependency for PECL APC
case node['platform_family']
when 'rhel', 'fedora'
  %w{ httpd-devel pcre pcre-devel }.each do |pkg|
    package pkg do
      action :install
    end
  end
when 'debian'
  package "libpcre3-dev" do
    action :upgrade
  end
end

php_pear 'apc' do
  version '3.1.13'
  action :install
end

template "#{node['php']['ext_conf_dir']}/apc.ini" do
 source "apc.ini.erb"
 owner "root"
 group 0
 mode 00644
 if node["nginx"] == true
   notifies :reload, "#{node['promet_php']['fpm_pkg']}"
 end
 if node["apache"] == true
   notifies :reload, "#{node['promet_php']['fpm_pkg']}"
 end
end
