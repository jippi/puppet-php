# Define: php::fpm::pool
#
# PHP FPM pool configuration definition. Note that the original php-fpm package
# includes a pre-configured one called 'www' so you should either use that name
# in order to override it, or "ensure => absent" it.
#
# Sample Usage:
#  php::fpm::pool { 'www': ensure => absent }
#  php::fpm::pool { 'customer1':
#      listen => '127.0.0.1:9001',
#      user   => 'customer1',
#  }
#  php::fpm::pool { 'customer2':
#      listen => '127.0.0.1:9002',
#      user   => 'customer2',
#  }
#
define php::fpm::pool (
  $ensure = 'present',
  $listen = '127.0.0.1:9000',
  # Puppet does not allow dots in variable names
  $listen_backlog = '-1',
  $listen_allowed_clients = '127.0.0.1',
  $listen_owner = undef,
  $listen_group = undef,
  $listen_mode = undef,
  $user = 'www-data',
  $group = undef,
  $pm = 'dynamic',
  $pm_max_children = '50',
  $pm_start_servers = '5',
  $pm_min_spare_servers = '5',
  $pm_max_spare_servers = '35',
  $pm_max_requests = '0',
  $pm_process_idle_timeout = '10s',
  $pm_status_path = undef,
  $ping_path = undef,
  $ping_response = 'pong',
  $request_terminate_timeout = '0',
  $request_slowlog_timeout = '0',
  $slowlog = "/var/log/php-fpm/${name}-slow.log",
  $access_log = undef,
  $access_log_format = undef,
  $rlimit_files = undef,
  $rlimit_core = undef,
  $chroot = undef,
  $chdir = undef,
  $catch_workers_output = 'no',
  $env = [],
  $env_value = {},
  $php_value = {},
  $php_flag = {},
  $php_admin_value = {},
  $php_admin_flag = {},
  $php_directives = [],
  $log_errors = true,
  $error_log = true,
  $config_mode = '0644',
) {

  $pool = $title

  # Hack-ish to default to user for group too
  $group_final = $group ? { undef => $user, default => $group }

  if ($ensure == 'absent') {
    file { "${::php::params::config_root}/fpm/pool.d/${pool}.conf":
      ensure => absent,
      notify => Service[$::php::fpm::params::service_name]
    }
  } else {
    file { "${::php::params::config_root}/fpm/pool.d/${pool}.conf":
      ensure  => file,
      notify  => Service[$::php::fpm::params::service_name],
      require => Package[$::php::fpm::params::package],
      content => template('php/fpm/pool.conf.erb'),
      owner   => root,
      group   => root,
      mode    => $config_mode,
    }
  }
}
