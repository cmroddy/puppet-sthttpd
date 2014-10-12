# == Class: thttpd
#
# Default class to manage the thttpd web server.
#
# === Parameters
#
# [*package_name*]
#   Package name to install that provides thttpd. Defaults to 'thttpd'.
#
# [*package_version*]
#   Version of thttpd to install. Defaults to 2.26.4-r3.
#
# === Variables
#
# === Examples
#
# include ::thttpd
#
# === Authors
#
# Chris Roddy <cmr@mdc2.org>
#
# === Copyright
#
# Copyright (c) 2014 Chris Roddy.
#
# This module is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This module is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this module.  If not, see <http://www.gnu.org/licenses/>.
#
class thttpd (
  $document_root = $thttpd::params::document_root,
  $package_name = $thttpd::params::package_name,
  $package_version = $thttpd::params::package_version,
  $rc_config = $thttpd::params::rc_config,
) inherits thttpd::params {
  package { $package_name:
    ensure => $package_version,
  }
  file_line { 'thttpd document root':
    path  => $rc_config,
    line  => "THTTPD_DOCROOT=\"${document_root}\"",
    match => '^THTTPD_DOCROOT=',
  }
}
