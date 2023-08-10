class remote_syslog2::install inherits remote_syslog2::params {
  include wget

  Exec {
    path => '/usr/bin:/bin:/usr/sbin:/sbin'
  }

  $downcase_kernel = downcase($::kernel)
  $url = "https://github.com/papertrail/remote_syslog2/releases/download/${remote_syslog2::params::version}/remote_syslog_${downcase_kernel}_${::architecture}.tar.gz"
  $temp_file_name = 'remote_syslog2.tar.gz'
  $temp_file = "${remote_syslog2::params::temp_dir}/${temp_file_name}"

  wget::retrieve { $url:
    destination => $temp_file,
  }

  exec { 'unzip_remote_syslog2':
    command     => "tar -zxf ${temp_file}",
    cwd         => $remote_syslog2::params::install_dir,
    creates     => "${remote_syslog2::params::install_dir}/remote_syslog",
    subscribe   => Wget::Retrieve[$url],
    refreshonly => true,
  }
}
