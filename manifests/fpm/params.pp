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
  $package            = 'php5-fpm'
  $provider           = undef
  $inifile            = '/etc/php5/fpm/php.ini'
  $settings           = [ ]

  $service_name       = 'php5-fpm'
  $service_ensure     = 'running'
  $service_enable     = true
  $service_has_status = true
  $service_provider   = undef

  # default params for php-fpm.conf, ported from php::fpm::daemon
  $pid                          = '/var/run/php5-fpm.pid'
  $error_log                    = '/var/log/php5-fpm.log'
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

}
