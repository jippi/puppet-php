# == Class: php::extension::http::params
#
# Defaults file for the http PHP extension
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
class php::extension::http::params {

  $ensure   = $php::params::ensure
  $package  = 'php7.0-http'
  $provider = undef
  $inifile  = "${php::params::config_root_ini}/http.ini"
  $settings = [ ]

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9') >= 0) {
            $package        = 'php-http'
          } else {
            warning('php::extension::http package does not exists on php5')
          }
        }
        default: {
          $package      = 'php-http'
        }
      }
    }
    default: {
      $package      = 'php-http'
    }
  }
}
