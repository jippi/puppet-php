# define a wrapper to have less clutter
define php::config::augeas (
  $file,
  $config,
) {
  include ::php::augeas
  include ::php::params

  augeas { $name:
    incl      => $file,
    changes   => $config,
    load_path => $php::params::augeas_contrib_dir,
    lens      => 'PHP.lns',
    require   => Class['php::augeas']
  }
}
