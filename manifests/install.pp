# == Class: coldfusion::install
#
class coldfusion::install(
  $cfpackages_ensure   = $::coldfusion::cfpackages_ensure,
  $cfpackages          = $::coldfusion::cfpackages,
  $cfpackages_provider = $::coldfusion::cfpackages_provider,
  ) {
  package { $cfpackages:
    ensure   => $cfpackages_ensure,
    provider => $cfpackages_provider,
  }
}
