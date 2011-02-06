# Class: software::krb5-user
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
class software::krb5-user {
    case $kernel {
        SunOS: {
            case $operatingsystem {
                Solaris: {
                    case $operatingsystemrelease {
                        5.11: {
                            $package  = "service/security/kerberos-5"
                        }
                        default: {
                            $package  = "SUNWkrb"
                        }
                    }
                }
            }
        }
        Linux: {
            $package = "krb5-user"
        }
    }
}
