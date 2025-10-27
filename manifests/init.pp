# remote_syslog2
#
# Parameters:
#
#   [*config_file*]            - path to configuration
#   [*destination_port*]       - destination syslog port
#   [*destination_protocol*]   - chose between unencrypted 'tcp' or 'tls'
#   [*destination_host*]       - destination syslog hostname or IP
#   [*exclude_files*]          - files excluded from being sent
#   [*exclude_patterns*]       - log messages that you do not want to be sent
#   [*files*]                  - filenames to log
#   [*hostname*]               - local hostname to send from
#   [*new_file_check_interval] - how often to check for new files
#   [*service_ensure]          - enable remote_syslog2
#   [*service_provider]        - service provider
#   [*temp_dir]                - temp path used at installation
#   [*version]                 - remote_syslog2 release
#
# Usage:
#
#   $files = ['/var/log/mysqld.log', '/var/log/httpd/access_log']
#   class { 'remote_syslog2':
#     destination_port => 55555,
#     files            => $files,
#   }
#
class remote_syslog2 (
  Stdlib::Port $destination_port,
  Array[Stdlib::Absolutepath, 1] $files,
  Stdlib::Absolutepath $config_file             = $remote_syslog2::params::config_file,
  Enum['tcp', 'tls'] $destination_protocol      = $remote_syslog2::params::destination_protocol,
  String[1] $destination_host                   = $remote_syslog2::params::destination_host,
  Array[String[1]] $exclude_files               = $remote_syslog2::params::exclude_files,
  Array[String[1]] $exclude_patterns            = $remote_syslog2::params::exclude_patterns,
  Optional[String[1]] $hostname                 = $remote_syslog2::params::hostname,
  Stdlib::Absolutepath $install_dir             = $remote_syslog2::params::install_dir,
  Pattern[/\A\d+\z/] $new_file_check_interval   = $remote_syslog2::params::new_file_check_interval,
  Enum['running', 'stopped'] $service_ensure    = $remote_syslog2::params::service_ensure,
  Stdlib::Absolutepath $service_file            = $remote_syslog2::params::service_file,
  Stdlib::Absolutepath $temp_dir                = $remote_syslog2::params::temp_dir,
  String[1] $version                            = $remote_syslog2::params::version,
  Optional[String[1]] $architecture             = $remote_syslog2::params::architecture,
  Optional[String[1]] $service_provider         = $remote_syslog2::params::service_provider,
) inherits remote_syslog2::params {

  class { 'remote_syslog2::install': }

  class { 'remote_syslog2::config':
    config_file          => $config_file,
    config_file_template => $remote_syslog2::params::config_file_template,
    files                => $files,
    exclude_files        => $exclude_files,
    exclude_patterns     => $exclude_patterns,
    hostname             => $hostname,
    destination_host     => $destination_host,
    destination_port     => $destination_port,
    destination_protocol => $destination_protocol,
    service_file         => $service_file,
    service_template     => $remote_syslog2::params::service_template,
    install_dir          => $install_dir,
  }

  class { 'remote_syslog2::service':
    service_ensure   => $service_ensure,
    service_provider => $service_provider,
  }

  Class['remote_syslog2::install']
    -> Class['remote_syslog2::config']
    -> Class['remote_syslog2::service']
}
