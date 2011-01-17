class software::openvpn {
    case $operatingsystem {
        Solaris: {
            $package  = "CSWopenvpn"
            $provider = "pkgutil"
        }
    }
}
