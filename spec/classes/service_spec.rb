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

      it 'manages the remote_syslog2 service' do
        is_expected.to contain_service('remote_syslog2').with(
          ensure: 'running',
          provider: 'systemd',
        )
      end
    end
  end
end
