class software::mysql5 {
    case $operatingsystem {
        Solaris: {
            $package  = "database/mysql-51"
        }
    }
}
