require 'spec_helper'

describe 'php::fpm::package', :type => :class do
  context 'with package_name => php7.0-fpm' do
    let(:params) { {:package_name => 'php7.0-fpm', :package_ensure => 'installed'} }
    it { should contain_package('php7.0-fpm') }
  end
end
