# == Class: php::extension::yaml
#
# Install the PHP mongo extension
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
#  include 'php::extension::yaml'
#
#  class {'php::extension::yaml':
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
class php::extension::yaml(
  $ensure   = $php::extension::yaml::params::ensure,
  $package  = $php::extension::yaml::params::package,
  $provider = $php::extension::yaml::params::provider,
  $inifile  = $php::extension::yaml::params::inifile,
  $settings = $php::extension::yaml::params::settings
) inherits php::extension::yaml::params {

  php::extension { 'yaml':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-yaml':
    file    => $inifile,
    config  => $settings
  }
}
