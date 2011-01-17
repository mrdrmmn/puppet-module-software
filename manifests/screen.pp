class software::screen {
    case $operatingsystem {
        Solaris: {
            case $operatingsystemrelease {
                5.11: {
                    $package  = "terminal/screen"
                }
                default: {
                    $package  = "SUNWscreen"
                }
            }
        }
    }
}
