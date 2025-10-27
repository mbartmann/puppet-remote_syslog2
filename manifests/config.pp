class remote_syslog2::config (
  Stdlib::Absolutepath $config_file             = $remote_syslog2::config_file,
  String[1] $config_file_template               = $remote_syslog2::params::config_file_template,
  Array[Stdlib::Absolutepath, 1] $files         = $remote_syslog2::files,
  Array[String[1]] $exclude_files               = $remote_syslog2::exclude_files,
  Array[String[1]] $exclude_patterns            = $remote_syslog2::exclude_patterns,
  Optional[String[1]] $hostname                 = $remote_syslog2::hostname,
  String[1] $destination_host                   = $remote_syslog2::destination_host,
  Stdlib::Port $destination_port                = $remote_syslog2::destination_port,
  Enum['tcp', 'tls'] $destination_protocol      = $remote_syslog2::destination_protocol,
  Stdlib::Absolutepath $service_file            = $remote_syslog2::params::service_file,
  String[1] $service_template                   = $remote_syslog2::params::service_template,
  Stdlib::Absolutepath $install_dir             = $remote_syslog2::install_dir,
) inherits remote_syslog2::params {

  file { $config_file:
    mode    => '0664',
    content => template($config_file_template),
    require => Class['remote_syslog2::install'],
    notify  => Class['remote_syslog2::service'],
  }

  file { $service_file:
    mode    => '0765',
    content => template($service_template),
    require => Class['remote_syslog2::install'],
    notify  => Class['remote_syslog2::service'],
  }
}
