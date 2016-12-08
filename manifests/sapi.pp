define php::sapi (
  $extension,
  $ensure,
  $priority,
) {
  case $title {
    "fpm${extension}": {
      if defined(Service[$php::fpm::params::service_name]) {
        $disenable = $title
      }
    }
    "apache2${extension}": {
      if defined(Package[$php::apache::params::package]) {
        $disenable = $title
      }
    }
    "cli${extension}": {
      $disenable = $title
    }
    default: {}
  }

  unless empty($disenable) {
    php::extension::disenable { $disenable:
      extension   => $extension,
      ensure      => $ensure,
      priority => $priority,
    }
  }
}
