# == Class: coldfusion::config
#
class coldfusion::config {
  # class defaults
  File{
    ensure => $coldfusion::config_ensure,
    owner  => 'coldfusion',
    group  => 'coldfusion',
  }
  # create directories
  [$coldfusion::root_path, $coldfusion::home_dir_path].each |$name| {
    file { $name:
      ensure => directory,
    }
  }
  file { $coldfusion::logs_dir_path:
    ensure => directory,
    mode   => '0775',
  }
  # create files
  file { '/usr/bin/cfinfo':
    ensure  => file,
    content => template("${module_name}/cfinfo.erb"),
    require => File[$coldfusion::root_path],
  }
  # coldfusion profile
  file { '/etc/rc.d/rc.local':
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/rc.local.erb"),
  }
}
