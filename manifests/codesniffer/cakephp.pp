# == Class: php::codesniffer::cakephp
#
# Install CakePHP CodeSniffer standard
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
#  include php::codesniffer::cakehphp
#
# === Authors
#
# Andy Dawson <anda@nodes.dk>
#
# === Copyright
#
# Copyright 2012-2013 Nodes, unless otherwise noted.
#
class php::codesniffer::cakephp {

  package { 'pear.cakephp.org/CakePHP_CodeSniffer':
    ensure    => '0.1.11',
    provider  => pear;
  }

  Exec['php::pear::auto_discover'] -> Package['pear.cakephp.org/CakePHP_CodeSniffer']

}
