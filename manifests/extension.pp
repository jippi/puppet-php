# == Define php::extension
#
# Install a PHP extension package
#
# === Parameters
#
# [*ensure*]
#   The ensure of the package to install
#   Could be "latest", "installed" or a pinned version
#
# [*package*]
#   Package name as defined in the package provider
#
# [*provider*]
#   The provider used to install the package
#   Could be "pecl", "apt", "dpkg" or any other OS package provider
#
# [*pipe*]
#   Used to answer interactive questions from pecl
#   Some extensions require answers on different questions. To provide answers
#   supply a list of lines with answers - one answer per line
#
# [*source*]
#   The path to the deb package to install
#
# === Variables
#
# [*php_ensure*]
#   The ensure of APC to install
#
# === Examples
#
# php::extension { "apc": }
#
# $answers = "shared
# /usr
# all"
# php::extension { 'libenchant':
#   ensure   => "latest",
#   package  => "enchant",
#   provider => "pecl",
#   pipe     => $answers;
# }
#
# php::extension { 'gearman':
#   ensure   => "latest",
#   package  => "libgearman8",
#   provider => "dpkg",
#   source   => "/path/to/libgearman8_1.1.7-1_amd64.deb";
# }
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
define php::extension(
  $ensure   = 'present',
  $package  = undef,
  $provider = undef,
  $pipe     = undef,
  $source   = undef,
  $extension = $title,
  $priority  = 20,
) {

  validate_re($ensure, '^(present|installed|absent)$')
  $command = $ensure ? {
    'absent' => '/usr/sbin/php5dismod',
    default  => '/usr/sbin/php5enmod',
  }
  $unless = $ensure ? {
    'absent' => '/usr/bin/test ! -e',
    default  => '/usr/bin/test -e',
  }

  if $package {
    package { $package:
      ensure   => $ensure,
      provider => $provider,
      source   => $source,
      pipe     => $pipe;
    }
  }

  Exec {
    require => Package['php5-common'],
    path    => '/bin:/usr/bin:/usr/local/bin',
  }

  exec { "${command} -s cli ${extension}":
    unless => "${unless} /etc/php5/cli/conf.d/${priority}-${extension}.ini",
  }

  if $::php::params::service_name and defined(Service[$php::fpm::params::service_name]) {
    exec { "${command} -s fpm ${extension}":
      unless => "${unless} /etc/php5/fpm/conf.d/${priority}-${extension}.ini",
      notify => Service[$php::fpm::params::service_name],
    }
  }

  if $::php::apache::params::package and defined(Package[$php::apache::params::package]) {
    exec { "${command} -s apache2 ${extension}":
      unless => "${unless} /etc/php5/apache2/conf.d/${priority}-${extension}.ini",
      notify => Service[$php::apache::params::service_name],
    }
  }

}
