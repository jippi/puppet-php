require 'spec_helper'

describe 'php::fpm', :type => :class do
  it { should contain_class('php::fpm::package') }
  it { should contain_class('php::fpm::service').that_requires('Package[php5-fpm]') }
  it { should contain_php__fpm__config('php-fpm').that_requires('Package[php5-fpm]') }
  it { should contain_file('/etc/php5/fpm/php-fpm.conf').that_requires('Package[php5-fpm]') }
end
