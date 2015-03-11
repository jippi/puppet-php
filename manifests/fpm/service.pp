# == Class: php::fpm::service
#
# This "private" class installs the fpm package
#
class php::fpm::service(
  $service_name,
  $ensure,
  $enable,
  $has_status,
  $provider = undef
) {

  service { $service_name:
    ensure    => $ensure,
    enable    => $enable,
    restart   => "service ${service_name} reload",
    hasstatus => $has_status,
    provider  => $provider
  }

}
