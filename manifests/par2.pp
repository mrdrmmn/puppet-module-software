class software::par2 {
    case $operatingsystem {
        Solaris: {
            $package  = "par2cmdline"
            $provider = "blastwave"
        }
    }
}
