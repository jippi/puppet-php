# == Class: php::extension::xdebug::params
#
# Defaults file for the xdebug PHP extension
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
# [*install_dir*]
#   The path of the installed xdebug.so binary
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
class php::extension::xdebug::params {

  $ensure      = $php::params::ensure
  $provider    = undef
  $inifile     = "${php::params::config_root_ini}/xdebug.ini"

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9') >= 0) {
            $install_dir    = "/usr/lib/php/${::php_extension_version}"
            $package        = 'php-xdebug'
          } else {
            $install_dir    = "/usr/lib/php5/${::php_extension_version}"
            $package        = 'php5-xdebug'
          }
        }
        default: {
          $install_dir  = "/usr/lib/php/${::php_extension_version}"
          $package      = 'php-xdebug'
        }
      }
    }
    default: {
      $install_dir  = "/usr/lib/php/${::php_extension_version}"
      $package      = 'php-xdebug'
    }
  }

  $settings    = [
    "set .anon/zend_extension '${install_dir}/xdebug.so'"
  ]
}
