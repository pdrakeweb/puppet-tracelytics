class tracelytics::ruby {

  package { "oboe": 
    ensure    => installed, 
    provider  => gem,
    source    => "http://gem.tracelytics.com/",
    require   => Package["rubygems"],
  }

  package { "oboe_fu": 
    ensure    => installed, 
    provider  => gem,
    source    => "http://gem.tracelytics.com/",
    require   => Package["rubygems"],
  }

}
