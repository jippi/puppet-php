# == Class: php
#
# PHP base class
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
#  include php:
#
# === Authors
#
# Christian Winther <cw@nodes.dk>
#
# === Copyright
#
# Copyright 2012-2013 Nodes, unless otherwise noted.
#
class php {

	include php::params

	exec { 'php::pear::auto_discover':
  	command 		=> 'pear config-set auto_discover 1 system',
  	refreshonly	=> true
	}

}
