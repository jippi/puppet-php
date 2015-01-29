# Class: php::fpm::daemon
#
# Install the PHP FPM daemon. See php::fpm::conf for configuring its pools.
#
# Sample Usage:
#  include php::fpm::daemon
#
class php::fpm::daemon (
  $ensure       = 'present',
  $log_level    = 'notice',
  $emergency_restart_threshold = '0',
  $emergency_restart_interval  = '0',
  $process_control_timeout     = '0',
  $log_owner    = 'root',
  $log_group    = false,
  $log_dir_mode = '0770'
) {

  fail('php::fpm::daemon is deprecated, please move your php-fpm.conf settings into php::fpm..')

}
