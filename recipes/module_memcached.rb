#
# Cookbook Name:: promet_php
# Recipe:: module_memcached
#
# Copyright 2013, Promet Solutions, Inc.
#
# All rights reserved - Redistribute
#

#dependency for PECL memcached
%w{pkg-config libmemcached-dev libsasl2-2 sasl2-bin libsasl2-2 libsasl2-dev libsasl2-modules}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

#php_pear "memcached" do
#  action :install
#end

ark 'memcached' do
  url 'http://pecl.php.net/get/memcached-2.2.0.tgz'
  make_opts [ '--disable-memcached-sasl' ]
  action :install_with_make
end

template "/etc/php5/conf.d/memcached.ini" do
 source "memcached.ini.erb"
 owner "root"
 group 0
 mode 00644
# notifies :reload, "service[apache2]"
# notifies :reload, "service[memcached]"
end
