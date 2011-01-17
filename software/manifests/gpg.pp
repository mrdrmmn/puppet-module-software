class software::gpg {
    case $operatingsystem {
        Solaris: {
            $package  = "CSWgnupg"
            $provider = "pkgutil"
        }
        Ubuntu: {
            $package  = "gnupg"
        }
    }
}
