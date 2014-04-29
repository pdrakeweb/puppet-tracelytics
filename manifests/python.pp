class tracelytics::python {

  include tracelytics

  if !defined(Package[$tracelytics::params::python_package]) {
    package { $tracelytics::params::python_package:
      ensure => installed,
    }
  }

  if !defined(Package[$tracelytics::params::python_dev_package]) {
    package { $tracelytics::params::python_dev_package:
      ensure  => installed,
      require => Package[$tracelytics::params::python_package],
    }
  }

  package { 'python-pip':
    ensure  => installed,
    require => Package[$tracelytics::params::python_dev_package],
  }

  exec { 'install-python-oboe':
    command => 'pip install --extra-index-url=http://pypi.tracelytics.com -U oboe',
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin:/sbin',
    require => [ Package['python-pip',$tracelytics::params::liboboe_dev_package]],
    unless  => "pip freeze | grep oboe==",
  }

}
