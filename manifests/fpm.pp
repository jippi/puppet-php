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
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::fpm(
  $ensure             = $php::fpm::params::ensure,
  $package            = $php::fpm::params::package,
  $provider           = $php::fpm::params::provider,
  $inifile            = $php::fpm::params::inifile,
  $settings           = $php::fpm::params::settings,
  $service_name       = $php::fpm::params::service_name,
  $service_ensure     = $php::fpm::params::service_ensure,
  $service_enable     = $php::fpm::params::service_enable,
  $service_has_status = $php::fpm::params::service_has_status,
  $service_provider   = $php::fpm::params::service_provider,

  # settings for php-fpm.conf
  $pid                          = $php::fpm::params::pid,
  $error_log                    = $php::fpm::params::error_log,
  $syslog_facility              = $php::fpm::params::syslog_facility,
  $syslog_ident                 = $php::fpm::params::syslog_ident,
  $log_level                    = $php::fpm::params::log_level,
  $emergency_restart_threshold  = $php::fpm::params::emergency_restart_threshold,
  $emergency_restart_interval   = $php::fpm::params::emergency_restart_interval,
  $process_control_timeout      = $php::fpm::params::process_control_timeout,
  $process_max                  = $php::fpm::params::process_max,
  $process_priority             = $php::fpm::params::process_priority,
  $rlimit_files                 = $php::fpm::params::rlimit_files,
  $rlimit_core                  = $php::fpm::params::rlimit_core,
  $events_mechanism             = $php::fpm::params::events_mechanism,

) inherits php::fpm::params {

  class  { 'php::fpm::package':
    package_name     => $package,
    package_ensure   => $ensure,
    package_provider => $provider
  }

  class  { 'php::fpm::service':
    ensure       => $service_ensure,
    service_name => $service_name,
    provider     => $service_provider,
    enable       => $service_enable,
    has_status   => $service_has_status,
    require      => Package[$package]
  }

  php::fpm::config { 'php-fpm':
    file    => $inifile,
    config  => $settings,
    service_name => $service_name,
    require => Package[$package]
  }

  file { '/etc/php5/fpm/php-fpm.conf':
    notify  => Service[$service_name],
    content => template('php/fpm/php-fpm.conf.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package[$package]
  }

}
