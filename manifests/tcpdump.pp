# Class: software::tcpdump
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
class software::tcpdump {
    case $kernel {
        SunOS: {
            case $operatingsystem {
                Solaris: {
                    case $operatingsystemrelease {
                        5.11: {
                            $package  = "diagnostic/tcpdump"
                        }
                        default: {
                            $package  = "SUNWtcpdump"
                        }
                    }
                }
            }
        }
        Linux: {
            $package = "tcpdump"
        }
    }
}
