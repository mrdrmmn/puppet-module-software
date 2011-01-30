class software::apacheds {
    case $operatingsystem {
        Solaris: {
            $package  = "apacheds"
            $source   = "http://apache.cyberuse.com/directory/apacheds/unstable/1.5/1.5.7/apacheds-1.5.7-solaris-x86.pkg"
            $provider = "sun"
        }
    }
}
