#
# Cookbook Name:: initial_update
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "apt-get upgrades" do
  user "root"
  command "apt-get update -y -q && apt-get upgrade -y -q && apt-get dist-upgrade -y -q"
  action :run
end

package "sudo" do
  action :install
end

user "webmaster" do
  supports :manage_home => true
  comment "webmaster"
  home "/home/webmaster"
  shell "/bin/bash"
  password "$1$8Dw5vkHO$epbgwU50434k2t4jzR5Wp/"
  action :create
  not_if("ls /home | grep webmaster")
end

execute "add webmaster to sudo group" do
  user "root"
  command "adduser webmaster sudo"
  action :run
end

template "/etc/sudoers" do
  mode 0440
  source "sudoers"
  action :create
end
