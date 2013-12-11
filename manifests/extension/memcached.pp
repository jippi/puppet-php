# == Class: php::extension::memcache::params
#
# Defaults file for the Memcache PHP extension
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
class php::extension::memcache::params {

  $ensure   = $php::params::ensure
  $package  = 'php5-memcache'
  $provider = undef
  $inifile  = '/etc/php5/conf.d/20-memcache.ini'
  $settings = {
    set => {
      '.anon/memcache.host'           => 'localhost',
      '.anon/memcache.vhost'          => '/',
      '.anon/memcache.port'           => 5672,
      '.anon/memcache.login'          => 'guest',
      '.anon/memcache.password'       => 'guest',
      '.anon/memcache.auto_ack'       => 0,
      '.anon/memcache.min_messages'   => 0,
      '.anon/memcache.max_messages'   => 1,
      '.anon/memcache.prefetch_count' => 3
    }
  }

}
