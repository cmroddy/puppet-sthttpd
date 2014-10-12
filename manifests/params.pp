class thttpd::params {
  case $osfamily {
    'gentoo': {
      $package_name = 'thttpd'
      $package_version = '2.26.4-r3'
    }
    default: {
      fail("Sorry, but operating system family ${::osfamily} is not supported by the thttpd module.")
    }
  }
}
