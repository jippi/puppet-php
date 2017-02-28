# == Class: php::cli::params
#
# Defaults file for CLI package
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
# [*inifile*]
#   The path to the ini php5 apache ini file
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
class php::cli::params {

  $ensure   = $php::params::ensure
  $provider = undef
  $settings = [ ]

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9') >= 0) {
            $inifile        = '/etc/php/7.0/cli/php.ini'
            $package        = 'php7.0-cli'
          } else {
            $inifile        = '/etc/php5/cli/php.ini'
            $package        = 'php5-cli'
          }
        }
        default: {
          $inifile      = '/etc/php/7.0/cli/php.ini'
          $package      = 'php7.0-cli'
        }
      }
    }
    default: {
      $inifile      = '/etc/php/7.0/cli/php.ini'
      $package      = 'php7.0-cli'
    }
  }
}
