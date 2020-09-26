require 'spec_helper'

describe 'htpasswd' do
  platform 'ubuntu'

  step_into :htpasswd

  platform 'ubuntu'

  context 'add' do
    recipe do
      htpasswd '/tmp/add' do
        user 'foo'
        password 'bar'
      end
    end

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

    it { is_expected.to create_file('/tmp/overwrite').with(mode: '0644') }
  end

  context 'delete' do
    recipe do
      htpasswd '/tmp/delete' do
        user 'foo'
        action :delete
      end
    end

    it { is_expected.to create_file('/tmp/delete').with(mode: '0640') }
  end
end
