# == Type: php::extension::disenable
#
# Enables a PHP extension installed using PECL
#
# === Parameters
#
# [*extension*]
#   The name of extension to enable or disenable
#
# [*ensure*]
#   The ensure of the package to install
#   Could be "latest", "installed", pinned version or "absent"
#
# [*priority*]
#   Integer indicateing loading order
#
# === Variables
#
# No variables
#
# === Examples
#
#  This is a private type and should not be used on its own.
#
# === Author
#
# Goran Miskovic <schkovich@gmail.com>
#
# === Copyright
#
# Copyright 2012-2016 Christian "Jippi" Winther, unless otherwise noted.
#
define php::extension::disenable (
  $extension,
  $ensure = 'present',
  $priority = 20,
) {

  assert_private("This is a privete type and should not be used on its own.")

  $sapi = delete($title, $extension)

  Exec {
  #   fact that php5-common does not guarantee that extension is installed
    require => Package[$extension],
  #   default path minus games
    path    => '/bin:/usr/bin:/usr/local/bin: /sbin:/usr/sbin:/usr/local/sbin',
  }

  validate_re($ensure, '^(latest|present|installed|absent)$')
# no need for qualified since path is defined
  $command = $ensure ? {
    'absent' => 'php5dismod',
    default  => 'php5enmod'
  }
# same as above
  $unless = $ensure ? {
    'absent' => 'test ! -e',
    default  => 'test -e',
  }
# regex is idempotent. no changes will be made if there is a space after semicolon already
  exec { "priority_${sapi}_${extension}":
    command => "sed -ie 's/^;priority/; priority/g' /etc/php5/mods-available/${extension}.ini",
    onlyif  => "test -e /etc/php5/mods-available/${extension}.ini",
  }
# extension class should be responsible for service notification
  exec { "${command} -s ${sapi} ${extension}":
    unless  => "${unless} /etc/php5/${sapi}/conf.d/${priority}-${extension}.ini",
    require => Exec["priority_${sapi}_${extension}"]
  }

}
