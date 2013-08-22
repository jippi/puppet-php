define php::fpm::chroot (
  $chrootdir = $name,
  $user,
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


} #end define

define php::fpm::chroot::dir (
  $chrootdir,
){

  file { "${name}-${chrootdir}":
    ensure => directory,
    path   => "${chrootdir}/${name}",
  }    

}

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
