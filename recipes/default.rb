#
# Cookbook Name:: gatherit
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git "#{Chef::Config[:file_cache_path]}/gatherit" do
  repository node['gatherit']['git_repository']
  revision node['gatherit']['git_revision']
  action :sync
end

directory "#{node['gatherit']['base_path']}/bin" do
  group node['gatherit']['group']
  owner node['gatherit']['user']
  mode 0755
  not_if { ::File.directory?("#{node['gatherit']['base_path']}/bin") }
end

file "#{node['gatherit']['base_path']}/bin/gather" do
  content lazy { IO.read("#{Chef::Config[:file_cache_path]}/gatherit/gather.pl.in")
                 .gsub(/@(PERL|CONFILE|MAPFILE|DATADIR)@/,
                       '@PERL@' => '/usr/bin/perl',
                       '@CONFILE@' => "'#{node['gatherit']['conf_dir']}/gather.cfg'",
                       '@MAPFILE@' => "'#{node['gatherit']['conf_dir']}/gather.map'",
                       '@DATADIR@' => "'#{node['gatherit']['data_dir']}'")
  }
  group node['gatherit']['group']
  owner node['gatherit']['user']
  mode 0755
end

directory File.dirname(node['gatherit']['conf_dir']) do
  group node['gatherit']['group']
  owner node['gatherit']['user']
  mode 0755
  not_if { ::File.directory?(node['gatherit']['conf_dir']) }
end

file "#{node['gatherit']['conf_dir']}/gather.cfg" do
  content lazy { IO.read("#{Chef::Config[:file_cache_path]}/gatherit/gather.cfg") }
  group node['gatherit']['group']
  owner node['gatherit']['user']
  mode 0644
end

file "#{node['gatherit']['conf_dir']}/gather.map" do
  content lazy { IO.read("#{Chef::Config[:file_cache_path]}/gatherit/examples/gather.map.#{node['os']}") }
  group node['gatherit']['group']
  owner node['gatherit']['user']
  mode 0644
end
