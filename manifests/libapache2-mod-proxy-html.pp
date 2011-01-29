# Class: software::libapache2-mod-proxy-html
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
class software::libapache2-mod-proxy-html {
    case $kernel {
        SunOS: {
            case $operatingsystem {
                Solaris: {
                    case $operatingsystemrelease {
                        5.11: {
                            $package  = "web/server/apache-22/module/apache-proxy_html"
                        }
                        default: {
                            $package  = ""
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
