#
# Cookbook Name:: promet_php
# Recipe:: module_memcached
#
# Copyright 2013, Promet Solutions, Inc.
#
# All rights reserved - Redistribute
#
# rhel/centos dependency
case node['platform_family']
when 'rhel', 'fedora'
  %w{ zlib-devel }.each do |pkg|
    package pkg do
      action :install
    end
  end
when 'debian'
#do nothing
end

php_pear "memcache" do
  action :install
end
