class remote_syslog2::params {

  $destination_port        = undef
  $destination_protocol    = 'tls'
  $destination_host        = 'logs.papertrailapp.com'
  $exclude_files           = []
  $exclude_patterns        = []
  $files                   = []
  $hostname                = undef
  $install_dir             = '/usr/local/bin'
  $config_file             = '/etc/log_files.yml'
  $config_file_template    = 'remote_syslog2/log_files.yml.erb'
  $new_file_check_interval = '10'
  $temp_dir                = '/tmp'
  $version                 = 'v0.21'
  $service_ensure          = 'running'

    case $::operatingsystem {
    'Ubuntu': {
      if (versioncmp($facts['os']['release']['full'], '15.04') < 0) {
        $service_provider = 'upstart'
        $service_template = 'remote_syslog2/remote_syslog2.upstart.conf.erb'
        $service_file     = '/etc/init/remote_syslog2.conf'
      } else {
        $service_provider = 'systemd'
        $service_template = 'remote_syslog2/remote_syslog2.systemd.erb'
        $service_file     = '/etc/systemd/system/remote_syslog2.service'
      }
    }
    'Debian': {
      $service_provider = 'systemd'
      $service_template = 'remote_syslog2/remote_syslog2.systemd.erb'
      $service_file     = '/etc/systemd/system/remote_syslog2.service'
    }
    default: {
      $service_provider = undef
      $service_template = 'remote_syslog2/remote_syslog2.init.d.erb'
      $service_file     = '/etc/init.d/remote_syslog2'
    }
  }
}
