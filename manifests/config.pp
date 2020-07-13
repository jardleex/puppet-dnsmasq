class dnsmasq::config {
  File {
    owner => 'root',
    group => 'root',
  }

  file { $::dnsmasq::params::config_file:
    mode         => '0644',
    validate_cmd => '/usr/sbin/dnsmasq --test --conf-file=% --conf-file=/etc/dnsmasq.conf',
    source       => 'puppet:///modules/dnsmasq/dnsmasq.conf',
  }

}
