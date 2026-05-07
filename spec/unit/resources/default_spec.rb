# frozen_string_literal: true

require 'spec_helper'

describe 'htpasswd' do
  platform 'ubuntu'

  step_into :htpasswd

  context 'add' do
    recipe do
      htpasswd '/tmp/add' do
        user 'foo'
        password 'bar'
      end
    end

    it { is_expected.to install_build_essential('htpasswd gem dependencies') }
    it { is_expected.to install_chef_gem('htauth') }
    it { is_expected.to run_ruby_block('add htpasswd user foo to /tmp/add') }
    it { is_expected.to create_file('/tmp/add').with(mode: '0640') }
  end

  context 'overwrite' do
    recipe do
      htpasswd '/tmp/overwrite' do
        user 'foo'
        password 'bar'
        mode '0644'
        type 'crypt'
        action :overwrite
      end
    end

    it { is_expected.to install_build_essential('htpasswd gem dependencies') }
    it { is_expected.to install_chef_gem('htauth') }
    it { is_expected.to run_ruby_block('overwrite htpasswd file /tmp/overwrite with user foo') }
    it { is_expected.to create_file('/tmp/overwrite').with(mode: '0644') }
  end

  context 'delete when user is absent' do
    recipe do
      htpasswd '/tmp/delete' do
        user 'foo'
        action :delete
      end
    end

    it { is_expected.to install_build_essential('htpasswd gem dependencies') }
    it { is_expected.to install_chef_gem('htauth') }
    it { is_expected.not_to run_ruby_block('delete htpasswd user foo from /tmp/delete') }
    it { is_expected.not_to create_file('/tmp/delete') }
  end
end
