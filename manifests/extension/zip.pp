# == Class: php::extension::zip
#
# Install the zip PHP extension
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
#  include php::extension::zip
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::zip(
  $ensure   = $php::extension::zip::params::ensure,
  $package  = $php::extension::zip::params::package,
  $provider = $php::extension::zip::params::provider,
  $inifile  = $php::extension::zip::params::inifile,
  $settings = $php::extension::zip::params::settings
) inherits php::extension::zip::params {

  # The "zip" module is built-in to PHP 5, only needs to be separately installed on 7+
  if versioncmp($php::params::major_version, "7") >= 0 {
    php::extension { 'zip':
      ensure   => $ensure,
      package  => $package,
      provider => $provider
    }

    php::config { 'php-extension-zip':
      file   => $inifile,
      config => $settings
    }
  }
}
