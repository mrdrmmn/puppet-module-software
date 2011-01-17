class software::mysql5 {
    case $operatingsystem {
        Solaris: {
            $package  = "SUNWmysql5"
        }
    }
}
