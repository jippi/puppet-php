define php::sapi (
  $extension,
  $ensure,
  $priority,
) {
  if defined(Service[$php::fpm::params::service_name]) and ("fpm${extension}" == $title) {
    $disenable = $title
  } elsif defined(Package[$php::apache::params::package]) and ("apache2${extension}" == $title) {
    $disenable = $title
  } elsif ("cli${extension}" == $title) {
    $disenable = $title
  }
  php::extension::disenable { $title:
    extension   => $extension,
    ensure      => $ensure,
    pripriority => $priority,
    unless => empty($disenable)
  }
}