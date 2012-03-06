#
# Cookbook Name:: backports
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
apt_repository "squeeze-backports" do
  uri "http://backports.debian.org/debian-backports"
  distribution "squeeze-backports"
  components ["main", "non-free"]
  action :add
end

execute "apt-get update" do
  user "root"
  command "apt-get update -y"
  action :run
end