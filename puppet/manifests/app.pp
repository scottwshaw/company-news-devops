import "base.pp"

class app inherits base {

  file { "/var/db/prevaylor":
    ensure => "directory",
    owner => "tomcat",
    require => Package["tomcat6"],
  }

  package { "tomcat6":
    ensure => "installed",
  }

  file { "/etc/tomcat6/tomcat6.conf":
    require => Package["tomcat6"],
    source => "file://${files_dir}/tomcat6.conf",
  }    

}

include app
