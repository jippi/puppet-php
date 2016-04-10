# == Class: php::extension::imap::params
#
# Defaults file for the imap PHP extension
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
# Arthur Andersen <leoc.git@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Nodes, unless otherwise noted.
#
class php::extension::imap::params {

  $ensure   = $php::params::ensure
  $package  = 'php7.0-imap'
  $provider = undef
  $inifile  = '/etc/php/conf.d/imap.ini'
  $settings = []
}
