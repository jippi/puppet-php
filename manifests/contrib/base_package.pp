# == Class: php::contrib::base_package
#
# Install php base package.
#
# === Parameters
#
# [*ensure*]
#   The ensure of the package to install
#   Could be "latest", "installed" or a pinned version
#
# [*provider*]
#   The provider used to install the package
#   Could be "pecl", "apt", "dpkg" or any other OS package provider
#
# === Variables
#
# No variables
#
# === Examples
#
#
#
# === Authors
#
#
#
# === Copyright
#
#
#
define php::contrib::base_package(
  $ensure,
  $provider = undef
) {
  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9')) {
            $package        = 'php7.0-common'
          } else {
            $package        = 'php5-common'
          }
        }
        default: {
          $package      = 'php7.0-common'
        }
      }
    }
    default: {
      $package      = 'php7.0-common'
    }
  }

  if !defined(Package[$package]) {
    package { $package:
      ensure   => $ensure,
      provider => $provider
    }
  }

}
