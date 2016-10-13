# == Class: php::extension::xml
#
# Install the xml PHP extension
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
#  include php::extension::xml
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::xml(
  $ensure   = $php::extension::xml::params::ensure,
  $package  = $php::extension::xml::params::package,
  $provider = $php::extension::xml::params::provider,
  $inifile  = $php::extension::xml::params::inifile,
  $settings = $php::extension::xml::params::settings
) inherits php::extension::xml::params {

  # The "xml" module is built-in to PHP 5, only needs to be separately installed on 7+
  if versioncmp($php::params::major_version, "7") >= 0) {
    php::extension { 'xml':
      ensure   => $ensure,
      package  => $package,
      provider => $provider
    }

    php::config { 'php-extension-xml':
      file   => $inifile,
      config => $settings
    }
  }
}
