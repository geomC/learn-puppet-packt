# == Class: webapp
#
# Full description of class webapp here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'webapp':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2019 Your name here, unless otherwise noted.
#
class webapp {
  # instantiate the puppet class
  include apache
  file { '/var/www/html/index.html':
    # the template function does not take a file path but a reference in the form of <modulename>/<template>
    content => template('webapp/index.html.erb'),
    #  owner is used to state a user account that Puppet should make as the owner of the file on the target machine
    owner => 'apache',
    # require ensures that the apache user is created prior to setting the file
    # owner as the apache user.
    require => User['apache'];
  }
  # the notify resource allows Puppet to report a message when a resource is processed.
  notify { 'Applying class webapp':
  }
}
