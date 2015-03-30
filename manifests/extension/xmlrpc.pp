# == Class: php::extension::xmlrpc
#
# Install the PHP mongo extension
#
# === Parameters
#
# [*ensure*]
#   The version of the package to install
#   Could be "latest", "installed", a pinned version or "absent"
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
#  include 'php::extension::xmlrpc'
#
#  class {'php::extension::xmlrpc':
#   ensure => latest
#  }
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
class php::extension::xmlrpc(
  $ensure   = $php::extension::xmlrpc::params::ensure,
  $package  = $php::extension::xmlrpc::params::package,
  $provider = $php::extension::xmlrpc::params::provider,
  $inifile  = $php::extension::xmlrpc::params::inifile,
  $settings = $php::extension::xmlrpc::params::settings
) inherits php::extension::xmlrpc::params {

  php::extension { 'xmlrpc':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }
  ->
  php::config { 'php-extension-xmlrpc':
    file   => $inifile,
    config => $settings
  }
}
