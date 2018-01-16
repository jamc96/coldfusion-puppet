# == Class: coldfusion::config
#
class coldfusion::config(
  $cfroot     = $::coldfusion::cfroot,
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
      $cfroot:
      ensure => directory;
      $cflogsdir:
      ensure  => directory,
      recurse => true,
    }
}
