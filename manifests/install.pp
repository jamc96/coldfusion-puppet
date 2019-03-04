# == Class: coldfusion::install
#
class coldfusion::install {
  # install depedencies
  ['compat-libstdc++-33','libgcc','compat-libstdc++-33.i686','gcc','subversion'].each |$name| {
    package { $name:
      ensure   => $coldfusion::package_ensure,
      provider => 'yum',
    }
  }
}
