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

  file { '/etc/tracelytics.conf':
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template('tracelytics/tracelytics.conf.erb'),
    replace => false,
  }
}
