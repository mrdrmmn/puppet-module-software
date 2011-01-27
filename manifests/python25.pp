class software::python25 {
    case $operatingsystem {
        Solaris: {
             case $operatingsystemrelease {
                 5.11: {
                     $package  = "runtime/python-25"
                 }
                 default: {
                     $package  = "SUNWPython25"
                 }
             }
        }
    }
}
