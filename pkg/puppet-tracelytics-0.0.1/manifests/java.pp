class tracelytics::java {

  include tracelytics

  package { "tracelytics-java-agent":
    ensure => installed,
  }

  package { "tracelytics-java-agent-native":
    ensure => installed,
  }

}
