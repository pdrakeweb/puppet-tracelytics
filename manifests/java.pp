class traceview::java {

  include traceview

  package { "tracelytics-java-agent":
    ensure  => installed,
    require => [ Package["liboboe0"], Apt::Source["traceview"] ],
  }

  package { "tracelytics-java-agent-native":
    ensure  => installed,
    require => [ Package["liboboe0"], Apt::Source["traceview"] ],
  }

}
