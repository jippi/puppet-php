# == Class: php::extension::apc::params
#
# Defaults file for the APC PHP extension
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
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::apc::params {

  $ensure   = $php::params::ensure
  $provider = undef
  $inifile  = "${php::params::config_root_ini}/apc.ini"
  $settings = [ ]

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '8') >= 0) {
            $package        = 'php-apcu'
          } else {
            $package        = 'php-apc'
          }
        }
        default: {
          $package      = 'php-apcu'
        }
      }
    }
    default: {
      $package      = 'php-apcu'
    }
  }
}
