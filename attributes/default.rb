# -*- mode: ruby -*-
# vi: set ft=ruby :

default['gatherit']['git_repository'] = 'https://github.com/trociny/gatherit.git'
default['gatherit']['git_revision'] = 'HEAD'
default['gatherit']['base_path'] = '/usr/local'
default['gatherit']['conf_dir'] = "#{node['gatherit']['base_path']}/etc"
default['gatherit']['data_dir'] = '/var/db/gather'
default['gatherit']['user'] = 'root'
default['gatherit']['owner'] = 'root'
