# == Class: coldfusion::config
#
class coldfusion::config inherits coldfusion {
  # class defaults
  File{
    ensure => $coldfusion::config_ensure,
    owner  => 'coldfusion',
    group  => 'coldfusion',
    selinux_ignore_defaults => true,
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
  # create config files
  file {
    '/usr/bin/cfinfo':
      content => template("${module_name}/cfinfo.erb");
    '/etc/rc.d/rc.local':
      owner   => 'root',
      group   => 'root',
      content => template("${module_name}/rc.local.erb");
  }
}
