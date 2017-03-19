# == Type: php::sapi
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
define php::sapi (
  $extension,
  $ensure,
  $priority,
) {
  assert_private("This is a privete type and should not be used on its own.")
  include php::apache::params
  include php::fpm::params
  case $title {
    "fpm${extension}": {
      if defined(Service[$php::fpm::params::service_name]) {
        $disenable = $title
      }
    }
    "apache2${extension}": {
      if defined(Package[$php::apache::params::package]) {
        $disenable = $title
      }
    }
    "cli${extension}": {
      $disenable = $title
    }
    default: {}
  }

  unless empty($disenable) {
    php::extension::disenable { $disenable:
      extension   => $extension,
      ensure      => $ensure,
      priority => $priority,
    }
  }
}
