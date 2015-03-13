class tracelytics::libcurl {

  include tracelytics

  package { $tracelytics::params::libcurl_package:
    ensure  => $tracelytics::params::libcurl_version,
    require => Package[$tracelytics::params::liboboe_package],
  }

}
