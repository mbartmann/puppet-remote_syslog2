source "https://rubygems.org"

if ENV.key?('PUPPET_VERSION')
  puppetversion = "#{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['~> 4.10.12']
end

gem 'json'
gem 'puppet'                 , puppetversion
gem 'puppet-lint'
gem 'puppetlabs_spec_helper' , '~> 4.0.1'
gem 'rspec'                  , '~> 3.12.0'
gem 'rspec-puppet'           , '~> 2.12.0'
gem 'rspec-puppet-facts'     , :require => false
gem 'metadata-json-lint'
gem 'simplecov'
