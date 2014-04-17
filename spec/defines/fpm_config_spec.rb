require 'spec_helper'

describe 'php::fpm::config', :type => :define do
  let :pre_condition do
    'include "php::fpm"'
  end

  context 'valid config' do
    let(:title) { 'unique-name' }
    let(:params) {{
      :file   => '/etc/php5/fpm/conf.d/unique-name.ini',
      :config  => ['set .anon/apc.enabled 1'],
    }}

    it { should contain_php__fpm__config('unique-name')
      .with({
        'file'    => '/etc/php5/fpm/conf.d/unique-name.ini',
        'config'  => ['set .anon/apc.enabled 1']
      })
    }

    it { should contain_php__config('unique-name')
      .with({
        'file'    => '/etc/php5/fpm/conf.d/unique-name.ini',
        'config'  => ['set .anon/apc.enabled 1'],
        'notify'  => 'Service[php5-fpm]',
      })
    }

    it { should contain_augeas("php-fpm-unique-name-config")
      .with({
        'incl'    => '/etc/php5/fpm/conf.d/unique-name.ini',
        'changes' => "set .anon/apc.enabled 1"
      })
    }

  end

  context 'invalid config (string)' do
    let(:title) { 'unique-name' }
    let(:params) {{
      :file => '/etc/php5/fpm/conf.d/unique-name.ini',
      :config => 'hello world'
    }}

    it { expect { should raise_error(Puppet::Error) }}
  end

  context 'dwim config style' do
    let(:title) { 'upload_max_filesize=20M' }

    it { should contain_php__config('upload_max_filesize=20M').with({
      'ensure'  => 'present',
      'file'    => '/etc/php5/fpm/php.ini',
      'section' => 'PHP',
    } )}

    it { should contain_ini_setting('upload_max_filesize=20M in /etc/php5/fpm/php.ini').with({
      'ensure'  => 'present',
      'path'    => '/etc/php5/fpm/php.ini',
      'section' => 'PHP',
      'setting' => 'upload_max_filesize',
      'value'   => '20M',
    } )}
  end

end
