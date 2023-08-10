require 'spec_helper'

describe 'remote_syslog2::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      case os_facts[:operatingsystem]
      when 'Ubuntu'
        it { should contain_file('/etc/init/remote_syslog2.conf').with({
            'content' => /pre-start exec/})
        }
        describe 'on Ubuntu use upstart' do
          it { should contain_service('remote_syslog2').with(
            :ensure   => 'running',
            :provider => 'upstart',
          )}
        end
      end
    end
  end
end