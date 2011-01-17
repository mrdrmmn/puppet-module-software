class software::python24 {
    case $operatingsystem {
        Solaris: {
            case $operatingsystemrelease {
                5.11: {
                    $package  = "runtime/python-24"
                }
                default: {
                    $package  = "SUNWPython"
                }
            }
        }
    }
}
