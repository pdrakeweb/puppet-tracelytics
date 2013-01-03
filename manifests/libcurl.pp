class tracelytics::libcurl {

  include tracelytics

  package { "libcurl3":
    ensure  => '7.22.0-3ubuntu4+tracelytics2',
    require => [ Package["liboboe0"], Apt::Source["tracelytics"] ],
  }

}
