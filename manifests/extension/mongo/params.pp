# == Class: php::extension::mongo::params
#
# Defaults file for the MongoDB PHP extension
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
# Christian "Jippi" Winther <jippignu@gmail.com>
# Nathan Sullivan <nmsullivan@gmail.com>
#
# === Copyright
#
# Copyright 2012-2013 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::mongo::params {

  $ensure   = $php::params::ensure
  $package  = 'php5-mongo'
  $provider = undef
  $inifile  = '/etc/php5/conf.d/20-mongo.ini'
  $settings = {
    set => {
      '.anon/mongo.allow_empty_keys'   => 0,
      '.anon/mongo.allow_persistent'   => 1,
      '.anon/mongo.chunk_size'         => 262144,
      '.anon/mongo.cmd'                => '$',
      '.anon/mongo.default_host'       => 'localhost',
      '.anon/mongo.default_port'       => 27017,
      '.anon/mongo.is_master_interval' => 15,
      '.anon/mongo.long_as_object'     => 0,
      '.anon/mongo.native_long'        => 0,
      '.anon/mongo.ping_interval'      => 5,
      '.anon/mongo.utf8'               => 1
    }
  }

}
