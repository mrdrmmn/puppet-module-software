class software::samba {
    case $operatingsystem {
        Solaris: {
            $package  = "service/network/samba"
        }
    }
}
