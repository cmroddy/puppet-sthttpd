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

class thttpd::params {
  case $osfamily {
    'gentoo': {
      $bind_host = '0.0.0.0'
      $charset = 'utf-8'
      $config_file = '/etc/thttpd/thttpd.conf'
      $daemon_user = 'thttpd'
      $do_chroot = 'chroot'
      $document_root = '/var/www/localhost'
      $listen_port = '80'
      $log_file = '/var/log/thttpd.log'
      $package_name = 'thttpd'
      $package_version = '2.26.4-r3'
      $pid_file = '/var/run/thttpd.pid'
      $rc_config = '/etc/conf.d/thttpd'
      $service = 'thttpd'
    }
    default: {
      fail("Sorry, but operating system family ${::osfamily} is not supported by the thttpd module.")
    }
  }
}
