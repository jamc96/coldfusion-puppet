# Class: coldfusion
# ===========================
#
# Full description of class coldfusion here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'coldfusion':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class coldfusion(
  Integer $version            = 9,
  String $cfroot              = "/opt/coldfusion${version}",
  String $cflogs              = "${cfroot}/logs",
  Array $cfpackages           = $::coldfusion::params::cfpackages,
  String $cfpackages_ensure   = 'present',
  String $cfpackages_provider = 'yum',
  String $cfensure            = 'present',
  String $cfowner             = 'coldfusion',
  String $cfgroup             = 'coldfusion',
  String $cfmode              = '0775',
)inherits ::coldfusion::params {

  if $version > 9 {
    $cflogsdir  = "${cfroot}/cfusion/logs"
    $cfhome     = "${cfroot}/cfusion"
  }else {
    $cflogsdir = $cflogs
    $cfhome    = $cfroot
  }

  class {'::coldfusion::install': } ->
  class {'::coldfusion::config': } ->
  Class['::coldfusion']
}
