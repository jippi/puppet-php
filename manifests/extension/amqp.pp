# == Class: php::extension::amqp
#
# Install and configure the AMQP PHP extension
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
#  include php::extension::amqp
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
# Nathan Sullivan <nmsullivan@gmail.com>
#
# === Copyright
#
# Copyright 2012-2013 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::amqp(
  $ensure   = $php::extension::amqp::params::ensure,
  $package  = $php::extension::amqp::params::package,
  $provider = $php::extension::amqp::params::provider,
  $inifile  = $php::extension::amqp::params::inifile,
  $settings = $php::extension::amqp::params::settings
) inherits php::extension::amqp::params {

  php::extension { 'amqp':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-amqp':
    inifile  => $inifile,
    settings => $settings
  }

}
