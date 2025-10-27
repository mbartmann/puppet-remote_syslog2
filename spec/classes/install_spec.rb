require 'spec_helper'

describe 'remote_syslog2' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) do
        {
          destination_port: 514,
          files: ['/var/log/messages'],
        }
      end

      it 'extracts the remote_syslog2 archive' do
        is_expected.to contain_exec('unzip_remote_syslog2').with(
          command: 'tar -zxf /tmp/remote_syslog2.tar.gz',
          cwd: '/usr/local/bin',
          creates: '/usr/local/bin/remote_syslog',
        )
      end
    end
  end
end
