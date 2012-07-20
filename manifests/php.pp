class tracelytics::php {

  include tracelytics

  package { "php-oboe":
    ensure  => installed,
    require => [ Package["liboboe0"], Apt::Source["tracelytics"] ],
  }

}
