# Class: software::krb5-admin-server
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
class software::krb5-admin-server {
    case $kernel {
        SunOS: {
            case $operatingsystem {
                Solaris: {
                    case $operatingsystemrelease {
                        5.11: {
                            $package  = "system/security/kerberos-5"
                        }
                        default: {
                            $package  = "SUNWkdc"
                        }
                    }
                }
            }
        }
        Linux: {
            $package = "krb5-admin-server"
        }
    }
}
