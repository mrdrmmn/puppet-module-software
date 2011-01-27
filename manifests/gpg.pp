class software::gpg {
    case $operatingsystem {
        Solaris: {
            $package  = "gnupg2"
            $provider = "blastwave"
        }
    }
}
