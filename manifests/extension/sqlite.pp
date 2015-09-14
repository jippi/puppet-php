# == Class: php::extension::sqlite
#
# Install the PHP sqlite extension
#
# === Parameters
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
# [*pdo_inifile*]
#   The path to the pdo extension ini file
#
# [*settings*]
#   Hash with 'set' nested hash of key => value
#   set changes to agues when applied to *inifile*
#
# [*pdo_settings*]
#   Hash with 'set' nested hash of key => value
#   set changes to agues when applied to *pdo_inifile*
#
# === Variables
#
# No variables
#
# === Examples
#
#  include 'php::extension::sqlite'
#
#  class {'php::extension::sqlite':
#   ensure => latest
#  }
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::sqlite(
  $ensure       = $php::extension::sqlite::params::ensure,
  $package      = $php::extension::sqlite::params::package,
  $provider     = $php::extension::sqlite::params::provider,
  $inifile      = $php::extension::sqlite::params::inifile,
  $pdo_inifile  = $php::extension::sqlite::params::pdo_inifile,
  $settings     = $php::extension::sqlite::params::settings,
  $pdo_settings = $php::extension::sqlite::params::pdo_settings
) inherits php::extension::sqlite::params {

  php::extension { 'sqlite':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-sqlite':
    file   => $inifile,
    config => $settings
  }
  php::config { 'php-extension-pdo_sqlite':
    file   => $pdo_inifile,
    config => $pdo_settings
  }
}
