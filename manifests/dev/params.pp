# == Class: php::dev::params
#
# Defaults file for DEV package
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
#   The package name for apache package
#
# [*provider*]
#   The provider used to install package
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
class php::dev::params {

  $ensure   = $php::params::ensure
  $provider = undef

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9')) {
            $package        = 'php7.0-dev'
          } else {
            $package        = 'php5-dev'
          }
        }
        default: {
          $package      = 'php7.0-dev'
        }
      }
    }
    default: {
      $package      = 'php7.0-dev'
    }
  }
}
