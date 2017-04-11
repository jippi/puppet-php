# == Class: php::extension::mapscript
#
# Install the Mapscript PHP extension
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
#  include php::extension::mapscript
#
# === Authors
#
# Simon Tremblay <Simon.Tremblay@cspq.gouv.qc.ca>
#
# === Copyright
#
# Copyright 2015 Gouvernement du Québec.
#
class php::extension::mapscript(
  $ensure   = $php::extension::mapscript::params::ensure,
  $package  = $php::extension::mapscript::params::package,
  $provider = $php::extension::mapscript::params::provider,
  $inifile  = $php::extension::mapscript::params::inifile,
  $settings = $php::extension::mapscript::params::settings
) inherits php::extension::mapscript::params {

  php::extension { 'mapscript':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-mapscript':
    file   => $inifile,
    config => $settings
  }

}
