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
# Copyright 2012-2013 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::sqlite(
  $ensure   = $php::extension::sqlite::params::ensure,
  $package  = $php::extension::sqlite::params::package,
  $provider = $php::extension::sqlite::params::provider,
  $inifile  = $php::extension::sqlite::params::inifile,
  $settings = $php::extension::sqlite::params::settings
) inherits php::extension::sqlite::params {

  php::extension { 'sqlite':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-sqlite':
    file    => $inifile,
    config  => $settings
  }
}
