# == Class: php::extension::mailparse
#
# Install and configure the mailparse PHP extension
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
#  include php::extension::mailparse
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2013 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::mailparse(
  $ensure   = $php::extension::mailparse::params::ensure,
  $package  = $php::extension::mailparse::params::package,
  $provider = $php::extension::mailparse::params::provider,
  $inifile  = $php::extension::mailparse::params::inifile,
  $settings = $php::extension::mailparse::params::settings
) inherits php::extension::mailparse::params {

  php::extension { 'mailparse':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-mailparse':
    file    => $inifile,
    config  => $settings
  }

}
