define tracelytics::repo ($access_key) {

  if $::osfamily == 'RedHat' or $::operatingsystem == 'amazon' {
    yumrepo { 'tracelytics':
      baseurl  => "http://yum.tracelytics.com/$access_key/$::operatingsystemmajrelease/$::architecture",
      gpgcheck => 1,
      gpgkey   => 'https://yum.tracelytics.com/RPM-GPG-KEY-tracelytics',
    }
  } elsif $::osfamily == 'Debian' {
    include apt
    apt::source { 'tracelytics':
      location    => 'http://apt.tracelytics.com/${access_key}',
      release     => "${::lsbdistcodename}",
      repos       => 'main',
      include_src => false,
      key         => '03311F20',
      key_server  => 'pgp.mit.edu',
    }
  } else {
    fail("Class['apache::params']: Unsupported osfamily: ${::osfamily}")
  }
}

