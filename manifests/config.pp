# == Class: coldfusion::config
#
class coldfusion::config(
  $cfdir     = $::coldfusion::cfdir,
  $cflogsdir = $::coldfusion::cflogsdir,
  $cfowner   = $::coldfusion::cfowner,
  $cfgroup   = $::coldfusion::cfgroup,
  $cfmode    = $::coldfusion::cfmode,
  $cfensure  = $::coldfusion::cfensure,
  ) {
    File{
      ensure => $cfensure,
      mode   => $cfmode,
      owner  => $cfowner,
      group  => $cfgroup,
      selinux_ignore_defaults => true,
    }
    file {
      $cfdir:
      ensure => directory;
      $cflogsdir:
      ensure  => directory,
      recurse => true,
    }
}
