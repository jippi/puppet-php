# define a wrapper to have less clutter
define php::config::augeas (
  $file,
  $config,
) {
  include php::params

  augeas { "php-${name}-config":
    incl    => $file,
    changes => $config,
    lens    => 'PHP.lns',
  }
}
