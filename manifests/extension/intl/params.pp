# == Class: php::extension::curl::params
#
# Defaults file for the curl PHP extension
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
# Christian Winther <cw@nodes.dk>
#
# === Copyright
#
# Copyright 2012-2015 Nodes, unless otherwise noted.
#
class php::extension::intl::params {

  $ensure   = $php::params::ensure
  $provider = undef
  $inifile  = "${php::params::config_root_ini}/intl.ini"
  $settings = [ ]

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9') >= 0) {
            $package        = 'php7.0-intl'
          } else {
            $package        = 'php5-intl'
          }
        }
        default: {
          $package      = 'php7.0-intl'
        }
      }
    }
    default: {
      $package      = 'php7.0-intl'
    }
  }
}
