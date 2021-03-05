define dnsmasq::conf (
  Enum['absent', 'present'] $ensure = 'present',
  Variant[Integer[0, 999], String] $prio = 10,
  Optional[String] $source = undef,
  Optional[String] $content = undef
) {
  include dnsmasq

  file { "${dnsmasq::params::config_dir}${prio}-${name}":
    ensure       => $ensure,
    owner        => 'root',
    group        => 'root',
    content      => $content,
    source       => $source,
    validate_cmd => '/usr/sbin/dnsmasq --test --conf-file=%',
    notify       => Class['dnsmasq::service'],
  }
}
