# == Class: coldfusion::params
#
class coldfusion::params {
  # resources
  case $::osfamily {
    'RedHat': {
      $cfpackages = ['compat-libstdc++-33','libgcc','java-1.7.0-openjdk','compat-libstdc++-33.i686','gcc']
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
