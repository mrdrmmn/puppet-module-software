class software::git {
    case $operatingsystem {
        Solaris: {
            $package  = "developer/versioning/git"
        }
    }
}
