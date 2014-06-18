class traceview::php {

  include traceview

  package { "php-oboe":
    ensure  => installed,
    require => [ Package["liboboe0"], Apt::Source["traceview"] ],
  }

}
