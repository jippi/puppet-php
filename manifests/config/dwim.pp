# define a wrapper for dwim settings to have less clutter
define php::config::dwim (
  $file,
  $config   = undef,
  $setting  = undef,
  $ensure   = 'present',
  $section  = 'PHP',
  $value    = undef,
) {
  $real_setting = pick($setting, regsubst($title, '([^=]+)\s*=\s*.+', '\1'), $title)
  $real_value   = pick($value,   regsubst($title, '[^=]+\s*=\s*(.+)', '\1'))

  if $real_setting == nil or $real_value == nil {
    fail ("${module_name}'s php::config: need a valid value and a valid setting. (on node ${::fqdn}).")
  }

  if $real_setting == 'extension' {
    fail ("${module_name}'s php::config must NOT be used to manage extensions! Please use php::extension")
  }

  ini_setting { "${title} in ${file}":
    ensure  => $ensure,
    path    => $file,
    section => $section,
    setting => $real_setting,
    value   => $real_value,
    require => Class[::php],
  }
}
