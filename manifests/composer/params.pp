# == Class: php::composer::params
#
# Defaults file for Composer package
#
# === Parameters
#
# No parameters
#
# === Variables
#
# [*max_age*]
#   Defines number of days after which Composer should be updated
#
# [*source*]
#   Defines URL to the Composer source file
#
# [*destination*]
#   Defines path to the Composer executable
#
# === Examples
#
# No examples
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
# Goran Miskovic <goran.v.miskovic[at]gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::composer::params {
  $max_age     = 30
  $source      = 'https://getcomposer.org/composer.phar'
  $destination = '/usr/local/bin/composer'

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9') >= 0) {
            $cli_package    = 'php7.0-cli'
          } else {
            $cli_package    = 'php5-cli'
          }
        }
        default: {
          $cli_package  = 'php7.0-cli'
        }
      }
    }
    default: {
      $cli_package  = 'php7.0-cli'
    }
  }
}
