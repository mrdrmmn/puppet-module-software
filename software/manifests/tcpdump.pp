class software::tcpdump {
    case $operatingsystem {
        Solaris: {
            $package  = "SUNWtcpdump"
        }
    }
}
