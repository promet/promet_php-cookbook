#
# Cookbook Name:: promet_php
# Recipe:: module_mcrypt 
#
# Copyright 2013, Promet Solutions, Inc.
#
# All rights reserved - Redistribute
#

pkg = value_for_platform(
  %w(centos redhat scientific fedora amazon) => {
    %w(5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8) => "php53-mcrypt",
    "default" => "php-mcrypt"
  },
  "default" => "php5-mcrypt"
)

package pkg do
  action :install
end
