# == Class: php::extension::tidy
#
# Install the tidy PHP extension
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
#  include php::extension::tidy
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
# Goran Miskovic <schkovich@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::tidy(
  $ensure   = $php::extension::tidy::params::ensure,
  $package  = $php::extension::tidy::params::package,
  $provider = $php::extension::tidy::params::provider,
  $inifile  = $php::extension::tidy::params::inifile,
  $settings = $php::extension::tidy::params::settings
) inherits php::extension::tidy::params {

  php::extension { 'tidy':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-tidy':
    file   => $inifile,
    config => $settings
  }

}
