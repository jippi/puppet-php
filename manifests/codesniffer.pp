# == Class: php::codesniffer
#
# Install PHP_CodeSniffer
#
# === Parameters
#
# No parameters
#
# === Variables
#
# No variables
#
# === Examples
#
#  include php::codesniffer
#
# === Authors
#
# Andy Dawson <anda@nodes.dk>
#
# === Copyright
#
# Copyright 2012-2013 Nodes, unless otherwise noted.
#
class php::codesniffer {

  package { 'PHP_CodeSniffer':
    ensure    => '1.4.4',
    provider  => pear;
  }

}
