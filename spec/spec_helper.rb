require 'rspec-puppet'
require 'rspec-puppet-facts'

include RspecPuppetFacts

# SimpleCov does not run on Ruby 1.8.7
unless RUBY_VERSION.to_f < 1.9
  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
  end
end

RSpec.configure do |c|
  c.module_path = File.expand_path(File.join(__FILE__, '..', 'fixtures', 'modules'))
  c.manifest_dir = File.expand_path(File.join(__FILE__, '..', 'fixtures', 'manifests'))
  c.mock_with :rspec
end
require 'puppetlabs_spec_helper/module_spec_helper'