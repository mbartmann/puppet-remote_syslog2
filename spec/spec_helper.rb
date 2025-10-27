require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'

include RspecPuppetFacts

if ENV['COVERAGE'] == 'yes'
  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
  end
end

RSpec.configure do |c|
  c.mock_with :rspec
end
