# == Class: php::extension::mysqlnd::params
#
# Defaults file for the native driver mysqlnd PHP extension
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
# Hermann Mayer <hermann.mayer92@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::mysqlnd::params {

  $ensure   = $php::params::ensure
  $provider = undef
  $inifile  = "${php::params::config_root_ini}/mysqlnd.ini"
  $settings = [ ]

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9')) {
            $package        = 'php7.0-mysqlnd'
          } else {
            $package        = 'php5-mysqlnd'
          }
        }
        default: {
          $package      = 'php7.0-mysqlnd'
        }
      }
    }
    default: {
      $package      = 'php7.0-mysqlnd'
    }
  }
}
