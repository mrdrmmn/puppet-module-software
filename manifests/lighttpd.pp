class software::lighttpd {
    case $operatingsystem {
        Solaris: {
            $package  = "SUNWlighttpd"
        }
    }
}
