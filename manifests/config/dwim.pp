# define a wrapper for dwim settings to have less clutter
define php::config::dwim (
  $file     = "${::php::config_root}/php.ini",
  $config   = undef,
  $setting  = undef,
  $ensure   = 'present',
  $section  = undef,
  $value    = undef,
) {
  # parse title
  if $title =~ /([^=]+)\s*=\s*(.+)/ and $setting == nil and $value == nil {
    $real_setting = regsubst($title, '([^=]+)\s*=\s*.+', '\1')
    $real_value   = regsubst($title, '[^=]+\s*=\s*(.+)', '\1')
  } elsif $title =~ /\S+/ and $setting == nil and $value != nil {
    $real_setting = $title
    $real_value =   $value
  } elsif $setting != nil and $value != nil {
    $real_setting = $setting
    $real_value = $value
  } else {
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
