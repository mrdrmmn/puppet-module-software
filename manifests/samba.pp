class software::samba {
    case $operatingsystem {
        Solaris: {
            $provider = "sunfreeware"
        }
    }
}
