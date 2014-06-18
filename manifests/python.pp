class traceview::python {

  include traceview

  if !defined(Package["python"]) {
    package { "python":
      ensure => installed,
    }
  }

  if !defined(Package["python-dev"]) {
    package { "python-dev":
      ensure  => installed,
      require => Package["python"],
    }
  }

  package { "python-pip":
    ensure  => installed,
    require => Package["python-dev"],
  }

  exec { "install-python-oboe":
    command => "pip install --extra-index-url=http://pypi.tracelytics.com -U oboe",
    path    => "/usr/bin:/usr/sbin:/bin:/usr/local/bin:/sbin",
    require => [ Package["python-pip"], Package["liboboe-dev"] ],
    unless  => "pip freeze | grep oboe==",
  }

}
