# Class: software::git-core
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
class software::git-core {
    case $kernel {
        SunOS: {
            $type = "virtual"
            software { "git":
                ensure   => $ensure,
                provider => $provider,
            }
        }
        Linux: {
            $package  = "git-core"
        }
    }
}
