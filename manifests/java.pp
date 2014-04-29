class tracelytics::java {

  include tracelytics

  package { $tracelytics::params::java_agent_package:
    ensure  => installed,
    require => Package[$tracelytics::params::liboboe_package],
  }

  package { $tracelytics::params::java_agent_native_package:
    ensure  => installed,
    require => Package[$tracelytics::params::liboboe_package],
  }

}
