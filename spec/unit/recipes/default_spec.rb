require 'spec_helper'

describe 'htpasswd::default' do
  platform 'ubuntu'

  before do
    allow(Gem::Specification).to receive(:find_by_name).and_return(nil)
  end

  it { is_expected.to install_build_essential('htpasswd').with(compile_time: true) }
  it { is_expected.to install_chef_gem('htauth').with(compile_time: true) }
end
