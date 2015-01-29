Quick Start
===========

You are busy, and you just want to ``get things done™``, so let's get going.

After :doc:`installation<installation>`, you are ready to roll.

Simple install
##############

Install PHP-FPM, PHP CLI and the APC extension.

.. code-block:: puppet

  include php

  class { ['php::fpm', 'php::cli', 'php::extension::apc']:

  }

Advanced install
################

Install PHP-FPM, PHP CLI and the APC extension with custom configuration.

.. code-block:: puppet

  include php

  class { 'php::cli': }

  class { 'php::fpm':
    emergency_restart_threshold  => 5,
    emergency_restart_interval   => '1m',
    rlimit_files                 => 32768,
    events_mechanism             => 'epoll'  
  }

  class { 'php::extension::apc':
    settings => [
      # Augeas commands, one command per array entry
      'set .anon/apc.enabled' => 1
    ]
  }
