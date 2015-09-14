# == Class: php::extension::mysql
#
# Install and configure the mysql PHP extension
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
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::mysql(
  $ensure       = $php::extension::mysql::params::ensure,
  $package      = $php::extension::mysql::params::package,
  $provider     = $php::extension::mysql::params::provider,
  $inifile      = $php::extension::mysql::params::inifile,
  $pdo_inifile  = $php::extension::mysql::params::pdo_inifile,
  $settings     = $php::extension::mysql::params::settings,
  $pdo_settings = $php::extension::mysql::params::pdo_settings,
  $mysqli_settings = $php::extension::mysql::params::settings,
  $mysqli_settings = $php::extension::mysql::params::mysqli_inifile,
) inherits php::extension::mysql::params {

  php::extension { 'mysql':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-mysql':
    file   => $inifile,
    config => $settings
  }
  php::config { 'php-extension-pdo_mysql':
    file   => $pdo_inifile,
    config => $pdo_settings
  }
  php::config { 'php-extension-mysqli':
    file   => $mysqli_inifile,
    config => $mysqli_settings
  }

}
