define php::sapi (
  $extension,
  $ensure,
  $priority,
) {
  $sapis = delete($title, $extension)
  if defined(Service[$php::fpm::params::service_name]) {
    $disenable = $sapi
  } elsif defined(Package[$php::apache::params::package]) {
    $disenable = $sapi
  } else {
    $disenable = $sapi
  }
  php::extension::disenable { $disenable:
    extension   => $extension,
    ensure      => $ensure,
    pripriority => $priority,
    unless => empty($disenable)
  }
}