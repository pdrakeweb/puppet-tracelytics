class tracelytics {

  include apt

  $access_key = hiera('tracelytics_access_key', 'access_key')
  
  package { "liboboe0":
    ensure  => installed,
    require => Apt::Source["tracelytics"],
  }

  package { "liboboe-dev":
    ensure  => installed,
    require => Apt::Source["tracelytics"],
  }

  package { "tracelyzer":
    ensure  => installed,
    require => Apt::Source["tracelytics"],
  }

  file { "/etc/tracelytics.conf":
    owner   => root,
    group   => admin,
    mode    => 770,
    content => template("tracelytics/tracelytics.conf.erb"),
  }

  apt::source { "tracelytics":
    location    => "http://apt.tracelytics.com/${access_key}",
    release     => "${lsbdistcodename}",
    repos       => "main",
    include_src => false,
    key         => "03311F20",
    key_server  => "pgp.mit.edu",
    require     => File["/etc/tracelytics.conf"],
  }

}
