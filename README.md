# thttpd

#### Table of Contents

1. [Overview](#overview)
1. [Module Description](#module-description)
1. [Setup](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with thttpd](#beginning-with-thttpd)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)

## Overview

This module provides basic facilities for managing thttpd on Gentoo. No other
operating systems are supported, but if I find out that other operating
system maintainers support thttpd I suppose it could be added later.

On Gentoo, this actually means sthttpd, which was a fork of thttpd created when
the original project fizzled.

## Module Description

The thttpd module will ensure that the thttpd package is installed, will manage
correct entries in /etc/conf.d/thttpd to set the document root, and will manage
basic configuration directives in thttpd.conf.

## Setup

### Setup Requirements

This module assumes that you are using OpenRC. There still seem to be some bugs
managing the service.

### Beginning with thttpd

To install the module, clone this repository somewhere in your module path. If
you are using R10k or Librarian-puppet, you might use something like this:

    mod 'thttpd',
      :git => 'git@github.com:cmroddy/puppet-sthttpd.git',
      :ref => 'master'

## Usage

The best way to use the module is to say:

    include ::thttpd

...and then provide your class parameters from Hiera. The `params` class will
generally compute sane defaults on Gentoo, but you will likely want to change
some of them. You could also use the resource-like class declaration syntax:

    class { '::thttpd':
      document_root => '/var/www/my_website',
    }

## Limitations

Only Gentoo is supported. Only OpenRC is supported.

