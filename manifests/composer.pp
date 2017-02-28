# == Class: php::composer
#
# Install composer package manager
#
# === Parameters
#
# [*source*]
# Holds URL to the Composer source file
#
# [*destination*]
# Holds path to the Composer executable
#
# === Variables
#
# No variables
#
# === Examples
#
#  include php::composer
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::composer (
  $cli_package  = $php::composer::params::cli_package,
  $source       = $php::composer::params::source,
  $destination  = $php::composer::params::destination
) inherits php::composer::params {

  exec { 'download composer':
    command => "wget ${source} -O ${destination}",
    creates => $destination,
    path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
    require => [
      Package[$cli_package]
    ]
  }

  file { $destination:
    mode    => '0555',
    owner   => root,
    group   => root,
    require => Exec['download composer'],
  }
}
