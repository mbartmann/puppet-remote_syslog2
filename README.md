# remote_syslog2

[![Build Status](https://travis-ci.org/mbartmann/puppet-remote_syslog2.svg)](https://travis-ci.org/mbartmann/puppet-remote_syslog2)

Puppet module to install and manage [remote_syslog2][remote_syslog2].

## Usage

Include the `remote_syslog2` class in your manifest to install the utility. The Papertrail host and port should be overridden by Hiera in this case:

```puppet
include remote_syslog2
```

You need to set at least `files` and `destination_port`. An example with multiple logs might look like:

```puppet
$files = ['/var/log/mysqld.log', '/var/log/httpd/access_log']
class { 'remote_syslog2':
  destination_port => 55555,
  files            => $files,
}
```

Here is an example declaring the class with the full list of available parameters and their defaults. Port and files are the only required parameters:

```puppet
class { 'remote_syslog2':
  destination_port        => '55555'
  files                   => ['/var/log/mysqld.log'],
  destination_protocol    => 'tls'
  destination_host        => 'logs.papertrailapp.com',
  exclude_files           => [],
  exclude_patterns        => [],
  hostname                => undef,
  install_dir             => '/usr/local/bin',
  config_file             => '/etc/log_files.yml',
  new_file_check_interval => '10',
  temp_dir                => '/tmp',
  version                 => 'v0.16',
  service_ensure          = 'running',
  service_file            = '/etc/init.d/remote_syslog2'
}
```

[remote_syslog2]: https://github.com/papertrail/remote_syslog2
