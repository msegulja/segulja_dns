#
# Cookbook:: segulja_dns
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.

packages = %w(bind bind-utils)

packages.each do |pkg|
  package pkg do
    action :install
  end
end

directory '/etc/named/zones' do
  owner    'root'
  group    'named'
  mode     '0770'
  action   :create
  notifies :restart, 'service[named]', :immediately
end

template '/etc/named/zones/db.segulja.com' do
  source   'db.segulja.com.erb'
  owner    'root'
  group    'named'
  mode     '0640'
  action   :create
  notifies :restart, 'service[named]', :immediately
end

template '/etc/named/zones/db.172.16.20' do
  source   'db.172.16.20.erb'
  owner    'root'
  group    'named'
  mode     '0640'
  action   :create
  notifies :restart, 'service[named]', :immediately
end

template '/etc/named.conf' do
  source   'named.conf.erb'
  owner    'root'
  group    'named'
  mode     '0640'
  action   :create
  notifies :restart, 'service[named]', :immediately
end

service 'named' do
  action [:enable, :start]
end
