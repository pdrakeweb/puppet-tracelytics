class traceview {

  include apt

  $access_key = hiera('traceview_access_key', 'access_key')

  package { "liboboe0":
    ensure  => installed,
    require => Apt::Source["traceview"],
  }

  package { "liboboe-dev":
    ensure  => installed,
    require => [ Package["liboboe0"], Apt::Source["traceview"] ],
  }

  package { "tracelyzer":
    ensure  => installed,
    require => [ Package["liboboe0"], Apt::Source["traceview"] ],
  }

  file { "/etc/tracelytics.conf":
    owner   => root,
    group   => root,
    mode    => 644,
    content => template("traceview/tracelytics.conf.erb"),
    replace => false,
  }

  apt::source { "traceview":
    location    => "http://apt.tracelytics.com/${access_key}",
    release     => "${lsbdistcodename}",
    repos       => "main",
    include_src => false,
    key         => "03311F20",
    key_server  => "pgp.mit.edu",
    require     => File["/etc/tracelytics.conf"],
  }

}
