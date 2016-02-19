# == Class: php::extension::solr
#
# Install the solr PHP extension
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
#  include php::extension::solr
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
class php::extension::solr(
  $ensure   = $php::extension::solr::params::ensure,
  $package  = $php::extension::solr::params::package,
  $provider = $php::extension::solr::params::provider,
  $inifile  = $php::extension::solr::params::inifile,
  $settings = $php::extension::solr::params::settings
) inherits php::extension::solr::params {

  php::extension { 'solr':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }
  ->
  php::config { 'php-extension-solr':
    file   => $inifile,
    config => $settings
  }

}
