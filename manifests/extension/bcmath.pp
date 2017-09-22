# == Class: php::extension::bcmath
#
# Install and configure the bcmath PHP extension
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
#  include php::extension::bcmath
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::bcmath(
  $ensure   = $php::extension::bcmath::params::ensure,
  $package  = $php::extension::bcmath::params::package,
  $provider = $php::extension::bcmath::params::provider,
  $inifile  = $php::extension::bcmath::params::inifile,
  $settings = $php::extension::bcmath::params::settings
) inherits php::extension::bcmath::params {

  php::extension { 'bcmath':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-bcmath':
    file   => $inifile,
    config => $settings
  }

}
