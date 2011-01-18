# Class: software::git
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
class software::git {
    case $kernel {
        SunOS: {
            case $operatingsystem {
                Solaris: {
                    case $operatingsystemrelease {
                        5.11: {
                            $package  = "developer/versioning/git"
                        }
                        default: {
                            $package  = "SUNWgit"
                        }
                    }
                }
            }
        }
        Linux: {
            $type = "virtual"
            software{ [ "git-core", "git-daemon" ]:
                ensure   => $ensure,
                provider => $provider;
            }
        }
    }
}
