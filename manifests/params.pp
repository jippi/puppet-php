# == Class: php::params
#
# PHP params class
#
# Configuration class for php module
#
# === Parameters
#
# No parameters
#
# === Variables
#
# [*ensure*]
#   The PHP ensure of PHP to install
#
# === Examples
#
#  include php::dev
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2013 Christian "Jippi" Winther, unless otherwise noted.
#
class php::params {

  case $::operatingsystem {
    'opensuse': {
      $basepkgname       = 'php5'
      $augeausbasedir    = '/usr/share/libaugeas0/augeas/lenses'
    }
    default: {
      $basepkgname       = 'php5-common'
      $augeausbasedir    = '/usr/share/augeas/lenses'
    }
  }

  $ensure      = "installed"

}
