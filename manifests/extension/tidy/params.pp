# == Class: php::extension::tidy::params
#
# Defaults file for the tidy PHP extension
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
#   The package name in your provider
#
# [*provider*]
#   The provider used to install the package
#
# [*inifile*]
#   The path to the extension ini file
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
# Goran Miskovic <schkovich@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::tidy::params {

  $ensure   = $php::params::ensure
  $provider = undef
  $inifile  = "${php::params::config_root_ini}/tidy.ini"
  $settings = [ ]

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9') >= 0) {
            $package        = 'php7.0-tidy'
          } else {
            $package        = 'php5-tidy'
          }
        }
        default: {
          $package      = 'php7.0-tidy'
        }
      }
    }
    default: {
      $package      = 'php7.0-tidy'
    }
  }
}
