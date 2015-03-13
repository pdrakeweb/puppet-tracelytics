class tracelytics::apache($apache_tracing_mode = 'always', $apache_sampling_rate = 300000) {

  include tracelytics

  $tracing_mode = hiera('tracelytics_tracing_mode', $apache_tracing_mode)
  $sampling_rate = hiera('tracelytics_sampling_rate', $apache_sampling_rate)

  package { $tracelytics::params::apache_mod_oboe_package:
    ensure  => installed,
    require => Package[$tracelytics::params::liboboe_package,$tracelytics::params::liboboe_package],
  }

  file { $tracelytics::params::apache_mod_oboe_config:
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template('tracelytics/oboe.conf.erb'),
    require => Package[$tracelytics::params::apache_mod_oboe_package],
  }

}
