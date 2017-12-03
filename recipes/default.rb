#
# Cookbook:: segulja_dns
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'segulja_dns::server'
include_recipe 'segulja_dns::client'
