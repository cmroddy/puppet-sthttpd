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
