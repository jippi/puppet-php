# == Class: php::config
#
# Configure php.ini settings for a PHP SAPI
#
# === Parameters
#
# [*file*]
#   The path to ini file
#
# [*config*]
#   An array of augeas commands to execute
#
# === Variables
#
# No variables
#
# === Examples
#
# php::config { '$unique-name':
#   file  => '$full_path_to_ini_file'
#   config => [
#     'set .anon/apc.enabled 1'
#   ]
# }
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2014 Christian "Jippi" Winther, unless otherwise noted.
#
define php::config(
  $ensure   = 'present',
  $file     = "${::php::config_root}/conf.d/${title}.ini",
  $config   = undef,
  $section  = undef,
  $setting  = undef,
  $value    = undef,
) {

  if $config {

    php::config::augeas { $title:
      file   => $file,
      config => $config,
    }

  } else {
    validate_re($ensure, '(absent|present)', "${module_name}'s php::config: ensure must either be 'absent' or 'present' on ${::fqdn}")

    php::config::dwim { $title:
      ensure  => $ensure,
      file    => $file,
      section => $section,
      setting => $setting,
      value   => $value,
    }
  }
}
