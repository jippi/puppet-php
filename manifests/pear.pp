# == Class: php::pear
#
# Install PEAR package manager
#
# === Parameters
#
# [*ensure*]
#   The PHP ensure of PHP pear to install
#
# [*package*]
#   The package name for PHP pear
#   For debian it's php5-pear
#
# [*provider*]
#   The provider used to install php5-pear
#   Could be "pecl", "apt" or any other OS package provider
#
# === Variables
#
# No variables
#
# === Examples
#
#  include php::pear
#
# === Authors
#
# Christian Winther <cw@nodes.dk>
#
# === Copyright
#
# Copyright 2012-2013 Nodes, unless otherwise noted.
#
class php::pear(
  $ensure   = $php::pear::params::ensure,
  $package  = $php::pear::params::package,
  $provider = $php::pear::params::provider
) inherits php::pear::params {

	package { $package:
    ensure	 => $ensure,
    provider => $provider;
  }

}
