# == Class: php::extension::mapscript::params
#
# Defaults file for the mapscript PHP extension
#
# === Parameters
#
# No parameters
#
# === Variables
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
# === Examples
#
# No examples
#
# === Authors
#
# Simon Tremblay <Simon.Tremblay@cspq.gouv.qc.ca>
#
# === Copyright
#
# Copyright 2015 Gouvernement du Québec.
#
class php::extension::mapscript::params {

  $ensure   = $php::params::ensure
  $package  = 'php5-mapscript'
  $provider = undef
  $inifile  = "${php::params::config_root_ini}/mapscript.ini"
  $settings = [ ]

}
