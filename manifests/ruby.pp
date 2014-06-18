class traceview::ruby {

  package { "oboe":
    ensure    => installed,
    provider  => gem,
    source    => "http://gem.tracelytics.com/",
    require   => [ Package["rubygems"], Package["liboboe-dev"]],
  }

  package { "oboe_fu":
    ensure    => installed,
    provider  => gem,
    source    => "http://gem.tracelytics.com/",
    require   => [ Package["rubygems"], Package["liboboe-dev"] ],
  }

}
