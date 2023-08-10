require 'spec_helper'

describe 'remote_syslog2::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { should contain_exec('unzip_remote_syslog2').with(
        command: 'tar -zxf /tmp/remote_syslog2.tar.gz',
        cwd: '/usr/local/bin',
        creates: '/usr/local/bin/remote_syslog'
      ) }
    end
  end
end
