class tracelytics::libcurl {

  include tracelytics

  $tracelytics_libcurl_version = hiera('tracelytics_libcurl_version', '7.22.0-3ubuntu4.1+tracelytics2')

  package { "libcurl3":
    ensure  => $tracelytics_libcurl_version,
    require => [ Package["liboboe0"], Apt::Source["tracelytics"] ],
  }

}
