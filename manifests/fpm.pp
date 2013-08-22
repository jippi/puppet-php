# == Class: php::fpm
#
# Install and configure mod_php for fpm
#
# === Parameters
#
# [*ensure*]
#   The ensure of the fpm package to install
#   Could be "latest", "installed" or a pinned verison
#
# [*package*]
#   The package name for fpm package
#   For debian it's php5-fpm
#
# [*provider*]
#   The provider used to install php5-fpm
#   Could be "pecl", "apt" or any other OS package provider
#
# [*inifile*]
#   The path to the ini php5-fpm ini file
#
# [*settings*]
#   Hash with 'set' nested hash of key => value
#   set changes to agues when applied to *inifile*
#
# Template options for global fpm config 
# [*log_level*]
# [*emergency_restart_threshold*]
# [*emergency_restart_interval*] 
# [*process_control_timeout*]
# [*log_owner*]
# [*log_group*]
# [*log_dir_mode*]

# === Variables
#
# No variables
#
# === Examples
#
#  include php::fpm
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2013 Christian "Jippi" Winther, unless otherwise noted.
#
class php::fpm(
  $ensure   = $php::fpm::params::ensure,
  $package  = $php::fpm::params::package,
  $provider = $php::fpm::params::provider,
  $inifile  = $php::fpm::params::inifile,
  $settings = $php::fpm::params::settings,

  $log_level                    = 'notice',
  $emergency_restart_threshold  = '0',
  $emergency_restart_interval   = '0',
  $process_control_timeout      = '0',
  $log_owner                    = 'root',
  $log_group                    = false,
  $log_dir_mode                 = '0770'
) inherits php::fpm::params {


 # Hack-ish to default to user for group too
  $log_group_final = $log_group ? {
    false   => $log_owner,
    default => $log_group,
  }

  package { $package:
    ensure   => $ensure,
    provider => $provider;
  }

  php::config { 'php-fpm':
    inifile  => $inifile,
    settings => $settings
  }

  service { 'php5-fpm':
    name      => $php::fpm::params::fpmservicename,
    ensure    => $ensure ? { absent => stopped, default => running, },
    enable    => $ensure ? { absent => false, default => true, },
    restart   => "service ${php::fpm::params::fpmservicename} reload",
    hasstatus => true,
    require   => [ Package[$package], File['/etc/php5/fpm/php-fpm.conf'], Php::Config['php-fpm'], ]
  }

  file { '/etc/php5/fpm/php-fpm.conf':
    ensure  => $ensure ? { absent => absent, default => file },
    notify  => Service['php5-fpm'],
    content => template('php/fpm/php-fpm.conf.erb'),
    owner   => root,
    group   => root,
    mode    => 0644,
    require => [ Package['php5-fpm'], File[$php::fpm::params::poolincdir], ]
  }

  file { $php::fpm::params::poolincdir:
    ensure  => $ensure ? { absent => absent, default => directory },
  }

}
