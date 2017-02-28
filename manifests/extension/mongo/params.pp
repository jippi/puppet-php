# == Class: php::extension::mongo::params
#
# Defaults file for the mongo PHP extension
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
# Davide "SbiellONE" Bellettini <davide@bellettini.me>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::mongo::params {

  $ensure   = $php::params::ensure
  $package  = undef
  $provider = undef
  $inifile  = "${php::params::config_root_ini}/mongo.ini"
  $settings = undef

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9') >= 0) {
            $package    = 'php-mongodb'
            $settings   = []
          } else {
            $package    = 'mongo'
            $provider   = 'pecl'
            $settings   = [
                'set ".anon/extension" "mongo.so"'
            ]
          }
        }
        default: {
          $package      = 'php-mongodb'
          $settings     = []
        }
      }
    }
    default: {
      $package      = 'php-mongodb'
      $settings     = []
    }
  }
}
