# == Class: php::extension::mbstring
#
# Install the mbstring PHP extension
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
#  include php::extension::mbstring
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::mbstring(
  $ensure   = $php::extension::mbstring::params::ensure,
  $package  = $php::extension::mbstring::params::package,
  $provider = $php::extension::mbstring::params::provider,
  $inifile  = $php::extension::mbstring::params::inifile,
  $settings = $php::extension::mbstring::params::settings
) inherits php::extension::mbstring::params {

  # The "mbstring" module is built-in to PHP 5, only needs to be separately installed on 7+
  if versioncmp($php::params::major_version, "7") >= 0 {
    php::extension { 'mbstring':
      ensure   => $ensure,
      package  => $package,
      provider => $provider
    }

    php::config { 'php-extension-mbstring':
      file   => $inifile,
      config => $settings
    }
  }
}
