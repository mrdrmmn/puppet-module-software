class software::apg {
    case $operatingsystem {
        Solaris: {
            $package  = "CSWapg"
            $provider = "pkgutil"
        }
    }
}
