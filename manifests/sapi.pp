define php::sapi {
# readability. otherwis not needed
  $sapis = $name

  unless defined(Service[$php::fpm::params::service_name]) {
    delete($sapis, 'fpm')
  }

  unless defined(Package[$php::apache::params::package]) {
    delete($sapis, 'apache2')
  }

}