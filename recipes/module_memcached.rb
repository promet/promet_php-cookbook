#
# Cookbook Name:: promet_php
# Recipe:: module_memcached
#
# Copyright 2013, Promet Solutions, Inc.
#
# All rights reserved - Redistribute
#

php_pear "memcache" do
  action :install
end
