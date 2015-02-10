# == Class: php::phpunit
#
# Install phpunit, PHP testing framework
#
# === Parameters
#
# No parameters
#
# === Variables
#
# No variables
#
# === Examples
#
#  include php::phpunit
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
# Tobias Nyholm <tobias@happyrecruiting.se>
# Weston Ruter <weston@xwp.co>
#
# === Copyright
#
# Copyright 2012-2013 Christian "Jippi" Winther, unless otherwise noted.
#

class php::phpunit (
  $source = $php::phpunit::params::source,
  $destination = $php::phpunit::params::destination
) inherits php::phpunit::params {

  exec { 'download phpunit':
    command => "wget ${source} -O ${destination}",
    creates => $destination,
    path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
    require => [
      Package['php5-cli']
    ]
  }

  file { $destination:
    mode    => '0555',
    owner   => root,
    group   => root,
    require => Exec['download phpunit'],
  }

}
