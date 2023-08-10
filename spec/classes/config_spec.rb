require 'spec_helper'

describe 'remote_syslog2::config' do
  on_supported_os.each do |os, os_facts|
    let(:facts) { os_facts }

    context "on #{os}" do
      it { should contain_file('/etc/log_files.yml') }
    end

    case os_facts[:operatingsystem]
    when 'Ubuntu'
      it { should contain_file('/etc/init/remote_syslog2.conf').with({
          'content' => /pre-start exec/})
      }
    when ''
      it { should contain_file('/etc/init.d/remote_syslog2').with({
          'content' => /### BEGIN INIT INFO/})
      }
    end
  end
end
