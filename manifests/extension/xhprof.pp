# == Class: php::extension::xhprof
#
# Install and configure the xhprof PHP extension
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
#  include php::extension::xhprof
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::xhprof(
  $ensure   = $php::extension::xhprof::params::ensure,
  $package  = $php::extension::xhprof::params::package,
  $provider = $php::extension::xhprof::params::provider,
  $inifile  = $php::extension::xhprof::params::inifile,
  $settings = $php::extension::xhprof::params::settings
) inherits php::extension::xhprof::params {

  php::extension { 'xhprof':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-xhprof':
    file   => $inifile,
    config => $settings
  }
}
