# == Class: php::extension::mysql::params
#
# Defaults file for the mysql PHP extension
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
# [*pdo_inifile*]
#   The path to the pdo extension ini file
#
# [*settings*]
#   Hash with 'set' nested hash of key => value
#   set changes to agues when applied to *inifile*
#
# [*pdo_settings*]
#   Hash with 'set' nested hash of key => value
#   set changes to agues when applied to *pod_inifile*
#
# === Examples
#
# No examples
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::mysql::params {

  $ensure       = $php::params::ensure
  $package      = 'php5-mysql'
  $provider     = undef
  $inifile      = "${php::params::config_root_ini}/mysql.ini"
  # these files the same for all mysql providers!
  $pdo_inifile  = "${php::params::config_root_ini}/pdo_mysql.ini"
  $mysqli_inifile  = "${php::params::config_root_ini}/mysqli.ini"
  $settings     = [ ]
  $pdo_settings = [ ]
  $mysqli_settings = [ ]

}
