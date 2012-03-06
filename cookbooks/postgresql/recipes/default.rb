#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "postgresql-9.1" do
  options  "-t squeeze-backports"
  action :install
end

execute "libpq-dev" do
  command "sudo apt-get install libpq-dev -y -q -t squeeze-backports"
  action :run
end

service "postgresql" do
  supports :status => true, :restart => true, :reload => true
  action :start
end