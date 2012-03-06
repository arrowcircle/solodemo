#
# Cookbook Name:: gems
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#create .gemrc
template "/home/webmaster/.gemrc" do
  owner "webmaster"
  mode 0644
  source ".gemrc"
end
=begin
bash "update gems" do
  user "webmaster"
  command "gem install bundler --pre"
end
=end