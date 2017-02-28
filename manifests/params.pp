# == Class: php::params
#
# PHP params class
#
# Configuration class for php module
#
# === Parameters
#
# No parameters
#
# === Variables
#
# [*ensure*]
#   The PHP ensure of PHP to install
#
# === Examples
#
#  include php::dev
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::params {

  $ensure = 'installed'
  $augeas_contrib_dir = '/usr/share/augeas/lenses/contrib'

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if (versioncmp($::operatingsystemrelease, '9') >= 0) {
            $config_root    = '/etc/php/7.0'
          } else {
            $config_root    = '/etc/php5'
          }
        }
        default: {
          $config_root  = '/etc/php/7.0'
        }
      }
    }
    default: {  
      $config_root  = '/etc/php/7.0'
    }
  }

  if $::php_version == '' or versioncmp($::php_version, '5.4') >= 0 {
    $config_root_ini = "${config_root}/mods-available"
  } else {
    $config_root_ini = "${config_root}/conf.d"
  }
}
