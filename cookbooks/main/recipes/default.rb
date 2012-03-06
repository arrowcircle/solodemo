#
# Cookbook Name:: main
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "initial_update"
%w(build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion).each do |pkg|
  package pkg do
    action :install
  end
end

include_recipe 'rvm::user'
=begin
execute "install 1.9.3" do
  user "webmaster"
  command "bash -c 'source ~/.profile && rvm install 1.9.3 && rvm use 1.9.3 --default'"
  #command "rvm use 1.9.3 --default"
  action :run
end

rvm_default_ruby "1.9.3@global" do
  user 'webmaster'
  action :create
end
=end

=begin

execute "install RVM" do
  user "webmaster"
  command "bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )"
  action :run
end


=end
#include_recipe "rvm"
#include_recipe "gems"
include_recipe "backports"
include_recipe "postgresql"
include_recipe "imagemagick"
