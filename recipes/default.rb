#
# Cookbook Name:: gatherit
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# default['gatherit']['url'] = 'git@github.com:trociny/gatherit.git'

git "#{Chef::Config[:file_cache_path]}/gatherit" do
  repository node['gatherit']['git_repository']
  revision node['gatherit']['git_revision']
  action :sync
end

execute 'make gather' do
  command "make clean; make"
  cwd "#{Chef::Config[:file_cache_path]}/gatherit"
end

file "/usr/local/bin/gather" do
  content lazy { IO.read("#{Chef::Config[:file_cache_path]}/gatherit/gather") }
  group 'root'
  owner 'root'
  mode 0755
end

directory '/usr/local/etc/gather' do
  owner 'root'
  group 'root'
  mode 0755
end

file '/usr/local/etc/gather/gather.cfg' do
  content lazy { IO.read("#{Chef::Config[:file_cache_path]}/gatherit/gather.cfg") }
  group 'root'
  owner 'root'
  mode 0644
end

file '/usr/local/etc/gather/gather.map' do
  content lazy { IO.read("#{Chef::Config[:file_cache_path]}/gatherit/gather.map") }
  group 'root'
  owner 'root'
  mode 0644  
end
