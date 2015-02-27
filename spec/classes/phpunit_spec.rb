require 'spec_helper'

describe 'php::phpunit', :type => :class do
  let :pre_condition do
    'include "php::cli"'
  end
  context 'default install' do
    default_destination = '/usr/local/bin/phpunit'
    default_source = 'https://phar.phpunit.de/phpunit.phar'
    it { should contain_exec('download phpunit').with({
                                                          'creates' => default_destination,
                                                          'command' => "wget #{default_source} -O #{default_destination}"
                                                      })
      # .that_requires("Package['php5-cli']").that_comes_before("File[#{default_destination}")
    }
    it { should contain_exec('download phpunit').that_requires('Package[php5-cli]') }
    it { should contain_exec('download phpunit').that_comes_before("File[#{default_destination}]") }
    it { should contain_file(default_destination).with({
                                                           'ensure' => 'present',
                                                           'mode' => '0555',
                                                           'owner' => 'root',
                                                           'group' => 'root'
                                                       })
    }

  end
end
