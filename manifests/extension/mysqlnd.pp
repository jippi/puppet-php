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
# [*settings*]
#   Hash with 'set' nested hash of key => value
#   set changes to agues when applied to *inifile*
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
# Copyright 2012-2013 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::mysqlnd(
  $ensure   = $php::extension::mysql::params::ensure,
  $package  = $php::extension::mysql::params::package,
  $provider = $php::extension::mysql::params::provider,
  $inifile  = $php::extension::mysql::params::inifile,
  $settings = $php::extension::mysql::params::settings,
) inherits php::extension::mysql::params {

  php::extension { 'mysqlnd':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-mysqlnd':
    file   => $inifile,
    config => $settings
  }

}
