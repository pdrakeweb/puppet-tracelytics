class tracelytics::apache($apache_tracing_mode = "always", $apache_sampling_rate = 300000) {

  include tracelytics

  $tracing_mode = hiera('tracelytics_tracing_mode', $apache_tracing_mode)
  $sampling_rate = hiera('tracelytics_sampling_rate', $apache_sampling_rate)

  package { "libapache2-mod-oboe":
    ensure  => installed,
    require => [ Package["liboboe0"], Apt::Source["tracelytics"], Package["apache2"] ],
  }

  file { "/etc/apache2/mods-available/oboe.conf":
    owner   => root,
    group   => root,
    mode    => 644,
    content => template('tracelytics/oboe.conf.erb'),
    require => Package["libapache2-mod-oboe"],
  }

}
