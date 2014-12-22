# == Class: php::extension::pgsql
#
# Install and configure the pgsql PHP extension
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
#  include php::extension::pgsql
#
# === Authors
#
# Arthur Andersen <leoc.git@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Nodes, unless otherwise noted.
#
class php::extension::pgsql(
  $ensure       = $php::extension::pgsql::params::ensure,
  $package      = $php::extension::pgsql::params::package,
  $provider     = $php::extension::pgsql::params::provider,
  $inifile      = $php::extension::pgsql::params::inifile,
  $pdo_inifile  = $php::extension::pgsql::params::pdo_inifile,
  $settings     = $php::extension::pgsql::params::settings,
  $pdo_settings = $php::extension::pgsql::params::pdo_settings,
) inherits php::extension::pgsql::params {

  php::extension { 'pgsql':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-pgsql':
    file   => $inifile,
    config => $settings
  }
  php::config { 'php-extension-pdo_pgsql':
    file   => $pdo_inifile,
    config => $pdo_settings
  }
}
