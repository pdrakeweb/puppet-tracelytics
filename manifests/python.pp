class tracelytics::python {

  include tracelytics

  package { "python-dev":
    ensure => installed,
  }

  package { "python-pip":
    ensure  => installed,
    require => [ Package["python"], Package["python-dev"] ],
  }

  exec { "install-python-oboe":
    command => "pip install --extra-index-url=http://pypi.tracelytics.com -U oboe",
    path    => "/usr/bin:/usr/sbin:/bin:/usr/local/bin:/sbin",
    require => Package["python-pip"],
    unless  => "pip freeze | grep oboe==",
  }

}
