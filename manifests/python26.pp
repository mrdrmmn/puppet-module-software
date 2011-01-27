class software::python26 {
    case $operatingsystem {
        Solaris: {
            case $operatingsystemrelease {
                5.11: {
                    $package  = "runtime/python-26"
                }
                default: {
                    $package  = "SUNWPython26"
                }
            }
        }
    }
}
