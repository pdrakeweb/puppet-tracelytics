class tracelytics ($access_key) inherits tracelytics::params {

  tracelytics::repo { 'tracelytics':
    access_key => $access_key,
  }

  package { $tracelytics::params::liboboe_package:
    ensure  => installed,
    require => Tracelytics::Repo['tracelytics'],
  }

  package { $tracelytics::params::liboboe_dev_package:
    ensure  => installed,
    require => Package[$tracelytics::params::liboboe_package],
  }

  package { $tracelytics::params::tracelyzer_package:
    ensure  => installed,
    require => Package[$tracelytics::params::liboboe_package],
  }

  file { $tracelytics::params::tracelytics_config:
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template('tracelytics/tracelytics.conf.erb'),
    require => Package[$tracelytics::params::tracelyzer_package],
    notify  => Service[$tracelytics::params::tracelyzer_service],
  }

  service { $tracelytics::params::tracelyzer_service:
    ensure  => running,
    enable  => true,
    require => File[$tracelytics::params::tracelytics_config],
  }
}
