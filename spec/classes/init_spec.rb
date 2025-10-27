require 'spec_helper'

describe 'remote_syslog2' do
  on_supported_os.each do |os, os_facts|
    context "on #{os} with defaults" do
      let(:facts) { os_facts }
      let(:params) do
        {
          destination_port: 51_462,
          files: ['/var/log/messages'],
        }
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('remote_syslog2::install') }
      it { is_expected.to contain_class('remote_syslog2::config') }
      it { is_expected.to contain_class('remote_syslog2::service') }
    end
  end
end
