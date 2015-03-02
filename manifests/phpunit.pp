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
# Josh Betz <j@joshbetz.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#

class php::phpunit (
  $ensure      = $php::phpunit::params::ensure,
  $source      = $php::phpunit::params::source,
  $destination = $php::phpunit::params::destination
) inherits php::phpunit::params {

  $en = $ensure ? {
    'absent' => 'absent',
    default  => 'present',
  }

  if ( 'absent' != $en ) {
    exec { 'download phpunit':
      command => "wget ${source} -O ${destination}",
      creates => $destination,
      path    => [ '/bin', '/sbin' , '/usr/bin', '/usr/sbin' ],
      require => Package['php5-cli'],
      before  => File[$destination]
    }
  }

  file { $destination:
    ensure  => $en,
    mode    => '0555',
    owner   => root,
    group   => root
  }

}
