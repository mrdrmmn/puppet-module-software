# Class: software::slapd
#
# This is the git class in the software module.
#   
# Parameters:
#   
# Actions:
#   
# Requires:
#   
# Sample Usage:
#   
# [Remember: No empty lines between comments and class definition]
class software::slapd {
    case $kernel {
        SunOS: {
            case $operatingsystem {
                Solaris: {
                    case $operatingsystemrelease {
                        5.11: {
                            $package  = "library/openldap"
                        }
                        default: {
                            $package  = "SUNWopenldap"
                        }
                    }
                }
            }
        }
        Linux: {
            $package = "libapache2-mod-proxy-html"
        }
    }
}
