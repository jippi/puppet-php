# == Class: php::extension::ldap::params
#
# Defaults file for the ldap PHP extension
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
# Arthur Andersen <leoc.git@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Nodes, unless otherwise noted.
#
class php::extension::ldap::params {

  $ensure   = $php::params::ensure
  $provider = undef
  $inifile  = '/etc/php/7.0/conf.d/20-ldap.ini'
  $settings = []

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9') >= 0) {
            $package        = 'php7.0-ldap'
          } else {
            $package        = 'php5-ldap'
          }
        }
        default: {
          $package      = 'php7.0-ldap'
        }
      }
    }
    default: {
      $package      = 'php7.0-ldap'
    }
  }
}
