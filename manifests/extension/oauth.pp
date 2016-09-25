# == Class: php::extension::oauth
#
# Install and configure the oauth PHP extension
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
#  include php::extension::oauth
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2013 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::oauth(
  $ensure   = $php::extension::oauth::params::ensure,
  $package  = $php::extension::oauth::params::package,
  $provider = $php::extension::oauth::params::provider,
  $inifile  = $php::extension::oauth::params::inifile,
  $settings = $php::extension::oauth::params::settings,
) inherits php::extension::oauth::params {

  php::extension { 'oauth':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-oauth':
    file    => $inifile,
    config  => $settings
  }

}
