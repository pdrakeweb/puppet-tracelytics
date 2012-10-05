class tracelytics::nginx($nginx_tracing_mode = "always", $nginx_sampling_rate = 300000) {

  include tracelytics

  $tracing_mode = hiera('tracelytics_tracing_mode', $nginx_tracing_mode)
  $sampling_rate = hiera('tracelytics_sampling_rate', $nginx_sampling_rate)

  file { "/etc/nginx/conf.d/oboe.conf":
    owner   => root,
    group   => root,
    mode    => 644,
    content => template('tracelytics/nginx.oboe.conf.erb'),
    require => Package['nginx-extras'],
    notify  => Service['nginx'],
  }

}
