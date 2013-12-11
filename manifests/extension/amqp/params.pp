# == Class: php::extension::amqp::params
#
# Defaults file for the AMQP PHP extension
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
class php::extension::amqp::params {

  $ensure   = $php::params::ensure
  $package  = 'php5-amqp'
  $provider = undef
  $inifile  = '/etc/php5/conf.d/20-amqp.ini'
  $settings = {
    set => {
      '.anon/amqp.host'           => 'localhost',
      '.anon/amqp.vhost'          => '/',
      '.anon/amqp.port'           => 5672,
      '.anon/amqp.login'          => 'guest',
      '.anon/amqp.password'       => 'guest',
      '.anon/amqp.auto_ack'       => 0,
      '.anon/amqp.min_messages'   => 0,
      '.anon/amqp.max_messages'   => 1,
      '.anon/amqp.prefetch_count' => 3
    }
  }

}
