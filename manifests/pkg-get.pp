class software::pkg-get {
    case $operatingsystem {
        Solaris: {
            $package  = "BOLTpget"
            $source   = "http://www.sunfreeware.com/BOLTpget.pkg"
            $provider = "sun"
        }
    }
}
