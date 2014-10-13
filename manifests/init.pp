# == Class: thttpd
#
# Default class to manage the thttpd web server.
#
# === Parameters
#
# [*bind_host*]
#   The interface to bind to. Defaults to '0.0.0.0', meaning all interfaces.
# [*charset*]
#   The default character set for the server to use. Defaults to 'utf-8'.
# [*config_file*]
#   The location of the configuration file. Defaults to '/etc/thttpd/thttpd.conf'.
# [*daemon_user*]
#   The user account to use for running the daemon. Defaults to 'thttpd'.
# [*do_chroot*]
#   Whether to chroot. Defaults to 'chroot'; use 'nochroot' to disable chrooting.
# [*document_root*]
#   The document root to serve. Defaults to '/var/www/localhost'. This affects
#   /etc/conf.d/thttpd, and is not used in thttpd.conf.
# [*listen_port*]
#   The port on which the daemon should listen. Defaults to '80'.
# [*log_file*]
#   The location of the log file. Defaults to '/var/log/thttpd.log'.
# [*package_name*]
#   The name of the thttpd package to install. Defaults to 'thttpd'.
# [*package_version*]
#   The package version to install. Defaults to '2.26.4-r3'.
# [*pid_file*]
#   The location of the pid file. Defaults to '/var/run/thttpd.pid'.
# [*rc_config*]
#   The location of the shell environment defaults for the init script. This is
#   a Gentooism, and defaults to '/etc/conf.d/thttpd'.
# [*service*]
#   The name of the service to manage. Defaults to 'thttpd'.
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
  $bind_host = $thttpd::params::bind_host,
  $charset = $thttpd::params::charset,
  $config_file = $thttpd::params::config_file,
  $daemon_user = $thttpd::params::daemon_user,
  $do_chroot = $thttpd::params::do_chroot,
  $document_root = $thttpd::params::document_root,
  $listen_port = $thttpd::params::listen_port,
  $log_file = $thttpd::params::log_file,
  $package_name = $thttpd::params::package_name,
  $package_version = $thttpd::params::package_version,
  $pid_file = $thttpd::params::pid_file,
  $rc_config = $thttpd::params::rc_config,
  $service = $thttpd::params::service,
) inherits thttpd::params {
  package { $package_name:
    ensure => $package_version,
  }
  file_line { 'thttpd document root':
    path    => $rc_config,
    line    => "THTTPD_DOCROOT=\"${document_root}\"",
    match   => '^THTTPD_DOCROOT=',
    notify  => Service[$service],
    require => Package[$package_name],
  }
  file { 'thttpd config file':
    ensure  => file,
    path    => $config_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/thttpd.conf.erb"),
    notify  => Service[$service],
    require => Package[$package_name],
  }
  service { $service:
    ensure    => running,
    enable    => true,
    provider  => 'openrc',
    hasstatus => true,
    start     => 'service thttpd start',
    stop      => 'service thttpd stop',
    status    => 'service thttpd status',
  }
}
