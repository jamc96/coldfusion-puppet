# == Class: coldfusion::install
#
class coldfusion::install(
  $cfpackages_ensure   = $::coldfusion::cfpackages_ensure,
  $cfpackages          = $::coldfusion::cfpackages,
  $cfpackages_provider = $::coldfusion::cfpackages_provider,
  ) {
  package { 'packages':
    ensure   => $cfpackages_ensure,
    name     => $cfpackages,
    provider => $cfpackages_provider,
  }
}
