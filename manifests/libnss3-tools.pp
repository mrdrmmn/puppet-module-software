# Class: software::libnss3-tools
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
class software::libnss3-tools {
    case $kernel {
        SunOS: {
            case $operatingsystem {
                Solaris: {
                    case $operatingsystemrelease {
                        5.11: {
                            $package  = "system/mozilla-nss"
                        }
                        default: {
                            $package  = "SUNWtlsu"
                        }
                    }
                }
            }
        }
    }
}
