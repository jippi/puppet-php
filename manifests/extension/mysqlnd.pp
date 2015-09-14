# == Class: php::extension::mysqlnd
#
# Install and configure the native driver mysqlnd PHP extension
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
#  include php::extension::mysql
#
# === Authors
#
# Hermann Mayer <hermann.mayer92@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::mysqlnd(
  $ensure       = $php::extension::mysqlnd::params::ensure,
  $package      = $php::extension::mysqlnd::params::package,
  $provider     = $php::extension::mysqlnd::params::provider,
  $inifile      = $php::extension::mysqlnd::params::inifile,
  $pdo_inifile  = $php::extension::mysqlnd::params::pdo_inifile,
  $settings     = $php::extension::mysqlnd::params::settings,
  $pdo_settings = $php::extension::mysqlnd::params::pdo_settings,
  $mysqli_settings = $php::extension::mysqlnd::params::settings,
  $mysqli_settings = $php::extension::mysqlnd::params::mysqli_inifile,
) inherits php::extension::mysqlnd::params {

  php::extension { 'mysqlnd':
    ensure   => $ensure,
    package  => $package,
    provider => $provider,
    priority => 10,
  }

  php::config { 'php-extension-mysqlnd':
    file   => $inifile,
    config => $settings
  }
  php::config { 'php-extension-pdo_mysql':
    file   => $pdo_inifile,
    config => $pdo_settings
  }
}
