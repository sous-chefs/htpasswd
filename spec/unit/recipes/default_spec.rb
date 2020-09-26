require 'spec_helper'

describe 'htpasswd::default' do
  platform 'ubuntu'

  it { is_expected.to install_build_essential('htpasswd').with(compile_time: true) }
  it { is_expected.to install_chef_gem('htauth').with(compile_time: true) }
end
