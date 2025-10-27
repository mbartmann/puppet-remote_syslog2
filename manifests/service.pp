class remote_syslog2::service (
  Enum['running', 'stopped'] $service_ensure = pick($remote_syslog2::service_ensure, $remote_syslog2::params::service_ensure),
  Optional[String[1]] $service_provider      = $remote_syslog2::service_provider,
) inherits remote_syslog2::params {

  service { 'remote_syslog2':
    ensure   => $service_ensure,
    provider => $service_provider,
    require  => Class['remote_syslog2::config'],
  }
}
