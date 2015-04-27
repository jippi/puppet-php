define php::extension::disenable (
  $exension,
  $ensure = 'present',
  $priority = 20,
) {

  $sapi = delete($title, $extension)

  Exec {
  #   fact that php5-common does not guarantee that extension is installed
    require => Package[$exension],
  #   default path minus games
    path    => '/bin:/usr/bin:/usr/local/bin: /sbin:/usr/sbin:/usr/local/sbin',
  }

  validate_re($ensure, '^(present|installed|absent)$')
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
  exec { "priority_${sapi}_${exension}":
    command => "sed -ie 's/^;priority/; priority/g' /etc/php5/mods-available/${exension}.ini",
    onlyif  => "test -e /etc/php5/mods-available/${exension}.ini",
  }
# extension class should be responsible for service notification
  exec { "${command} -s ${sapi} ${exension}":
    unless  => "${unless} /etc/php5/${sapi}/conf.d/${priority}-${exension}.ini",
    require => Exec["priority_${sapi}_${exension}"]
  }

}
