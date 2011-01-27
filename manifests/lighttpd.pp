class software::lighttpd {
    case $operatingsystem {
        Solaris: {
            $package  = "web/server/lighttpd"
        }
    }
}
