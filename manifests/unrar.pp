class software::unrar {
    case $operatingsystem {
        Solaris: {
            case $operatingsystemrelease {
                5.11: {
                    $package  = "archiver/unrar"
                }
                default: {
                    $package  = "SUNWunrar"
                }
            }
        }
    }
}
