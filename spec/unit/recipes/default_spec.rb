# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'rspec_helper'
require 'chefspec'

describe 'gatherit::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'syncs a git with default action' do
    expect(chef_run).to sync_git("#{Chef::Config[:file_cache_path]}/gatherit")
    expect(chef_run).to_not sync_git('/tmp/not_default_action')
  end
  
  it 'runs make' do
    expect(chef_run).to run_execute('make gather')
  end
  
  it 'ensures the config directory exists' do
    expect(chef_run).to create_directory('/usr/local/etc/gather').with(
                          user: 'root',
                          owner: 'root',
                          mode: 0755)
  end
  
  it 'copies the executable file' do
    expect(chef_run).to create_file('/usr/local/bin/gather').with(
                          user: 'root',
                          owner: 'root',
                          mode: 0755)
  end

  it 'creates configuration files' do
    %w( gather.cfg gather.map ).each do |file| 
      expect(chef_run).to create_file("/usr/local/etc/gather/#{file}").with(
                            user: 'root',
                            owner: 'root',
                            mode: 0644)
    end
  end
end
