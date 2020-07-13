define dnsmasq::conf (
  $ensure  = 'present',
  $prio    = 10,
  $source  = undef,
  $content = undef
) {
  include ::dnsmasq

  file { "${dnsmasq::params::config_dir}${prio}-${name}":
    ensure       => $ensure,
    owner        => 'root',
    group        => 'root',
    content      => $content,
    source       => $source,
    validate_cmd => "/usr/sbin/dnsmasq --test --conf-file=% --conf-file=${::dnsmasq::params::config_file}",
    notify       => Class['dnsmasq::service'],
  }
}
