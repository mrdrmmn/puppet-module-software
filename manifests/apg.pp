# Class: software::apg
#
# This is the apg class in the software module.
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
class software::apg {
    case $operatingsystem {
        Solaris: {
            $provider = "blastwave"
        }
    }
}
