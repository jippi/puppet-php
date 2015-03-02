# == Class: php::fpm::config
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
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#

define php::fpm::config(
  $ensure   = 'present',
  $file     = $::php::fpm::params::inifile,
  $config   = undef,
  $setting  = undef,
  $section  = 'PHP',
  $value    = undef,
  $service_name = $::php::fpm::params::service_name
) {
  include ::php::fpm::params

  php::config { $title:
    ensure  => $ensure,
    file    => $file,
    config  => $config,
    section => $section,
    setting => $setting,
    value   => $value,
    notify  => Service[$service_name],
    source  => 'fpm',
  }
}
