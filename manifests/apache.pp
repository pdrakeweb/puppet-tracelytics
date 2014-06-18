class traceview::apache($apache_tracing_mode = "always", $apache_sampling_rate = 300000) {

  include traceview

  $tracing_mode = hiera('traceview_tracing_mode', $apache_tracing_mode)
  $sampling_rate = hiera('traceview_sampling_rate', $apache_sampling_rate)

  package { "libapache2-mod-oboe":
    ensure  => installed,
    require => [ Package["liboboe0"], Apt::Source["traceview"], Package["apache2"] ],
  }

  file { "/etc/apache2/mods-available/oboe.conf":
    owner   => root,
    group   => root,
    mode    => 644,
    content => template('traceview/oboe.conf.erb'),
    require => Package["libapache2-mod-oboe"],
  }

}
