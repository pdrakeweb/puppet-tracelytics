class tracelytics::java {

  include tracelytics

  package { "tracelytics-java-agent":
    ensure  => installed,
    require => [ Package["liboboe0"], Apt::Source["tracelytics"] ],
  }

  package { "tracelytics-java-agent-native":
    ensure  => installed,
    require => [ Package["liboboe0"], Apt::Source["tracelytics"] ],
  }

}
