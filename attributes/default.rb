# -*- mode: ruby -*-
# vi: set ft=ruby :

default['gatherit']['git_repository'] = 'https://github.com/trociny/gatherit.git'
default['gatherit']['git_revision'] = 'HEAD'
default['gatherit']['base_path'] = '/usr/local'
default['gatherit']['conf_dir'] = "#{node['gatherit']['base_path']}/etc"
default['gatherit']['data_dir'] = '/var/db/gather'
default['gatherit']['user'] = 'root'
default['gatherit']['owner'] = 'root'

default['gatherit']['checks'] = {
  # TODO: implement it as a DSL like this:
  # gather_check 'df' do
  #   description 'df output'
  #   command '/bin/df'
  # end
  'df' => {
    description: 'df output',
    command: '/bin/df'
  },
  'diskstats' => {
    description: '/proc/diskstats output',
    command: 'cat /proc/diskstats'
  },
  'interrupts' => {
    description: '/proc/interrupts output',
    command: 'cat /proc/interrupts'
  },
  'meminfo' => {
    description: '/proc/meminfo output',
    command: 'cat /proc/meminfo'
  },
  'netstat-a' => {
    description: 'netstat socket statistics',
    command: '/bin/netstat -na'
  },
  'netstat-i' => {
    description: 'netstat interface statistics',
    command: '/bin/netstat -ni'
  },
  'netstat-r' => {
    description: 'netstat routing tables',
    command: '/bin/netstat -nr'
  },
  'netstat-s' => {
    description: 'netstat system wide statistics',
    command: '/bin/netstat -s'
  },
  'proc-stat' => {
    description: '/proc/stat output',
    command: 'cat /proc/stat'
  },
  'proc-vmstat' => {
    description: '/proc/vmstat output',
    command: 'cat /proc/vmstat'
  },
  'ps' => {
    description: 'processes statistics',
    command: '/bin/ps auxww'
  },
  'sysctl' => {
    description: 'sysctl variables',
    command: '/sbin/sysctl -a'
  },
  'uptime' => {
    description: 'system uptime',
    command: '/usr/bin/uptime'
  },
  'top' => {
    description: 'top output',
    command: '/usr/bin/top -b -n1'
  },
  'slabinfo' => {
    description: '/proc/slabinfo output',
    command: 'cat /proc/slabinfo'
  },
  'vmstat' => {
    description: 'vmstat output',
    command: '/usr/bin/vmstat'
  },
  'vmstat-s' => {
    description: 'vmstat vm statistics',
    command: '/usr/bin/vmstat -s'
  },
  'vmstat-m' => {
    description: 'vmstat slabinfo statistics',
    command: '/usr/bin/vmstat -m'
  }
}
