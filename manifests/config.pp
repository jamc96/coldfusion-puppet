# == Class: coldfusion::config
#
class coldfusion::config(
  $cfroot    = $::coldfusion::cfroot,
  $cflogsdir = $::coldfusion::cflogsdir,
  $cfowner   = $::coldfusion::cfowner,
  $cfgroup   = $::coldfusion::cfgroup,
  $cfmode    = $::coldfusion::cfmode,
  $cfensure  = $::coldfusion::cfensure,
  $cfhome    = $::coldfusion::cfhome,
  ) {
    File{
      ensure                  => $cfensure,
      owner                   => $cfowner,
      group                   => $cfgroup,
      selinux_ignore_defaults => true,
    }
    case $cfhome {
      /cfusion/: {
        file {
          $cfroot:
          ensure => directory;
          $cfhome:
          ensure => directory;
          $cflogsdir:
          ensure => directory,
          mode   => $cfmode;
          'cfinfo':
          ensure  => $cfensure,
          path    => '/usr/bin/cfinfo',
          content => template("${module_name}/cfinfo.erb"),
          require => File[$cfroot],
        }
      }
      default: {
        file {
          $cfroot:
          ensure  => directory;
          $cflogsdir:
          ensure => directory,
          mode   => $cfmode;
          'cfinfo':
          ensure  => $cfensure,
          path    => '/usr/bin/cfinfo',
          content => template("${module_name}/cfinfo.erb"),
          require => File[$cfroot],
        }
      }
    }
}
