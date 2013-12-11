# == Class: php::extension::memcached::params
#
# Defaults file for the Memcached PHP extension
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
class php::extension::memcached::params {

  $ensure   = $php::params::ensure
  $package  = 'php5-memcached'
  $provider = undef
  $inifile  = '/etc/php5/conf.d/20-memcached.ini'
  $settings = {
    set => {
      '.anon/memcached.host'           => 'localhost',
      '.anon/memcached.vhost'          => '/',
      '.anon/memcached.port'           => 5672,
      '.anon/memcached.login'          => 'guest',
      '.anon/memcached.password'       => 'guest',
      '.anon/memcached.auto_ack'       => 0,
      '.anon/memcached.min_messages'   => 0,
      '.anon/memcached.max_messages'   => 1,
      '.anon/memcached.prefetch_count' => 3
    }
  }

}
