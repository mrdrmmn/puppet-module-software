class software::git {
    case $operatingsystem {
        Solaris: {
            case $operatingsystemrelease {
                5.11: {
                    $package  = "developer/versioning/git"
                }
                default: {
                    $package  = "SUNWgit"
                }
            }
        }
        Ubuntu: {
            $package  = "git-core"
        }
    }
}
