# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'

at_exit { ChefSpec::Coverage.report! }
