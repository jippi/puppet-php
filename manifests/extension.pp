# == Class: php::extension
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
  $ensure,
  $package,
  $provider = undef,
  $pipe     = undef,
  $source   = undef,
  $sapis    = {
    'cli' => {title => 'cli'},
    'fpm' => {title => 'fpm'},
    'apache2' => {title => 'apache2'}
  },
  $priority = 20,
) {

  if $provider == 'pecl' {
    package { $package:
      ensure   => $ensure,
      provider => $provider,
      source   => $source,
      pipe     => $pipe;
    }
    unless defined(Service[$php::fpm::params::service_name]) {
      $sapis = delete($sapis, 'fpm')
    }
    unless defined(Package[$php::apache::params::package]) {
      $sapis = delete($sapis, 'apache2')
    }
    $defaults = {
      extension => $package,
      ensure    => $ensure,
      priority  => $priority,
      reqire    => Package[$package],
    }
    create_resources('php::extension::disenable', $sapis, $defaults)
  } elsif $provider == 'dpkg' {
    package { $package:
      ensure   => $ensure,
      provider => $provider,
      source   => $source;
    }
  } else {
    package { $package:
      ensure   => $ensure,
      provider => $provider;
    }
  }

}
