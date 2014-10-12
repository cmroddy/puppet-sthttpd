class thttpd::params {
  case $osfamily {
    'gentoo': {
      $document_root = '/var/www/localhost'
      $package_name = 'thttpd'
      $package_version = '2.26.4-r3'
      $rc_config = '/etc/conf.d/thttpd'
    }
    default: {
      fail("Sorry, but operating system family ${::osfamily} is not supported by the thttpd module.")
    }
  }
}
