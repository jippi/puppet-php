# == Class: php::fpm::params
#
# Defaults file for fpm package
#
# === Parameters
#
# No parameters
#
# === Variables
#
# [*ensure*]
#   The version of the package to install
#   Could be "latest", "installed" or a pinned version
#   This matches "ensure" from Package
#
# [*package*]
#   The package name for fpm package
#
# [*provider*]
#   The provider used to install package
#
# [*inifile*]
#   The path to the ini php5 fpm ini file
#
# [*settings*]
#   Hash with 'set' nested hash of key => value
#   set changes to agues when applied to *inifile*
#
# === Examples
#
# No examples
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::fpm::params inherits php::params {

  $ensure             = $::php::params::ensure
  $provider           = undef
  $settings           = [ ]

  $service_ensure     = 'running'
  $service_enable     = true
  $service_has_status = true
  $service_provider   = undef

  # default params for php-fpm.conf, ported from php::fpm::daemon
  $fpm_config                   = "${::php::params::config_root}/fpm/php-fpm.conf"
  $inifile                      = "${::php::params::config_root}/fpm/php.ini"
  $syslog_facility              = undef
  $syslog_ident                 = undef
  $log_level                    = 'notice'
  $emergency_restart_threshold  = 0
  $emergency_restart_interval   = 0
  $process_control_timeout      = 0
  $process_max                  = undef
  $process_priority             = undef
  $daemonize                    = true
  $rlimit_files                 = 1024
  $rlimit_core                  = 0
  $events_mechanism             = undef

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9') >= 0) {
            $pid            = '/var/run/php7.0-fpm.pid'
            $error_log      = '/var/log/php7.0-fpm.log'
            $package        = 'php7.0-fpm'
            $service_name   = 'php7.0-fpm'
          } else {
            $pid            = '/var/run/php5-fpm.pid'
            $error_log      = '/var/log/php5-fpm.log'
            $package        = 'php5.0-fpm'
            $service_name   = 'php5.0-fpm'
          }
        }
        default: {
          $pid          = '/var/run/php7.0-fpm.pid'
          $error_log    = '/var/log/php7.0-fpm.log'
          $package      = 'php7.0-fpm'
          $service_name = 'php7.0-fpm'
        }
      }
    }
    default: {
      $pid          = '/var/run/php7.0-fpm.pid'
      $error_log    = '/var/log/php7.0-fpm.log'
      $inifile      = '/etc/php/7.0/fpm/php.ini'
      $package      = 'php7.0-fpm'
      $service_name = 'php7.0-fpm'
    }
  }
} 
