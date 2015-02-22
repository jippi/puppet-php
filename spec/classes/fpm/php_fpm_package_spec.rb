require 'spec_helper'

describe 'php::fpm::package', :type => :class do
  context 'with package_name => php5-fpm' do
    let(:params) { {:package_name => 'php5-fpm', :package_ensure => 'installed'} }
    it { should contain_package('php5-fpm') }
  end
end
