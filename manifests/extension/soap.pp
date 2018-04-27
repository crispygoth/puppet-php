# == Class: php::extension::soap
#
# Install the soap PHP extension
#
# === Parameters
#
# [*ensure*]
#   The version of the package to install
#   Could be "latest", "installed" or a pinned version
#   This matches "ensure" from Package
#
# [*package*]
#   The package name in your provider
#
# [*provider*]
#   The provider used to install the package
#
# [*inifile*]
#   The path to the extension ini file
#
# [*settings*]
#   Hash with 'set' nested hash of key => value
#   set changes to agues when applied to *inifile*
#
# === Variables
#
# No variables
#
# === Examples
#
#  include php::extension::soap
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::soap(
  $ensure   = $php::extension::soap::params::ensure,
  $package  = $php::extension::soap::params::package,
  $provider = $php::extension::soap::params::provider,
  $inifile  = $php::extension::soap::params::inifile,
  $settings = $php::extension::soap::params::settings
) inherits php::extension::soap::params {

  # The "soap" module is built-in to PHP 5, only needs to be separately installed on 7+
  if versioncmp($php::params::major_version, "7") >= 0 {
    # SOAP module requires the XML module
    include php::extension::xml
    
    php::extension { 'soap':
      ensure   => $ensure,
      package  => $package,
      provider => $provider
    }

    php::config { 'php-extension-soap':
      file   => $inifile,
      config => $settings
    }
  }
}
