# == Define: php::fpm::chroot
#
# Install a bare chroot valid for a fpm pool
#
# === Parameters
#
# [*user*]
#   The user that will own the chroot dir.
#   Usually also the user that will be running the fpm pool.
#
# [*chrootdir*]
#   The dir to build the chroot.
#   Single chroot per php app or app group is recommended.
#   Defaults to name.
#
# [*group*]
#   The group to own the chroot dir.
#   Apache group recommended to also serve static content.
#
# === Variables
#
# No variables
#
# === Examples
#
#  php::fpm::chroot { '/u01/app/php-app1':
#      user    => 'php-user1',
#      group   => 'www',
#    }
#
# === Authors
#
# Chris Liles <cliles@capairo.com>
#
# === Copyright
#
# Copyright 2013 Chris Liles, unless otherwise noted.
#
define php::fpm::chroot (
  $user,
  $chrootdir = $name,
  $group     = $user,
){

  $progs = [
    '/etc/host.conf',
    '/etc/hosts',
    '/etc/localtime',
    '/etc/resolv.conf',
    '/lib64/libnss_dns-2.11.2.so',
    '/lib64/libnss_dns.so.2',
    '/usr/share/zoneinfo/America/New_York',
    '/usr/share/zoneinfo/zone.tab',
  ]

  $dirs = [
    '/dev',
    '/etc',
    '/tmp',
    '/lib64',
    '/usr',
    '/usr/share',
    '/usr/share/zoneinfo',
    '/usr/share/zoneinfo/America',
    '/var',
    '/var/lib',
    '/var/lib/php',
    '/var/lib/php/session',
  ]

  if !defined(File[$chrootdir]) {
    file { $chrootdir:
      ensure  => directory,
      owner   => $user,
      group   => $group,
    }
  }

  php::fpm::chroot::dir { $dirs:
    chrootdir => $chrootdir,
  }

  php::fpm::chroot::file { $progs:
    chrootdir => $chrootdir,
    require   => Php::Fpm::Chroot::Dir[$dirs],
  }


  #character devices
  exec { "/dev/null-${chrootdir}":
    command   => "mknod ${chrootdir}/dev/null c 1 3",
    creates   => "${chrootdir}/dev/null",
    path      => "/bin",
    require   => Php::Fpm::Chroot::Dir[$dirs],
  }

  exec { "/dev/urandom-${chrootdir}":
    command   => "mknod ${chrootdir}/dev/urandom c 1 9",
    creates   => "${chrootdir}/dev/urandom",
    path      => "/bin",
    require   => Php::Fpm::Chroot::Dir[$dirs],
  }

}

# == Define: php::fpm::chroot::dir
#
# Helper define to loop through a dir list, for puppet that can't loop.
#
# === Parameters
#
# [*chrootdir*]
#   The chroot base path.
#
# === Variables
#
# No variables
#
# === Examples
#
#  php::fpm::chroot::dir { ['/bin', '/sbin']:
#    chrootdir => '/u01/app/php-app1',
#  }
#
# === Authors
#
# Chris Liles <cliles@capairo.com>
#
# === Copyright
#
# Copyright 2013 Chris Liles, unless otherwise noted.
#

define php::fpm::chroot::dir (
  $chrootdir,
){

  file { "${name}-${chrootdir}":
    ensure => directory,
    path   => "${chrootdir}/${name}",
  }

}

# == Define: php::fpm::chroot::file
#
# Helper define to loop through a file list, for puppet that can't loop.
#
# === Parameters
#
# [*chrootdir*]
#   The chroot base path.
#
# === Variables
#
# No variables
#
# === Examples
#
#  php::fpm::chroot::file { ['/lib64/libnss_dns-2.11.2.so', '/lib64/libnss_dns.so.2']
#    chrootdir => '/u01/app/php-app1',
#  }
#
# === Authors
#
# Chris Liles <cliles@capairo.com>
#
# === Copyright
#
# Copyright 2013 Chris Liles, unless otherwise noted.
#

define php::fpm::chroot::file (
  $chrootdir,
){

  file { "${name}-${chrootdir}":
    ensure => file,
    path   => "${chrootdir}/${name}",
    source => $name,
    links  => manage,
  }

}
