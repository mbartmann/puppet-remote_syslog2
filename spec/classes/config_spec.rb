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

      it { is_expected.to contain_file('/etc/log_files.yml').with_mode('0664') }

      it 'manages the systemd unit' do
        is_expected.to contain_file('/etc/systemd/system/remote_syslog2.service')
          .with_mode('0765')
          .with_content(%r{\[Unit\]})
      end
    end
  end
end
