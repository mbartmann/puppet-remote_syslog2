require 'spec_helper'

describe 'remote_syslog2::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { should contain_file('/etc/log_files.yml') }

      case os_facts[:operatingsystem]
      when 'Debian'
        it { should contain_file('/etc/systemd/system/remote_syslog2.service').with({
          'content' => /[Unit]/})
        }
      when 'Ubuntu'
        if (Puppet::Util::Package.versioncmp(os_facts[:operatingsystemrelease], '15.04') < 0)
          it { should contain_file('/etc/init/remote_syslog2.conf').with({
              'content' => /pre-start exec/})
          }
        else
          it { should contain_file('/etc/systemd/system/remote_syslog2.service').with({
              'content' => /[Unit]/})
          }
        end
      when ''
        it { should contain_file('/etc/init.d/remote_syslog2').with({
            'content' => /### BEGIN INIT INFO/})
        }
      end
    end
  end
end
