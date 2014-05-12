# == Class: php::apache::config
#
# Configure php.ini settings for a PHP SAPI
#
# === Parameters
#
# [*file*]
#   The path to ini file
#
# [*config*]
#   Array of augeas commands, one command per entry
#
# === Variables
#
# No variables
#
# === Examples
#
# TODO
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2013 Christian "Jippi" Winther, unless otherwise noted.
#
define php::apache::config(
  $ensure   = 'present',
  $file     = $php::apache::params::inifile,
  $config   = undef,
  $setting  = undef,
  $section  = 'PHP',
  $value    = undef,
) {

  include ::php::apache::params

  php::config { $title:
    ensure  => $ensure,
    file    => $file,
    config  => $config,
    section => $section,
    setting => $setting,
    value   => $value,
    notify  => Service[$php::apache::params::service_name],
    source  => 'apache',
  }

}
