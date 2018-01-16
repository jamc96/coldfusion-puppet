# == Class: coldfusion::config
#
class coldfusion::config(
  $cfdir     = $::coldfusion::cfdir,
  $cflogsdir = $::coldfusion::cflogsdir,
  ) {
    File{
      ensure => 'present',
      selinux_ignore_defaults => true,
      mode   => '0775',
    }
    file {
      $cfdir:
      ensure => directory;
      $cflogsdir:
      ensure => directory,
    }
}
