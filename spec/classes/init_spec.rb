require 'spec_helper'

describe 'remote_syslog2' do
  on_supported_os.each do |os, os_facts|
    let(:facts) { os_facts }

    context "on #{os} with defaults" do
      it { should contain_class('remote_syslog2::install') }
      it { should contain_class('remote_syslog2::config') }
      it { should contain_class('remote_syslog2::service') }
    end
  end
end