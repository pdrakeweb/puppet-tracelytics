class tracelytics::php {

  include tracelytics

  package { $tracelytics::params::php_oboe_package:
    ensure  => installed,
    require => Package[$tracelytics::params::liboboe_package],
  }

}
