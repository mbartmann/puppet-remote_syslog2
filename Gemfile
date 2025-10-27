source "https://rubygems.org"

ruby '>= 3.2.0', '< 3.3.0'

puppetversion = if ENV.key?('PUPPET_VERSION')
                  ENV['PUPPET_VERSION']
                else
                  '~> 8.0'
                end

gem 'json'
gem 'puppet'                 , puppetversion
gem 'puppet-lint'            , '~> 4.0'
gem 'puppetlabs_spec_helper' , '~> 6.0'
gem 'rspec'                  , '~> 3.12'
gem 'rspec-puppet'           , '~> 4.0'
gem 'rspec-puppet-facts'     , '~> 6.0', :require => false
gem 'metadata-json-lint'     , '~> 3.0'
gem 'simplecov'              , :require => false
