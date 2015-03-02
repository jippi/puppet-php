# == Class: php::phpunit::params
#
# Defaults file for pear package
#
# === Parameters
#
# No parameters
#
# === Variables
#
# [*ensure*]
#   The ensure of the pear package to install
#   Could be "latest", "installed" or a pinned verison
#
# [*source*]
#   The URL to download PHPUnit PHAR
#   Official URL is https://phar.phpunit.de/phpunit.phar
#
# [*destination*]
#   The provider used to install pear.phpunit.de/PHPUnit
#   Recommended install location is /usr/local/bin/phpunit
#
#
# === Examples
#
#  include 'php::phpunit'
#
#  class {'php::phpunit
#   destination => '/opt/phpunit'
#  }
#
# === Authors
#
# Tobias Nyholm <tobias@happyrecruiting.se>
#
# === Copyright
#
# Copyright 2012-2015 Nodes, unless otherwise noted.
#
class php::phpunit::params inherits php::params {

  $ensure   = $php::params::ensure
  $source = 'https://phar.phpunit.de/phpunit.phar'
  $destination = '/usr/local/bin/phpunit'
}
