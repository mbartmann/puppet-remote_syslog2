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
  $version                 = 'v0.16'
  $service_ensure          = 'running'

  case $::operatingsystem {
    'Ubuntu': {
      $service_provider = 'upstart'
      $service_template = 'remote_syslog2/remote_syslog2.upstart.conf.erb'
      $service_file     = '/etc/init/remote_syslog2.conf'
    }
    default: {
      $service_provider = undef
      $service_template = 'remote_syslog2/remote_syslog2.init.d.erb'
      $service_file     = '/etc/init.d/remote_syslog2'
    }
  }
}
