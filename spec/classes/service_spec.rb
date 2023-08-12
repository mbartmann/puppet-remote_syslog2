require 'spec_helper'

describe 'remote_syslog2::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      case os_facts[:operatingsystem]
      when 'Debian'
        describe 'on Debian use systemd' do
          it { should contain_service('remote_syslog2').with(
            :ensure   => 'running',
            :provider => 'systemd',
          )}
        end
      when 'Ubuntu'
        if (Puppet::Util::Package.versioncmp(os_facts[:operatingsystemrelease], '15.04') < 0)
          describe 'on Ubuntu < 15.04 use upstart' do
            it { should contain_service('remote_syslog2').with(
              :ensure   => 'running',
              :provider => 'upstart',
            )}
          end
        else
          describe 'on Ubuntu > 15.04 use systemd' do
            it { should contain_service('remote_syslog2').with(
              :ensure   => 'running',
              :provider => 'systemd',
            )}
          end
        end
      end
    end
  end
end