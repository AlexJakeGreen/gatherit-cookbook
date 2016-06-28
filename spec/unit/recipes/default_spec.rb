# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'rspec_helper'
require 'chefspec'

describe 'gatherit::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      file_cache_path: '/var/chef/cache'
    ).converge(described_recipe)
  end

  it 'syncs a git with default action' do
    expect(chef_run).to sync_git('/var/chef/cache/gatherit')
  end

  it 'ensures the directory /usr/local/etc is created' do
    allow(File).to receive(:directory?).and_call_original
    allow(File).to receive(:directory?).with('/usr/local/etc').and_return(false)
    expect(chef_run).to create_directory('/usr/local/etc')
  end

  it 'ensures the directory /usr/local/bin is created' do
    allow(File).to receive(:directory?).and_call_original
    allow(File).to receive(:directory?).with('/usr/local/bin').and_return(false)
    expect(chef_run).to create_directory('/usr/local/bin')
  end

  it 'copies the executable file' do
    expect(chef_run).to create_file('/usr/local/bin/gather')
      .with(user: 'root', owner: 'root', mode: 0755)
  end

  it 'creates configuration file' do
    expect(chef_run).to create_file('/usr/local/etc/gather.cfg')
  end

  it 'creates a map file from template' do
    expect(chef_run).to create_template('/usr/local/etc/gather.map')
  end
end
