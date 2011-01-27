class software::pkg-get {
    case $operatingsystem {
        Solaris: {
            $package  = "CSWpkgget"
            $source   = "http://mirror.opencsw.org/opencsw/pkg_get.pkg"
            $provider = "sun"
            file { "/usr/bin/pkg-get":
                ensure  => "/opt/csw/bin/pkg-get",
                require => Software["pkg-get"],
            }
            file { "/var/pkg-get/admin":
                ensure  => "/var/pkg-get/admin-fullauto",
                require => Software["pkg-get"],
            }
        }
    }
}
