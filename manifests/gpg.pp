class software::gpg {
    case $kernel {
        SunOS: {
            case $operatingsystem {
                Solaris: {
                    case $operatingsystemrelease {
                        default: {
                            $package  = "gnupg2"
                            $provider = "blastwave"
                        }
                    }
                }
            }
        }
        Linux: {
            $package  = "gnupg"
        }
    }
}
